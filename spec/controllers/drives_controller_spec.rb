require 'rails_helper'

describe DrivesController, type: :controller do
  before :each do
    allow_any_instance_of(ApplicationController).to receive(:check_for_login).and_return(true)
  end

  context '#create'do
    it 'should create a drive' do
      params = {drive: attributes_for(:simple_drive)}
      expect(post(:create, params)).to redirect_to("/drives/#{controller.instance_variable_get(:@drive)[:id]}")
    end

    it 'should render index page if there is an error' do
      params = {drive: {ooga: 'booga'}}
      expect(post(:create, params)).to render_template('drives/index')
    end
  end

  context '#show' do
    it 'should fetch the requested drive' do
      drive = create(:simple_drive)
      get :show, id: drive.id
      expect(controller.instance_variable_get(:@drive)).to eql(drive)
    end
  end

  context '#index' do
    it 'should fetch all drives' do
      create(:simple_drive)
      get :index
      expect(controller.instance_variable_get(:@drive).count).to eql(Drive.all.count)
    end
    it 'should render list of drives' do
      expect(get(:index)).to render_template('drives/index')
    end
  end

  context '#upload_students' do
    it 'should create students from a csv file' do
      drive = create(:simple_drive)
      post :upload_students, {drive: {id: drive.id, students_data: ActionDispatch::Http::UploadedFile.new(tempfile: STUDENT_CSV_FILE, filename: 'student_file.csv')}}
      expect(drive.students.count).to eql(5)
      expect(Drive.find_by_id(drive.id).student_fields).to_not eql(attributes_for(:simple_drive)[:student_fields])
    end
  end
end