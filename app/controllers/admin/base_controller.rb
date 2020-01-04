class Admin::BaseController < ApplicationController
  before_action :require_admin

  private
    def require_admin
      not_found unless user_role("admin")
    end
end