class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find_by(id: params[:id])
		@book = Book.new
	end
end
