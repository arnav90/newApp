module Jadoo
  class DriveHelpers
    class << self
      def student_fields(drive)
        drive.student_fields.split('|*|') unless drive.student_fields.nil?
      end
    end
  end
end