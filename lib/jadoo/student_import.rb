require 'csv'

module Jadoo
  class StudentImport
    class << self
      def from_csv(file,drive)
        CSV.foreach(file,headers: true) do |row|
          student = Student.new({details: row.to_hash,drive: drive})
          student.save
        end
      end
    end
  end
end