class MoniesController < ApplicationController
  before_action :set_mony, only: [:show, :edit, :update, :destroy]

  # GET /monies
  # GET /monies.json
  def index
    @monies = Mony.order(:date_of_transaction).all.reverse
    @monies_total = Mony.total
    @monies_spent = Mony.spent
    @transactions = Mony.count
    @transactions_this_month = Mony.transactions_this_month
    @transactions_last_month = Mony.transactions_last_month
    @spent_this_month = Mony.spent_this_month
    @spent_last_month = Mony.spent_last_month
    @biggest_expense = Mony.biggest_expense
    @biggest_expense_last_month = Mony.biggest_expense_last_month
    @negative = Mony.negative_balance
    @biggest_recipient = Mony.biggest_recipient
  end

  # GET /monies/1
  # GET /monies/1.json
  def show
  end

  # GET /monies/new
  def new
    @mony = Mony.new
  end

  # GET /monies/1/edit
  def edit
  end

  # POST /monies
  # POST /monies.json
  def create
    @mony = Mony.new(mony_params)

    respond_to do |format|
      if @mony.save
        format.html { redirect_to @mony, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @mony }
      else
        format.html { render :new }
        format.json { render json: @mony.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monies/1
  # PATCH/PUT /monies/1.json
  def update
    respond_to do |format|
      if @mony.update(mony_params)
        format.html { redirect_to @mony, notice: 'Mony was successfully updated.' }
        format.json { render :show, status: :ok, location: @mony }
      else
        format.html { render :edit }
        format.json { render json: @mony.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monies/1
  # DELETE /monies/1.json
  def destroy
    @mony.destroy
    respond_to do |format|
      format.html { redirect_to monies_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mony
      @mony = Mony.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mony_params
      params.require(:mony).permit(:other_party, :amount, :date_of_transaction)
    end
end
