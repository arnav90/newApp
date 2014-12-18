class DrivesController < ApplicationController

  def new
   @drive = Drive.new
  end

  def create
    @drive = Drive.new(drive_params)
    if @drive.save
      redirect_to @drive
    else
      render template: 'drives/new'
    end
  end

  def show
    @drive = Drive.find_by_id params[:id]
  end

  private

  def drive_params
    params.require(:drive).permit(:name,:details)
  end
end