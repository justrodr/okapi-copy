Given("the following users exist:") do |table|
    listof_users = table.hashes
    listof_users.each do |user|
        User.create!(user)
    end  
end
Given("I am on the home page") do
    visit root_path
  end
 
  Then("I want to be taken to the create account page") do
    assert page.current_path, 'users/new'
  end
  
  When(/^I click on "([^"]*)"$/) do |arg1|
    click_on(arg1)
  end
  
  Then("I want to be taken to the login page") do
    assert page.current_path, new_user_session_path
  end

  Given("I am on the login page") do
    visit root_path
    click_on("Login")
    assert page.current_path, '/users/sign_in'
  end
  
  When("I enter invalid login information") do
    fill_in 'Email Address', with: ''
    fill_in 'Password', with: ' '
    click_on("Log In")
  end
  
  When("I enter valid login information") do
    fill_in 'Email Address', with: 'jd@email.com'
    fill_in 'Password', with: '4mainst'
    #click_on("Log In")
  end
  
  Then("I should not be on the dashboard") do
    assert_current_path('/users/sign_in') #FIXME
    #assert page.has_content?("face")
  end
  
  Then("I should be on the dashboard") do
    assert_current_path(dash_path) #FIXME
    #assert page.has_content?("face")
  end

  Given("I am on the create account page") do
    visit new_user_registration_path
  end
  
  Then("I should not be able to create an account") do
    assert page.current_path, 'users/new'
  end
  
  Then("I should be on my dashboard") do
    assert page.current_path, '/dash'
  end
  
  When("I enter valid create account information") do
    fill_in 'First Name', with: 'Good'
    fill_in 'Last Name', with: 'Example'
    fill_in 'Email Address', with: 'goodexample@gmail.com'
    fill_in 'Password', with: 'success'
    fill_in 'Confirm Password', with: 'success'
  end



  

  
  