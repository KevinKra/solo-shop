class ItemsController < ApplicationController
  def index
    @active_items = Item.all_active
  end
end