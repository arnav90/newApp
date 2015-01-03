class DrivesController < ApplicationController
  include Jadoo

  before_filter :check_for_login

  def create
    @drive = Drive.new(drive_params)
    if @drive.save
      redirect_to @drive
    else
      render template: 'drives/index'
    end
  end

  def show
    @drive = Drive.find_by_id params[:id]
    throw_404 if @drive.nil?
  end

  def index
    @drive=Drive.all
  end

  def upload_students
    @drive = Drive.find_by_id params[:drive][:id]
    file = params[:drive][:students_data].tempfile
    Jadoo::StudentImport.from_csv file, @drive
    redirect_to @drive
  end

  private

  def drive_params
    params.require(:drive).permit(:name).tap do |whitelisted|
      whitelisted[:details] = params[:drive][:details]
    end
  end
end