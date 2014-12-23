require 'rails_helper'

describe User, type: :Model do
  context 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :email }
    it { should ensure_length_of(:password).is_at_least(4).is_at_most(20) }
  end
  
  it 'should encrypt password before saving' do
    params = {email: 'Ooga@booga.com', password: 'booga'}
    user = User.create(params)
    expect(user.password).to_not eql(params[:password])
  end

  context '#authenticate' do
    it 'should not authenticate user on error' do
      User.create({email: 'ooga@booga.com',password: 'ooga'})
      expect(User.authenticate('ooga@booga.com','lolz')).to be_falsey
    end
    it 'should return user on successful authentication' do
      user = User.create({email: 'ooga@booga.com',password: 'ooga'})
      expect(User.authenticate('ooga@booga.com','ooga')).to eql(user)
    end
  end
end