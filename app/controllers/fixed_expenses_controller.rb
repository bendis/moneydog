class FixedExpensesController < ApplicationController
  layout "moneydog"
  before_action :require_user

  def index
    @fixed_expenses = FixedExpense.for_user(current_user)

    respond_to do |format|
      format.html
      format.xml { render xml: @fixed_expenses }
    end
  end

  def show
    @fixed_expense = FixedExpense.for_user(current_user).find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render xml: @fixed_expense }
    end
  end

  def new
    @fixed_expense = FixedExpense.new

    respond_to do |format|
      format.html
      format.xml { render xml: @fixed_expense }
    end
  end

  def edit
    @fixed_expense = FixedExpense.for_user(current_user).find(params[:id])
  end

  def create
    @fixed_expense = FixedExpense.new(fixed_expense_params)
    @fixed_expense.user_id = current_user.id

    respond_to do |format|
      if @fixed_expense.save
        flash[:notice] = "FixedExpense was successfully created."
        format.html { redirect_to fixed_expenses_path }
        format.xml { render xml: @fixed_expense, status: :created, location: @fixed_expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.xml { render xml: @fixed_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @fixed_expense = FixedExpense.for_user(current_user).find(params[:id])

    respond_to do |format|
      if @fixed_expense.update(fixed_expense_params)
        flash[:notice] = "FixedExpense was successfully updated."
        format.html { redirect_to fixed_expenses_path }
        format.xml { head :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.xml { render xml: @fixed_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fixed_expense = FixedExpense.for_user(current_user).find(params[:id])
    @fixed_expense.destroy

    respond_to do |format|
      format.html { redirect_to fixed_expenses_url }
      format.xml { head :ok }
    end
  end

  private

  def fixed_expense_params
    params.require(:fixed_expense).permit(:name, :amount, :valid_from, :valid_to)
  end
end
