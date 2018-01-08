class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
    @customers_by_date = @customers.group_by(&:published_on)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = set_customer(params[:id])
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    @customers = Customer.all
  end

  # GET /customers/new
  def new
    @gyms = Gym.all
    @customer = Customer.new  

    1.times { @customer.payments.build }
  end

  # GET /customers/1/edit
  def edit
    @customer = set_customer(params[:id])
    @gyms = Gym.all
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_path, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @customer = set_customer(params[:id])
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_path, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = set_customer(params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer(customer_id)
      Customer.find(customer_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:id, :name, :number, :second_number, :published_on, :date_of_birth, :gym_id,  payments_attributes: [:id, :_destroy, :price, :payment_date,  :gym_id] )
    end
end
