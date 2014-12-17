require 'rails_helper'

describe Student , type: :Model do
  it 'should create a student' do
    student = Student.new({ details: {name: 'Ooga Booga', roll_no: '2008ts475', college: 'Ooga'}})
    expect(student.save!).to be_truthy
  end
end