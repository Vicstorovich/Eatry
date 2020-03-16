class Admin::ProductsController < Admin::ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(2)
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to [:admin, @product], notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if product.update(product_params)
      redirect_to [:admin, @product], notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    product.destroy
    redirect_to admin_products_path, notice: 'Product was successfully destroyed.'
  end

  private

  def product
    @product = Product.find(params[:id])
  end
  helper_method :product

  def product_params
    params.require(:product).permit(:title, :description, :image, :price, :category_id)
  end
end
