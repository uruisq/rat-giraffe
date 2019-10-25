class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy]

  def favindex
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
    if params[:back]
      render :new
    else
      if @case.save
        redirect_to cases_path, notice: "Case was successfully created."
      else
        render :new
      end
    end
  end

  def update
    if @case.update(case_params)
      redirect_to cases_path, notice: "Case was successfully updated."
    else
      render :edit
    end
  end

  def destroy
  @case.destroy
    redirect_to cases_url, notice: "Case was successfully destroyed."
  end

  private
  def case_params
    params.require(:case).permit(
      :title,
      :charge,
      :address,
      :age,
      :memo,
      stations_attributes: [:case_id, :line, :name, :walk]
    )
  end

  def set_case
    @case = Case.find(params[:id])
  end
end
