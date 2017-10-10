class SoldsController < ApplicationController
  before_action :set_sold, only: [:show, :edit, :update, :destroy]

  # GET /solds
  # GET /solds.json
  def index
    @search = SoldSearch.new(params[:search])
    @solds = @search.scope

  end

  # GET /solds/1
  # GET /solds/1.json
  def show
  end

  # GET /solds/new
  def new
    @sold = Sold.new
  end

  # GET /solds/1/edit
  def edit
  end

  # POST /solds
  # POST /solds.json
  def create
    @sold = Sold.new(sold_params)

    respond_to do |format|
      if @sold.save
        format.html { redirect_to products_path, notice: 'Продукт успешно продан!' }
        format.json { render :show, status: :created, location: @sold }
      else
        format.html { render :new }
        format.json { render json: @sold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solds/1
  # PATCH/PUT /solds/1.json
  def update
    respond_to do |format|
      if @sold.update(sold_params)
        format.html { redirect_to @sold, notice: 'Sold was successfully updated.' }
        format.json { render :show, status: :ok, location: @sold }
      else
        format.html { render :edit }
        format.json { render json: @sold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solds/1
  # DELETE /solds/1.json
  def destroy
    @sold.destroy
    respond_to do |format|
      format.html { redirect_to solds_url, notice: 'Sold was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sold
      @sold = Sold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sold_params
      params.require(:sold).permit(:sold_quantity, :sold_date , :product_id)
    end
end
