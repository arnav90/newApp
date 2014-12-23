require 'rails_helper'

describe SessionsController, type: :controller do
  context '#new' do
    it 'should render login page' do
      expect(get(:new)).to render_template('sessions/new')
    end
  end

  context '#create' do
    it 'should render new on failed login' do
      expect(post(:create)).to render_template('sessions/new')
    end
    it 'should redirect to root on successful login' do
      User.create({email:'ooga@booga.com',password: 'ooga'})
      expect(post(:create,{email:'ooga@booga.com',password:'ooga'})).to redirect_to(root_url)
    end
    it 'should assign correct user to the session' do
      user = User.create({email:'ooga@booga.com',password: 'ooga'})
      post :create, {email:'ooga@booga.com',password:'ooga'}
      expect(controller.session[:user_id]).to eql(user.id)
    end
  end

  context '#destroy' do
    it 'should clear the session' do
      controller.session[:user_id] = 20
      get :destroy
      expect(controller.session[:user_id]).to be_nil
    end
    it 'should redirect to login page' do
      expect(get(:destroy)).to redirect_to(login_path)
    end
  end
end