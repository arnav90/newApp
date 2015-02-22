require 'csv'

module Jadoo
  class StudentHelpers
    class << self
      def import_from_csv(file,drive)
        students = CSV.read(file, headers: true)
        students.each do |row|
          student = Student.new({details: row.to_hash,drive: drive})
          student.save
        end
        drive.update(student_fields: students.headers.join('|*|'))
        drive
      end

      def search_for_students(drive,query, fields=[])
        fields = fields.empty? ? DriveHelpers.student_fields(drive) : fields
        fields.each do |field|

        end
      end
    end
  end
end