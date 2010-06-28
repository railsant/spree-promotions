class Admin::PromotionsController < Admin::BaseController
  def index
    @promotions = Promotion.find(:all)
  end

  def destroy
    promotion = Promotion.find(params[:id])
    promotion.destroy
    redirect_to :action => "index"
  end

  def new
    @promotion = Promotion.new
    @products = Product.find(:all)
  end

  def create
    Promotion.create(params[:promotion])
    redirect_to :action => "index"
  end
  
  def edit
    @promotion = Promotion.find(params[:id])
  end
  
  def update
    @promotion = Promotion.find(params[:id])
    if @promotion.update_attributes(params[:promotion])
      flash[:notice] = 'Promotion was successfully updated.'
      redirect_to :action => 'edit'
    else
      render :action => "edit"
    end
  end
  
  def show
    @promotion = Promotion.find(params[:id])
  end
  
  def add_product
    @promotion = Promotion.find(params[:id])
    @product = Variant.find(params[:variant_id]).product
    @promotion.products << @product unless @promotion.products.include?(@product)
    @promotion.save
    render :partial => "products_table", :locals => {:promotion => @promotion}
  end
  
  def remove_product
    @promotion = Promotion.find(params[:id])
    @product = Product.find(params[:product_id])
    @promotion.products.delete(@product) if @promotion.products.include?(@product)
    @promotion.save
    render_js_for_destroy
  end
end
