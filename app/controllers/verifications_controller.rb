class VerificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee
  
  def index
    @verifications = @employee.verifications
  end

  def new
    @verification = @employee.verifications.new
  end

  def create
    @employee = Employee.find_by(id: params[:employee_id])
    if @employee
      @verification = @employee.verifications.new(verification_params)
      if @verification.save
        redirect_to employee_verifications_path(@employee), notice: 'Verification created successfully.'
      else
        render :new
      end
    else
      redirect_to root_path, alert: 'Employee not found.'
    end
  end

  private

  def set_employee
    @employee = Employee.find_by(id: params[:employee_id])
    unless @employee
      redirect_to root_path, alert: 'Employee not found.'
    end
  end

  def verification_params
    params.require(:verification).permit(:status, :company_id, :employee_id)
  end
end
