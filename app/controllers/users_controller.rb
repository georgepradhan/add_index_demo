class UsersController < ApplicationController
  include ApplicationHelper
  
  def index
    @current_page = current_page
    @users = User.page(@current_page)
  end

end


