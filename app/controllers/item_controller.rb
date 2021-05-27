class ItemController < ApplicationController
  def page
    @gifts = Gift.all
  end
end
