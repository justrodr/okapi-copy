Given("the following users exist for dash:") do |table|
    listof_users = table.hashes
    listof_users.each do |user|
        User.create!(user)
    end  
end

Given("I am on the Dashboard page") do
    visit dash_path
  end
  
Given("I am on the Dashboard page for Jane Doe") do
    visit 'users/sign_in'
    fill_in 'Email Address', with: 'jd@email.com'
    fill_in 'Password', with: '4mainst'
    click_on("Log In")
    assert_current_path(dash_path)
    click_on("Add New Property")
    fill_in 'property[address]', with: "123 Bob st"
    fill_in 'property[city]', with: "Bryan"
    fill_in 'property[state]', with: "TX"
    fill_in 'property[zipcode]', with: "77801"
    fill_in "Property Name (Optional)", with: "Home"
    fill_in 'property[tenant_email]', with: 'bob@gmail.com'
    fill_in "Tenant Name", with: "Bob Hope"
    click_on("Add Property")
  end
  
  Then("I should see a table of my properties") do
    assert page.has_css?('table')
  end

  
  Then("I should be on my Subscriptions page") do
    assert page.current_path, 'orders_page'
  end
  
  Then("I should be on my Profile page") do
    assert page.current_path, 'profiles_page'
  end
  
  Given("I am on the Profile page") do
    visit 'users/sign_in'
    fill_in 'Email Address', with: 'jd@email.com'
    fill_in 'Password', with: '4mainst'
    click_on("Log In")
    assert_current_path(dash_path)
    click_on("Profile")
    assert_current_path('/users/edit')
  end
  
  And("I enter valid update information") do
    fill_in 'Email Address', with: 'jd@email.com'
    fill_in 'New Password', with: '4mainst'
    fill_in 'Confirm New Password', with: '4mainst'
    fill_in 'Current Password', with: '4mainst'
  end

  Then("I should be on the dashboard page") do
    assert_current_path(dash_path)
  end