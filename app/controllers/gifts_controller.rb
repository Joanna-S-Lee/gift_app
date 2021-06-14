class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]
  before_action :authorize_gift, only: [:edit, :update, :destroy]


  def index
    if params[:query].present?
      # searches the Gifts table for entries that have the query as the name attribute
      @gifts = Gift.search_by_name(params[:query])
    else
      # otherwise it returns all the Gifts from the Gifts table.
      @gifts = Gift.all
    end
  end
 
  def show
  end
  
  def new
    @gift = Gift.new
  end
 
  def edit
    
  end
   
  def create
    # This attempts to create a new Gift
    @gift = Gift.new(gift_params)
    @gift.user_id = current_user.id

    if @gift.save
      redirect_to @gift, notice: 'Gift was successfully created.'
    else
      render :new
    end
  end
 
  def update
    # This attempts to update an existing Gift
    if @gift.update(gift_params)
      redirect_to @gift, notice: 'Gift was successfully updated.'
    else
      render :edit
    end
  end
 
  def destroy
    # This deletes an existing Gift
    @gift.destroy
    redirect_to gifts_url, notice: 'Gift was successfully destroyed.'
  end

  private
    

    def set_gift
      # Returns the Gift that has the primary key requested in the params
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
