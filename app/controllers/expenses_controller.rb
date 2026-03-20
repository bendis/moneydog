class ExpensesController < ApplicationController
  layout "moneydog"
  before_action :require_user

  def index
    @expenses = Expense.for_user(current_user)
    @sum = Expense.for_user(current_user).sum(:price)

    respond_to do |format|
      format.html
      format.iphone { render layout: false }
      format.xml { render xml: @expenses }
    end
  end

  def stats
    @total = Expense.for_user(current_user).sum(:price)
    range = Date.today.beginning_of_month..Date.today.end_of_month
    @current_month = Expense.for_user(current_user).where(date: range).sum(:price)
    @benzin = Expense.for_user(current_user).where("name LIKE 'Benz%'").sum(:price)
    @obed = Expense.for_user(current_user).where("name LIKE '%oběd%'").sum(:price)
    @nakup = Expense.for_user(current_user).where("name LIKE 'Nákup%'").sum(:price)

    respond_to do |format|
      format.html
    end
  end

  def show
    @expense = Expense.for_user(current_user).find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render xml: @expense }
    end
  end

  def new
    @expense = Expense.new

    respond_to do |format|
      format.html
      format.iphone { render layout: false }
      format.xml { render xml: @expense }
    end
  end

  def edit
    @expense = Expense.for_user(current_user).find(params[:id])

    respond_to do |format|
      format.html
      format.iphone { render layout: false }
    end
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id

    respond_to do |format|
      if @expense.save
        flash[:notice] = "Expense was successfully created."
        format.html { redirect_to expenses_path }
        format.iphone { redirect_to expenses_path }
        format.xml { render xml: @expense, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.iphone { render :new, layout: false, status: :unprocessable_entity }
        format.xml { render xml: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @expense = Expense.for_user(current_user).find(params[:id])

    respond_to do |format|
      if @expense.update(expense_params)
        flash[:notice] = "Expense was successfully updated."
        format.html { redirect_to expenses_path }
        format.xml { head :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.xml { render xml: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense = Expense.for_user(current_user).find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.iphone { redirect_to root_url }
      format.xml { head :ok }
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :price, :date, :from_savings)
  end
end
