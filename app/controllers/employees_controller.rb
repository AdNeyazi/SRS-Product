class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :educational_info, :personal_info]
  # before_action :authorize_employee, only: [:educational_info, :personal_info]

  def index
    @employees = Employee.order(:id)
  end

  def new
    @employee = Employee.new
  end

  def create
    if current_user.company?
      @employee = current_user.employees.build(employee_params)
      if @employee.save
        redirect_to @employee, notice: 'Employee was successfully created.'
      else
        render :new
      end
    else
      redirect_to root_path, alert: 'You are not authorized to create employees.'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully destroyed.'
  end

  def educational_info
    @employee = Employee.find(params[:id])
  end

  def personal_info
    @employee = Employee.find(params[:id])
  end

  def update_educational_info
    if @employee.update(educational_info_params)
      redirect_to @employee, notice: 'Educational information was successfully updated.'
    else
      render :educational_info
    end
  end

  def update_personal_info
    if @employee.update(personal_info_params)
      redirect_to @employee, notice: 'Personal information was successfully updated.'
    else
      render :personal_info
    end
  end

  
  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  # def authorize_employee
  #   unless current_user.role == 'employee'
  #     redirect_to root_path, alert: 'You are not authorized to access this page.'
  #   end
  # end

  def educational_info_params
    params.require(:employee).permit(:field_of_study, :university, :graduation_year, :gpa, :additional_degrees)
  end

  def personal_info_params
    params.require(:employee).permit(:birthdate, :address, :gender, :marital_status, :nationality, :emergency_contact, :emergency_contact_relationship)
  end

  def employee_params
    params.require(:employee).permit(:name, :email, :active, :degree, :field_of_study, :university, :graduation_year, :gpa, :additional_degrees, :educational_history, :birthdate, :address, :phone_number, :gender, :marital_status, :nationality, :emergency_contact, :emergency_contact_relationship)
  end

end
