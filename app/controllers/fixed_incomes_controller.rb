class FixedIncomesController < ApplicationController
  layout "moneydog"
  before_action :require_user

  def index
    @fixed_incomes = FixedIncome.for_user(current_user)

    respond_to do |format|
      format.html
      format.xml { render xml: @fixed_incomes }
    end
  end

  def show
    @fixed_income = FixedIncome.for_user(current_user).find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render xml: @fixed_income }
    end
  end

  def new
    @fixed_income = FixedIncome.new

    respond_to do |format|
      format.html
      format.xml { render xml: @fixed_income }
    end
  end

  def edit
    @fixed_income = FixedIncome.for_user(current_user).find(params[:id])
  end

  def create
    @fixed_income = FixedIncome.new(fixed_income_params)
    @fixed_income.user_id = current_user.id

    respond_to do |format|
      if @fixed_income.save
        flash[:notice] = "FixedIncome was successfully created."
        format.html { redirect_to fixed_incomes_path }
        format.xml { render xml: @fixed_income, status: :created, location: @fixed_income }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.xml { render xml: @fixed_income.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @fixed_income = FixedIncome.for_user(current_user).find(params[:id])

    respond_to do |format|
      if @fixed_income.update(fixed_income_params)
        flash[:notice] = "FixedIncome was successfully updated."
        format.html { redirect_to fixed_incomes_path }
        format.xml { head :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.xml { render xml: @fixed_income.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fixed_income = FixedIncome.for_user(current_user).find(params[:id])
    @fixed_income.destroy

    respond_to do |format|
      format.html { redirect_to fixed_incomes_url }
      format.xml { head :ok }
    end
  end

  private

  def fixed_income_params
    params.require(:fixed_income).permit(:name, :amount, :valid_from, :valid_to)
  end
end
