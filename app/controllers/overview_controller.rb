class OverviewController < ApplicationController
  layout "moneydog"
  before_action :require_user

  def current_month
    date_string = Date.today

    @fixed_incomes_amount = FixedIncome.for_user(current_user).valid(date_string).sum(:amount)
    @current_month_fixed_expenses_amount = FixedExpense.for_user(current_user).valid(date_string).sum(:amount)
    @current_month_expenses = Expense.for_user(current_user).current_month.not_from_savings
    @current_month_incomes = Income.for_user(current_user).current_month
    @current_month_expenses_amount = Expense.for_user(current_user).current_month.not_from_savings.sum(:price)
    @current_month_incomes_amount = Income.for_user(current_user).current_month.sum(:amount)

    saving_record = Saving.for_user(current_user).first
    @savings = saving_record ? saving_record.amount.to_f : 0.0

    number_of_weeks = Time.days_in_month(Date.today.month).to_f / 7
    weekly_to_spend = (@fixed_incomes_amount - @current_month_fixed_expenses_amount - @savings) / number_of_weeks

    @weekly_balance = []
    number_of_weeks.to_i.times do |i|
      current_week_expenses = Expense.for_user(current_user).all_for_week(i).not_from_savings.sum(:price)
      current_week_incomes = Income.for_user(current_user).all_for_week(i).sum(:amount)
      @weekly_balance << weekly_to_spend - current_week_expenses + current_week_incomes
    end

    @balance = @fixed_incomes_amount + @current_month_incomes_amount -
               (@current_month_expenses_amount + @current_month_fixed_expenses_amount) - @savings
  end

  def month
    date_string = params[:date_string]

    @fixed_incomes_amount = FixedIncome.for_user(current_user).valid(date_string).sum(:amount)
    @month_fixed_expenses_amount = FixedExpense.for_user(current_user).valid(date_string).sum(:amount)
    @month_expenses = Expense.for_user(current_user).month(date_string).not_from_savings
    @month_incomes = Income.for_user(current_user).month(date_string)
    @month_expenses_amount = Expense.for_user(current_user).month(date_string).not_from_savings.sum(:price)
    @month_incomes_amount = Income.for_user(current_user).month(date_string).sum(:amount)

    saving_record = Saving.for_user(current_user).first
    @savings = saving_record ? saving_record.amount.to_f : 0.0

    number_of_weeks = Time.days_in_month(date_string.to_date.month).to_f / 7
    weekly_to_spend = (@fixed_incomes_amount - @month_fixed_expenses_amount - @savings) / number_of_weeks

    @weekly_balance = []
    number_of_weeks.to_i.times do |i|
      current_week_expenses = Expense.for_user(current_user).all_for_week_in_month(i, date_string).not_from_savings.sum(:price)
      current_week_incomes = Income.for_user(current_user).all_for_week_in_month(i, date_string).sum(:amount)
      @weekly_balance << weekly_to_spend - current_week_expenses + current_week_incomes
    end

    @balance = @fixed_incomes_amount + @month_incomes_amount -
               (@month_expenses_amount + @month_fixed_expenses_amount) - @savings
  end
end
