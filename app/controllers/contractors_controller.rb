class ContractorsController < ApplicationController
  before_action :contractor, only: [:show, :edit]
  before_action :sidebar

  def index
  end

  def show
  end

  def new
    @contractor = Contractor.new
    @address = @contractor.build_address
  end

  def create
    @contractor = Contractor.new(contractor_params)
    if contractor.save
      redirect_to contractor, notice: "Utworzono poprawnie"
    else
      flash[:alert] = "Niektóre pola są niepoprawne"
      render :new
    end
  end

  def edit
  end

  def update
    if contractor.update_attributes(contractor_params)
      redirect_to contractor, notice: "Zaktualizowano poprawnie"
    else
      flash[:alert] = "Niektóre pola są niepoprawne"
      render :edit
    end
  end

  def destroy
  end

  private
  def contractor_params
    params.require(:contractor).permit(:name, :nip, :phone, :person, :type,
      address_attributes: [:id, :street, :building, :unit, :city, :zip_code])
  end

  def contractor
    @contractor ||= Contractor.find(params[:id])
  end

  def sidebar
    @contractors = Contractor.all
  end
end