class FormOfPaymentsController < ApplicationController
  before_action :set_form_of_payment, only: [:show, :edit, :update, :destroy]

  # GET /form_of_payments
  # GET /form_of_payments.json
  def index
    @form_of_payments = FormOfPayment.all
  end

  # GET /form_of_payments/1
  # GET /form_of_payments/1.json
  def show
  end

  # GET /form_of_payments/new
  def new
    @form_of_payment = FormOfPayment.new
  end

  # GET /form_of_payments/1/edit
  def edit
  end

  # POST /form_of_payments
  # POST /form_of_payments.json
  def create
    @form_of_payment = FormOfPayment.new(form_of_payment_params)

    respond_to do |format|
      if @form_of_payment.save
        format.html { redirect_to new_form_of_payment_path, notice: 'Form of payment was successfully created.' }
        format.json { render :show, status: :created, location: @form_of_payment }
      else
        format.html { render :new }
        format.json { render json: @form_of_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_of_payments/1
  # PATCH/PUT /form_of_payments/1.json
  def update
    respond_to do |format|
      if @form_of_payment.update(form_of_payment_params)
        format.html { redirect_to new_form_of_payment_path, notice: 'Form of payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_of_payment }
      else
        format.html { render :edit }
        format.json { render json: @form_of_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_of_payments/1
  # DELETE /form_of_payments/1.json
  def destroy
    @form_of_payment.destroy
    respond_to do |format|
      format.html { redirect_to new_form_of_payment_path, notice: 'Form of payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_of_payment
      @form_of_payment = FormOfPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_of_payment_params
      params.require(:form_of_payment).permit(:title)
    end
end
