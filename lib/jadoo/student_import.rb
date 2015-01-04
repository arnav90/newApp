require 'csv'

module Jadoo
  class StudentImport
    class << self
      def from_csv(file,drive)
        students = CSV.read(file, headers: true)
        students.each do |row|
          student = Student.new({details: row.to_hash,drive: drive})
          student.save
        end
        drive.update(student_fields: students.headers.join('|*|'))
        drive
      end
    end
  end
end