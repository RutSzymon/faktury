class CompaniesController < ApplicationController
  before_action :company, only: :edit

  def edit
  end

  def update
    if company.update_attributes(company_params)
      redirect_to [:edit, company], notice: "Zaktualizowano poprawnie"
    else
      flash[:alert] = "Niektóre pola są niepoprawne"
      render :edit
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :nip, :phone, :person, :type,
      address_attributes: [:id, :street, :building, :unit, :city, :zip_code])
  end

  def company
    @company ||= Company.find(params[:id])
  end
end