class ExpensesController < ApplicationController

  layout 'moneydog'
  before_filter :require_user
  # GET /expenses
  # GET /expenses.xml
  def index
    @expenses = Expense.for_user(current_user).all(:order => "date DESC")
    @sum = Expense.for_user(current_user).sum(:price)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @expenses }
    end
  end
  
  def stats
    @total = Expense.for_user(current_user).sum('price')
    
    range = Date.today.beginning_of_month..Date.today.end_of_month
    
    @current_month = Expense.for_user(current_user).sum('price', :conditions => {:date => range})
    @benzin = Expense.for_user(current_user).sum('price', :conditions => "name LIKE 'Benz%'")
    @obed = Expense.for_user(current_user).sum('price', :conditions => "name LIKE '%oběd%'")
    @nakup = Expense.for_user(current_user).sum('price', :conditions => "name LIKE 'Nákup%'")
    
    respond_to do |format|
      format.html # stats.html.erb
    end
  end

  # GET /expenses/1
  # GET /expenses/1.xml
  def show
    @expense = Expense.for_user(current_user).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @expense }
    end
  end

  # GET /expenses/new
  # GET /expenses/new.xml
  def new
    @expense = Expense.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @expense }
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.for_user(current_user).find(params[:id])
  end

  # POST /expenses
  # POST /expenses.xml
  def create
    @expense = Expense.new(params[:expense])
    @expense.user_id = current_user.id

    respond_to do |format|
      if @expense.save
        flash[:notice] = 'Expense was successfully created.'
        format.html { redirect_to(expenses_path) }
        format.xml  { render :xml => @expense, :status => :created, :location => @expense }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.xml
  def update
    @expense = Expense.for_user(current_user).find(params[:id])

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        flash[:notice] = 'Expense was successfully updated.'
        format.html { redirect_to(expenses_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.xml
  def destroy
    @expense = Expense.for_user(current_user).find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to(expenses_url) }
      format.xml  { head :ok }
    end
  end
  
end
