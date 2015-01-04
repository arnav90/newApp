FactoryGirl.define do
  factory :simple_drive, class: Drive do
    name 'Ooga'
    details {{description: 'Booga'}}
    student_fields 'apple|*|ball|*|cat'
  end
end