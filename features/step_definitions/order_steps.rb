# (33 sloc)  1.29 KB
  Then("I should be on the Subscriptions page") do
    assert_current_path(orders_page_path)
  end
  
  Given("I am on the Subscriptions page for Jane Doe") do
    visit 'users/sign_in'
    fill_in 'Email Address', with: 'jd@email.com'
    fill_in 'Password', with: '4mainst'
    click_on("Log In")
    assert_current_path(dash_path)
    click_on("Subscriptions")
  end
  
  When("I fill out correct order information") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I should see that my order has been placed") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  And("I enter Admin login information") do
    fill_in 'Email Address', with: 'wd@email.com'
    fill_in 'Password', with: 'wedadmin'
  end
  
  Then("I should be on the Admin Dashboard") do
    assert_current_path(admin_path)
  end
  
  Given("I am on the Admin Dashboard") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  When("I update the status of an order from shipped to delivered") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I should see that reflected in the table") do
    pending # Write code here that turns the phrase above into concrete actions
  end