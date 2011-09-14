class FixedExpensesController < ApplicationController
  layout 'moneydog'
  before_filter :require_user

  # GET /fixed_expenses
  # GET /fixed_expenses.xml
  def index
    @fixed_expenses = FixedExpense.for_user(current_user).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fixed_expenses }
    end
  end

  # GET /fixed_expenses/1
  # GET /fixed_expenses/1.xml
  def show
    @fixed_expense = FixedExpense.for_user(current_user).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fixed_expense }
    end
  end

  # GET /fixed_expenses/new
  # GET /fixed_expenses/new.xml
  def new
    @fixed_expense = FixedExpense.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fixed_expense }
    end
  end

  # GET /fixed_expenses/1/edit
  def edit
    @fixed_expense = FixedExpense.for_user(current_user).find(params[:id])
  end

  # POST /fixed_expenses
  # POST /fixed_expenses.xml
  def create
    @fixed_expense = FixedExpense.new(params[:fixed_expense])
    @fixed_expense.user_id = current_user.id

    respond_to do |format|
      if @fixed_expense.save
        flash[:notice] = 'FixedExpense was successfully created.'
        format.html { redirect_to(fixed_expenses_path) }
        format.xml  { render :xml => @fixed_expense, :status => :created, :location => @fixed_expense }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fixed_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fixed_expenses/1
  # PUT /fixed_expenses/1.xml
  def update
    @fixed_expense = FixedExpense.for_user(current_user).find(params[:id])

    respond_to do |format|
      if @fixed_expense.update_attributes(params[:fixed_expense])
        flash[:notice] = 'FixedExpense was successfully updated.'
        format.html { redirect_to(fixed_expenses_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fixed_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fixed_expenses/1
  # DELETE /fixed_expenses/1.xml
  def destroy
    @fixed_expense = FixedExpense.for_user(current_user).find(params[:id])
    @fixed_expense.destroy

    respond_to do |format|
      format.html { redirect_to(fixed_expenses_url) }
      format.xml  { head :ok }
    end
  end
end
