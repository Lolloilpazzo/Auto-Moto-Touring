require 'rails_helper.rb'


describe MoviesController, type: :controller do

    fixtures :all
        it "Should give me three movies from fixtures" do
    adm = users(:admin)
    sign_in adm
    get :index
    expect(assigns(:movies).size).to eql(3) #assigns prende dal rispettivo controller i valori dichiarati con la @
    end
end