class Admin::CategoriesController < Admin::BaseController
	before_filter :get_category, only: [:destroy, :edit, :update]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash.now[:success] = "Category Added Successfully."
			redirect_to admin_categories_path
		else
			flash.now[:danger] = @category.errors.full_messages
			render :new
		end
	end

	def edit
	end

	def update
		if @category.update_attributes(category_params)
			flash.now[:success] = "Category Updated Successfully."
			redirect_to admin_categories_path
		else
			flash.now[:danger] = @category.errors.full_messages
			render :edit
		end
	end

	def destroy
		if @category.destroy
			flash.now[:success] = "Category Removed."
		else
			flash.now[:danger] = "Something Went Wrong. Please Try Again."
		end
	end

	private
	def category_params
		params.require(:category).permit(:name) 
	end

	def get_category
		@category = Category.find(params[:id])		
	end
end