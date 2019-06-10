class ChefsController < ApplicationController

	def new
		@chef = Chef.new	
	end

	def create 
		@chef = Chef.new(chef_params)
		if @chef.save
			flash[:success] = "Welcome to my recipes app"
			redirect_to chef_path(@chef)
		else
			render 'chefs/new'
		end
	end
	
	def show

	end

	private

	def chef_params
		params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
	end

end
