require 'rails_helper.rb'


describe ToursContorller, type: :controller do

    fixtures :all
        it "Should give me 1 tour from fixtures" do
    sign_in adm
    get :index
    expect(assigns(:tours).size).to eql(1) #assigns prende dal rispettivo controller i valori dichiarati con la @
    end
end