class Admin::HomesController < ApplicationController
  before_action :authenticate_admin_user!

  def top
  end
  
end
