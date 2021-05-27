class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]
  before_action :authorize_gift, only: [:edit, :update, :destroy]

  # GET /gifts
  # def index
  #   @gifts = Gift.all
  # end

  def index
    if params[:query].present?
      @gifts = Gift.search_by_name(params[:query])
    else
      @gifts = Gift.all
    end
  end

  # GET /gifts/1
  def show
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
    
  end

    # POST /gifts
  def create
    @gift = Gift.new(gift_params)
    @gift.user_id = current_user.id

    if @gift.save
      redirect_to @gift, notice: 'Gift was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gifts/1
  def update
    if @gift.update(gift_params)
      redirect_to @gift, notice: 'Gift was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gifts/1
  def destroy
    @gift.destroy
    redirect_to gifts_url, notice: 'Gift was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gift_params
      params.require(:gift).permit(:name, :description, :availability, :user_id, :picture)
    end

    # authorize Gift
    def authorize_gift
      authorize! :manage, @gift      
    end
end
