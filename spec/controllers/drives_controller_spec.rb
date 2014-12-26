require 'rails_helper'

describe DrivesController, type: :controller do
  before :each do
    allow_any_instance_of(ApplicationController).to receive(:check_for_login).and_return(true)
  end

  context '#create'do
    it 'should create a drive' do
      params = {drive: {name: 'First Drive'}}
      expect(post(:create, params)).to redirect_to("/drives/#{controller.instance_variable_get(:@drive)[:id]}")
    end

    it 'should render index page if there is an error' do
      params = {drive: {ooga: 'booga'}}
      expect(post(:create, params)).to render_template('drives/index')
    end
  end

  context '#show' do
    it 'should fetch the requested drive' do
      drive = Drive.create({name: 'Ooga'})
      get :show, id: drive.id
      expect(controller.instance_variable_get(:@drive)).to eql(drive)
    end
  end

  context '#index' do
    it 'should fetch all drives' do
      Drive.create([{name: 'ooga'},{name: 'boga'}])
      get :index
      expect(controller.instance_variable_get(:@drive).count).to eql(Drive.all.count)
    end
    it 'should render list of drives' do
      expect(get(:index)).to render_template('drives/index')
    end
  end
end