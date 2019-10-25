class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  def index
    @buildings = Building.all
  end

  def show
  end

  def new
    @building = Building.new
    2.times { @building.stations.build }
  end

  def edit
  end

  def create
    @building = Building.new(building_params)
    if params[:back]
      render :new
    else
      if @building.save
        redirect_to buildings_path, notice: "登録が完了しました"
      else
        render :new
      end
    end
  end

  def update
    if @building.update(building_params)
      redirect_to buildings_path, notice: "登録情報が更新されました"
    else
      render :edit
    end
  end

  def destroy
  @building.destroy
    redirect_to buildings_url, notice: "登録情報が削除されました"
  end

  private
  def building_params
    params.require(:building).permit(
      :title,
      :charge,
      :address,
      :age,
      :memo,
      stations_attributes: [:building_id, :line, :name, :walk]
    )
  end

  def set_building
    @building = Building.find(params[:id])
  end
end
