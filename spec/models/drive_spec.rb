require 'rails_helper'

describe Drive, type: :Model do
  it { should validate_presence_of :name}

  it 'should be able to create a drive' do
    drive = Drive.new({name: 'Test Drive', details: {type: 'Solo', description: 'yolo'}})
    expect(drive.save!).to be_truthy
  end
end
