require "rails_helper"


RSpec.feature "Log in" do
  
    scenario "as an existing user" do
        
        User.create!(
            first_name: 'First',
            last_name: 'Last',
            email: 'first_last@spotter.com',
            password: 'password'
        )

        visit "/login"

        fill_in "email", with: "first_last@spotter.com"
        fill_in "password", with: "password"

        click_button "commit"

        expect(page).to have_text("Welcome, First!")
    end

end
