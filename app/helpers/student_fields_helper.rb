module StudentFieldsHelper
  def student_fields drive
    Jadoo::DriveHelpers.student_fields(drive)
  end
end