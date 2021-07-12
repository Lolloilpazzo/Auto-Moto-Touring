Given(/^I am authenticated$/) do
    u = User.create!(:email=>"emailtest@gmayl.com", 
    :password => "password", 
    :roles_mask => 0 )
    visit "http://127.0.0.1:3000/id/users/sign_up"
    fill_in "Email", with: "emailtest@gmayl.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_text("Logged in as 
    emailtest@gmayl.com")
end


Given(/^I am on the home page$/) do
    visit "/"
end
      
Given(/^Movie "(.*?)" with Director "(.*?)" and Year "(.*?)" is there$/) do |arg1,arg2,arg3| #questa cosa sono i riferimenti alle espressioni regolari (.*?)
    m = Movie.new( title: arg1, director: arg2, year: arg3)
    m.save
end
      
    #  Given(/^Moviegoer "(.*?)" is there$/) do |arg1|
    #      rev = Moviegoer.new(name: arg1)
    #      rev.save
    #  end
      
    #  Given(/^Review "(.*?)" by Moviegoer "(.*?)" for Movie "(.*?)" with Score "(.*?)" is there$/) do |arg1,arg2,arg3,arg4|
    #    rev = Moviegoer.find_by( name: arg2)
    #    mov = Movie.find_by( title: arg3)
    #    r = Review.new(body: arg1, movie: mov, score: arg4, moviegoer: rev )
    #    r.save
    #  end
      
     
Then(/^I should see table heading "(.*?)"$/) do |arg1|
    expect(page).to have_selector("th", text:arg1)
end
      
    #  Then(/^I should see Movie "(.*?)" with Director "(.*?)" and Year "(.*?)" and Average Score "(.*?)" and Number of Reviews "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5|
    #      xpath_query = '//table/tr[td="'+arg1 +'" and td="'+arg2 +'" and td="'+arg3 +'" and td="'+arg5 +'"]'
    #      expect(page).to have_xpath(xpath_query)
    #  end
      




#######################################################################################
#                              FILE AUTHORIZATION                                     #
#######################################################################################


Then(/^I should see link "(.*?)"$/) do |arg1|
    expect(page).to have_link(text:/\A#{arg1}\Z/)
end

Then(/^I should not see link "(.*?)"$/) do |arg1|
    expect(page).not_to have_link(text:/\A#{arg1}\Z/)
end

Given(/^Given I am authenticated as admin$/) do
    u = User.create!(:email =>"admin@spoiledpotatoes.com", 
    :password => "password",
    :roles_mask => 3)
    visit "/"
    fill_in "Email", with: "admin@spoiledpotatoes.com"
    fill_in "Password", with: "password"
    click_button "Log in"
end

Given(/^Given I am authenticated as moviegoer$/) do
    u = User.create!(:email =>"mvg@spoiledpotatoes.com", 
    :password => "password",
    :roles_mask => 1)
    visit "/"
    fill_in "Email", with: " mvg @spoiledpotatoes.com"
    fill_in "Password", with: " password "
    click_button "Log in"
end