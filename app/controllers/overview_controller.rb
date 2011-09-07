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
    @savings = Saving.first.amount
    
    number_of_weeks = Time.days_in_month(Date.today.month).to_f / 7
    
    weekly_to_spend = (@fixed_incomes_amount - @current_month_fixed_expenses_amount - @savings) / number_of_weeks
    
    @weekly_balance = Array.new
    number_of_weeks.to_i.times do |i|
      current_week_expenses = Expense.all_for_week(i).sum(:price)
      current_week_incomes = Income.all_for_week(i).sum(:amount)
      @weekly_balance << weekly_to_spend - current_week_expenses + current_week_incomes
    end
    
    @balance = @fixed_incomes_amount + @current_month_incomes_amount - (@current_month_expenses_amount + @current_month_fixed_expenses_amount) - @savings
  end
end
