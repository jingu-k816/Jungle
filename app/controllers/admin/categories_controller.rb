class Admin::CategoriesController < Admin::BaseController
  def index
    @admin_categories = Category.order(id: :desc).all
    @product_count = Product.group(:category_id).count
    p @product_count
  end

  def new
    @admin_category = Category.new
  end

  def create
    @admin_category = Category.new(category_params)

    if @admin_category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
