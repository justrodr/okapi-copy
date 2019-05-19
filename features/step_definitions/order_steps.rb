
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
  
  Then("I should be on the Add Subscription page") do
    assert_current_path '/properties/add/298486378'
  end
  
  Given("I am on the Add Subscription page for Jane Doe") do
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
    fill_in "Tenant Name", with: "Bob Hope"
    fill_in "Tenant Email", with: "Bob@email.com"
    click_on("Add Property")
    assert_current_path(dash_path)
    click_on("addBob") 
    assert_current_path '/properties/add/298486378'
  end

  When("I fill out correct subscription information") do
    fill_in "StartDate", with: '04/17/2019'
    select "2", :from => "FilterFreq"
    select "4", :from => "SubFreq"
    fill_in "size10b20", with: "1"
  end
  
  Then("I should be able to checkout that subscription") do
    assert_current_path(view_checkout_path)
  end
  
  And("I enter Admin login information") do
    fill_in 'Email Address', with: 'wd@email.com'
    fill_in 'Password', with: 'wedadmin'
  end
  
  Then("I should be on the Admin Dashboard") do
    assert_current_path(admin_path)
  end
  
