class DrivesController < ApplicationController

  before_filter :check_for_login

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

  def index
    @drive=Drive.all
  end

  private

  def drive_params
    params.require(:drive).permit(:name,:details)
  end
end