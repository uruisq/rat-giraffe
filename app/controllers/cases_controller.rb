class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy]

  def index
    @cases = Case.all
  end

  def show
  end

  def new
    @case = Case.new
    2.times { @case.stations.build }
  end

  def edit
  end

  def create
    @case = Case.new(case_params)

    respond_to do |format|
      if @case.save
        format.html { redirect_to @case, notice: 'Case was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to @case, notice: 'Case was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @case.destroy
    respond_to do |format|
      format.html { redirect_to cases_url, notice: 'Case was successfully destroyed.' }
    end
  end

  private
    def set_case
      @case = Case.find(params[:id])
    end

    def case_params
      params.require(:case).permit(
        :title,
        :charge,
        :address,
        :age,
        :memo,
        stations_attributes: [:id, :line, :name, :walk]
      )
    end
end
