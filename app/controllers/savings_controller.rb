class SavingsController < ApplicationController
  layout "moneydog"
  before_action :require_user

  def index
    @savings = Saving.for_user(current_user)

    respond_to do |format|
      format.html
      format.xml { render xml: @savings }
    end
  end

  def show
    @saving = Saving.for_user(current_user).find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render xml: @saving }
    end
  end

  def new
    @saving = Saving.new

    respond_to do |format|
      format.html
      format.xml { render xml: @saving }
    end
  end

  def edit
    @saving = Saving.for_user(current_user).find(params[:id])
  end

  def create
    @saving = Saving.new(saving_params)
    @saving.user_id = current_user.id

    respond_to do |format|
      if @saving.save
        flash[:notice] = "Saving was successfully created."
        format.html { redirect_to savings_path }
        format.xml { render xml: @saving, status: :created, location: @saving }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.xml { render xml: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @saving = Saving.for_user(current_user).find(params[:id])

    respond_to do |format|
      if @saving.update(saving_params)
        flash[:notice] = "Saving was successfully updated."
        format.html { redirect_to savings_path }
        format.xml { head :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.xml { render xml: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @saving = Saving.for_user(current_user).find(params[:id])
    @saving.destroy

    respond_to do |format|
      format.html { redirect_to savings_url }
      format.xml { head :ok }
    end
  end

  private

  def saving_params
    params.require(:saving).permit(:amount)
  end
end
