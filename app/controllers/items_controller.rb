class ItemsController < ApplicationController
  def index
    @active_items = Item.all_active
  end

  def show
    Item.find_by(id: params[:id])
  end
end