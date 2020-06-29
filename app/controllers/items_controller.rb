class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.show(item_params)
  end

  # 商品出品
  def new
    @item = Item.new
    @item.images.new

    # @brands = Brand.all
    # @brand_array = [nil]
    # @brands.each do |brand|
    #   @beand_array << [brand.name, brand.id]
    # end
  end

  # 商品購入
  def buy

  end

  # ＃商品詳細（仮）
  def item_details

  end

  #商品編集(仮)
  def change
    
  end

  #商品削除（仮）
  def cut

  end

  # GET /items/1/edit
  def edit
    # @item = Item.find(params[:id]
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to '/'
      else
        render 'items/new'
      end
      
    # respond_to do |format|
    #   if @item.save
    #     format.html { redirect_to @item, notice: 'Item was successfully created.' }
    #     format.json { render :show, status: :created, location: @item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      reder :edit
    end
    # respond_to do |format|
    #   if @item.update(item_params)
    #     format.html { redirect_to @item, notice: 'Item was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @item }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    redirect_to root_path
    # respond_to do |format|
    #   format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :introduce, :status, :shipping_fee, :shipping_area, :shipping_day, :price_introduce, :user_id, :category_id, :brand_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
    end
end
