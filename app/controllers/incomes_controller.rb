class IncomesController < ApplicationController
  layout "moneydog"
  before_action :require_user

  def index
    @incomes = Income.for_user(current_user)

    respond_to do |format|
      format.html
      format.xml { render xml: @incomes }
    end
  end

  def show
    @income = Income.for_user(current_user).find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render xml: @income }
    end
  end

  def new
    @income = Income.new

    respond_to do |format|
      format.html
      format.xml { render xml: @income }
    end
  end

  def edit
    @income = Income.for_user(current_user).find(params[:id])
  end

  def create
    @income = Income.new(income_params)
    @income.user_id = current_user.id

    respond_to do |format|
      if @income.save
        flash[:notice] = "Income was successfully created."
        format.html { redirect_to incomes_path }
        format.xml { render xml: @income, status: :created, location: @income }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.xml { render xml: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @income = Income.for_user(current_user).find(params[:id])

    respond_to do |format|
      if @income.update(income_params)
        flash[:notice] = "Income was successfully updated."
        format.html { redirect_to incomes_path }
        format.xml { head :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.xml { render xml: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @income = Income.for_user(current_user).find(params[:id])
    @income.destroy

    respond_to do |format|
      format.html { redirect_to incomes_url }
      format.xml { head :ok }
    end
  end

  private

  def income_params
    params.require(:income).permit(:name, :amount, :date)
  end
end
