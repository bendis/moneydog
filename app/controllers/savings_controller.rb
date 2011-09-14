class SavingsController < ApplicationController
  before_filter :require_user
  layout 'moneydog'
  # GET /savings
  # GET /savings.xml
  def index
    @savings = Saving.for_user(current_user).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @savings }
    end
  end

  # GET /savings/1
  # GET /savings/1.xml
  def show
    @saving = Saving.for_user(current_user).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @saving }
    end
  end

  # GET /savings/new
  # GET /savings/new.xml
  def new
    @saving = Saving.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @saving }
    end
  end

  # GET /savings/1/edit
  def edit
    @saving = Saving.for_user(current_user).find(params[:id])
  end

  # POST /savings
  # POST /savings.xml
  def create
    @saving = Saving.new(params[:saving])
    @saving.user_id = current_user.id

    respond_to do |format|
      if @saving.save
        flash[:notice] = 'Saving was successfully created.'
        format.html { redirect_to(savings_path) }
        format.xml  { render :xml => @saving, :status => :created, :location => @saving }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @saving.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /savings/1
  # PUT /savings/1.xml
  def update
    @saving = Saving.for_user(current_user).find(params[:id])

    respond_to do |format|
      if @saving.update_attributes(params[:saving])
        flash[:notice] = 'Saving was successfully updated.'
        format.html { redirect_to(savings_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @saving.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /savings/1
  # DELETE /savings/1.xml
  def destroy
    @saving = Saving.for_user(current_user).find(params[:id])
    @saving.destroy

    respond_to do |format|
      format.html { redirect_to(savings_url) }
      format.xml  { head :ok }
    end
  end
end
