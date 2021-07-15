
require 'rails_helper.rb'
describe ToursController, type: :controller do
 	fixtures :all


	it "should return one tour from the fixtures" do	
		adm = users(:admin)
		sign_in adm
		get :index
		expect(assigns(:tours).size).to eql(1)
	end


    it "should create tours" do
        params = {:tour=>{:Partenza => "Napoli", :destinazione=>"roma", :durata=>"120"}}
        get :create, :params => params
        p_tst= Tour.where(:Partenza=>"Napoli")
        expect(p_tst).to be_empty
    end

	
    

	context "with User privileges" do
		before :each do
			moviegoer = users(:moviegoer)
			sign_in moviegoer
		end


		it "should destroy tours" do
			mv = tours(:tour)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Tour.where(:id => mv.id)
			expect(m_tst).to be_empty
		end


	end


	context "with Admin privileges" do
		before :each do
			admin = users(:admin)
			sign_in admin
		end

		it "should create tours" do
            params = {:tour=>{:Partenza => "Napoli", :destinazione=>"roma", :durata=>"120"}}
            get :create, :params => params
            p_tst= Tour.where(:Partenza=>"Napoli")
            expect(p_tst).to be_empty
        end

		it "should retrieve tours" do
			tour = tours(:tour)
			params = {:id => tour.id}
			get :show, :params => params
			expect(assigns(:tour)).to eql(tour)
		end



		it "should destroy tours" do
			mv = tours(:tour)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Tour.where(:id => mv.id)
			expect(m_tst).to be_empty
		end

	end

end
