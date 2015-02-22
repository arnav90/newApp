class StudentsController < ApplicationController
  include Jadoo
  def search
    @students = []
    query_text = "%#{params['query']}%"
    drive = Drive.find(params['drive'])
    @students = Jadoo::StudentHelpers.search_for_students(drive, query_text)
  end
end