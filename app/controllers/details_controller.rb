class DetailsController < ApplicationController
  def create
    @employee = Employee.find(params[:employee_id])
    @detail = @employee.details.create(detail_params)
    redirect_to employee_path(@employee)
  end
  def destroy
    @employee = Employee.find(params[:employee_id])
    @detail = @employee.details.find(params[:id])
    @detail.destroy
    redirect_to employee_path(@employee)
  end
  private
    def detail_params
      params.require(:detail).permit(:project_name,:discription)
    end
end
