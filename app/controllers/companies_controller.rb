class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  # GET /companies
  def index
    @q = Company.ransack(params[:q])
    @companies = @q.result.includes(:category, :member)
  end

  # GET /companies/1
  def show
    @phones = Phone.where(params[:company_id])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: "Company was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: "Company was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy!
    redirect_to companies_url, notice: "Company was successfully destroyed.", status: :see_other
  end

  def get_address_by_zipcode
    address_info = ViaCepService.get_address(params[:zipcode])
    render json: address_info
  end

  def export_to_xls_companies
    @companies = Company.includes(:category, :member)

    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=lista-de-empresas-canaa.xlsx"
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :zipcode, :address, :number, :neighborhood, :city, :state, :description, :address_map, :latitude, :longitude, :complement, :category_id, :member_id, :logo, phones_attributes: [:id, :phone_number, :phone_type, :_destroy])
    end
end
