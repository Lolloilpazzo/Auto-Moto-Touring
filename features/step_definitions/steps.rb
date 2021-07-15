Given(/^I am authenticated$/) do
    u = User.create!(:email=>"emailtest@gmayl.com", :password => "password", 
    :roles_mask => 0 )
    visit "/"
    fill_in "Email", with: "emailtest@gmayl.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
end


Given(/^I am on the home page$/) do
    visit "/"
end
      
Given(/^Tour "(.*?)" with Driver "(.*?)" and date "(.*?)" is there$/) do |arg1,arg2,arg3| #questa cosa sono i riferimenti alle espressioni regolari (.*?)
    m = Tour.new( title: arg1, driver: arg2, year: arg3)
    m.save
end

Given(/^I should see the tours list$/)do |arg1|
    expect(page).to have_selector("Tours", text:arg1)
end

Given(/^I should see "(.*?)"$/) do |arg1|
    expect(page).to have_selector("logged in as:", text:arg1)
end

Given(/^I want to Sign out$/) do
    click_button "Sign out"
end

Given(/^I want to have the Sign out button$/) do
    expect(page).to have_button("Sign out")
end

Given(/^I wanto to go to the edit profile page$/) do
    visit "localhost:3000/id/users/edit" #controllare se gli slash sono al contrario
end


Given(/^I am on the My tours page/) do
    expect(page).to have_link("my tours")
    expect(page).to have_button("add tour")
end

Given(/^I am on show tour page/) do
    visit "localhost:3000/id/users/tour"  #controllare se l'url è giusto
end

Given (/^I should see partenza/) do
    expect(page).to have_text("partenza")
end

Given (/^I should see destinazione/) do
    expect(page).to have_text("destinazione")
end

Given (/^I want to have join tour button$/) do
    expect(page).to have_button("join tour")
end

Given (/^I want to have leave tour button$/) do
    expect(page).to have_button("leave tour")
end
    b
      
     
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
    u = User.create!(:email =>"admin@gmayl.com", 
    :password => "password",
    :roles_mask => 3)
    visit "/"
    fill_in "Email", with: "admin@gmayl.com"
    fill_in "Password", with: "password"
    click_button "Log in"
end

Given(/^Given I am authenticated as user$/) do
    u = User.create!(:email =>"user@gmayl.com", 
    :password => "password",
    :roles_mask => 1)
    visit "/"
    fill_in "Email", with: " user@gmayl.com"
    fill_in "Password", with: " password "
    click_button "Log in"
end