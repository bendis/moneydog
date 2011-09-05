class OverviewController < ApplicationController
  layout 'moneydog'
  before_filter :authenticate
  def current_month
    @fixed_incomes_amount = FixedIncome.sum(:amount)
    @current_month_fixed_expenses_amount = FixedExpense.sum(:amount)
    @current_month_expenses = Expense.current_month.all
    @current_month_incomes = Income.current_month.all
    @current_month_expenses_amount = Expense.current_month.sum(:price)
    @current_month_incomes_amount = Income.current_month.sum(:amount)
    
    @savings = Saving.all.first.amount
    @balance = @fixed_incomes_amount + @current_month_incomes_amount - (@current_month_expenses_amount + @current_month_fixed_expenses_amount) - @savings
  end
end
