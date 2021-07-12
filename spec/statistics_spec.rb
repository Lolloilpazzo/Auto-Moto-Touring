require "rails_helper"

require "./app/models/movie.rb"
describe Movie do
	before(:all) do
		Movie.all.each do  |mv|
			mv.destroy
		end
	end
	after(:all) do
		Movie.all.each do  |mv|
			mv.destroy
		end
	end
	
	context "No Reviews Are In Place" do

		before(:all) do
			 @movie = Movie.new(title: "Test", director: "Dir", year: 999)
		end
		it "has average score equal 0" do
			@movie.averageScore().eql? 0
		end
	end

	context "One Review with Score 10" do
		before(:all) do
			 @movie = Movie.new(title: "Test_Movie_1", director: "Direrctor", year: 999)
			 @movie.save
			 @mvg = Moviegoer.new(name:"Test_Moviegoer", bio: "BIO")
			 @mvg.save
			 @movie.reviews.create(body: "Rev1", score: 10, moviegoer:@mvg)

		end
		it "has 1 review" do
			mv = Movie.find_by(title: "Test_Movie_1")
			mvg = Moviegoer.find_by(name: "Tst")

			expect(mv.reviews.count).to eql(1)
		end
		it "has average score equal 10" do
			mv = Movie.find_by(title: "Test_Movie_1")
			expect(mv.averageScore()).to eql(10.0)
		end
	end

	context "Two Reviews with Scores 10 and 5" do
		before(:all) do
			 @movie = Movie.new(title: "Test_Movie_2", director: "Direrctor", year: 999)
			 @movie.save
			 @mvg = Moviegoer.new(name:"Test_Moviegoer_2", bio: "BIO")
			 @mvg.save
			 @movie.reviews.create(body: "Rev1", score: 10, moviegoer:@mvg)
			 @movie.reviews.create(body: "Rev2", score: 5, moviegoer:@mvg)
		end
		it "has 2 review" do
			mv = Movie.find_by(title: "Test_Movie_2")
			mvg = Moviegoer.find_by(name: "Tst")

			expect(mv.reviews.count).to eql(2)
		end
		it "has average score equal 7.5" do
			mv = Movie.find_by(title: "Test_Movie_2")
			expect(mv.averageScore()).to eql(7.5)
		end
	end


end