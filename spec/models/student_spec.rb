require 'rails_helper'

describe Student do
  it 'should create a student' do
    student_params = { name: 'Ooga Booga', roll_no: '2008ts475', college: 'Ooga'}
    expect(Student.create({details: student_params})).to be_truthy
  end
end