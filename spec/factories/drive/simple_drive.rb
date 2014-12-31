FactoryGirl.define do
  factory :simple_drive, class: Drive do
    name 'Ooga'
    details {{description: 'Booga'}}
  end
end