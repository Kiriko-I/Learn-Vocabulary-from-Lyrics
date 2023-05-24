class Admin::SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
	  @model = params[:model]
    @prefecture = params[:prefecture]
		@city = params[:city]
		@nickname = params[:nickname]
		if @model == 'post'
		  @posts = Post.search_for(@prefecture, @city).order(created_at: :desc)
		else
		  @users = User.search_for(@nickname).order(created_at: :desc)
		end
	end
	
end
