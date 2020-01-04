class Merchants::BaseController < ApplicationController
  before_action :require_merchant

  private
    def require_merchant
      not_found unless user_role("merchant")
    end
end