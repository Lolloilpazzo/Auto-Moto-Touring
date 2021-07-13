require 'rails_helper.rb'
describe UsersController, type: :controller do
fixtures :all
it "should give me users" do
sign_in adm
get :index
expect(assigns(:index).size).to eql(1)
end
end