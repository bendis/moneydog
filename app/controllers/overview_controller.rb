class OverviewController < ApplicationController
  layout 'moneydog'
  before_filter :require_user
  def current_month
    @fixed_incomes_amount = FixedIncome.for_user(current_user).sum(:amount)
    @current_month_fixed_expenses_amount = FixedExpense.for_user(current_user).sum(:amount)
    @current_month_expenses = Expense.for_user(current_user).current_month.not_from_savings.all
    @current_month_incomes = Income.for_user(current_user).current_month.all
    @current_month_expenses_amount = Expense.for_user(current_user).current_month.not_from_savings.sum(:price)
    @current_month_incomes_amount = Income.for_user(current_user).current_month.sum(:amount)
    
    begin
      @savings = Saving.for_user(current_user).first.amount
    rescue
      @savings = 0
    end
    
    number_of_weeks = Time.days_in_month(Date.today.month).to_f / 7
    
    weekly_to_spend = (@fixed_incomes_amount - @current_month_fixed_expenses_amount - @savings) / number_of_weeks
    
    @weekly_balance = Array.new
    number_of_weeks.to_i.times do |i|
      current_week_expenses = Expense.for_user(current_user).all_for_week(i).not_from_savings.sum(:price)
      current_week_incomes = Income.for_user(current_user).all_for_week(i).sum(:amount)
      @weekly_balance << weekly_to_spend - current_week_expenses + current_week_incomes
    end
    
    @balance = @fixed_incomes_amount + @current_month_incomes_amount - (@current_month_expenses_amount + @current_month_fixed_expenses_amount) - @savings
    
  end
end
