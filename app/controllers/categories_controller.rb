class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @appointment.save
      redirect_to categories_path, notice: "Category was successfully created."
      else
        render :new
    end
  end

    def edit
    end

    def update
       if @category.update(category_params)
         redirect_to category_path, notice: "Category was successfully updated."
       else
         render :edit
       end
    end

    def destroy
       @category.destroy
       redirect_to category_path, notice: "Category was successfully destroyed."
    end

    private

    def set_category
       @category = Category.find(params[:id])
    end

    def category_params
       params.require(:category).permit(:user_id, :name, :amount, :icon)
    end

end
