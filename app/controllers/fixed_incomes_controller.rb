class FixedIncomesController < ApplicationController
  layout 'moneydog'
  before_filter :require_user
  # GET /fixed_incomes
  # GET /fixed_incomes.xml
  def index
    @fixed_incomes = FixedIncome.for_user(current_user).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fixed_incomes }
    end
  end

  # GET /fixed_incomes/1
  # GET /fixed_incomes/1.xml
  def show
    @fixed_income = FixedIncome.for_user(current_user).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fixed_income }
    end
  end

  # GET /fixed_incomes/new
  # GET /fixed_incomes/new.xml
  def new
    @fixed_income = FixedIncome.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fixed_income }
    end
  end

  # GET /fixed_incomes/1/edit
  def edit
    @fixed_income = FixedIncome.for_user(current_user).find(params[:id])
  end

  # POST /fixed_incomes
  # POST /fixed_incomes.xml
  def create
    @fixed_income = FixedIncome.new(params[:fixed_income])
    @fixed_income.user_id = current_user.id

    respond_to do |format|
      if @fixed_income.save
        flash[:notice] = 'FixedIncome was successfully created.'
        format.html { redirect_to(fixed_incomes_path) }
        format.xml  { render :xml => @fixed_income, :status => :created, :location => @fixed_income }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fixed_income.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fixed_incomes/1
  # PUT /fixed_incomes/1.xml
  def update
    @fixed_income = FixedIncome.for_user(current_user).find(params[:id])

    respond_to do |format|
      if @fixed_income.update_attributes(params[:fixed_income])
        flash[:notice] = 'FixedIncome was successfully updated.'
        format.html { redirect_to(fixed_incomes_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fixed_income.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fixed_incomes/1
  # DELETE /fixed_incomes/1.xml
  def destroy
    @fixed_income = FixedIncome.for_user(current_user).find(params[:id])
    @fixed_income.destroy

    respond_to do |format|
      format.html { redirect_to(fixed_incomes_url) }
      format.xml  { head :ok }
    end
  end
end
