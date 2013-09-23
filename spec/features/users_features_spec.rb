require 'spec_helper'



feature "navigating the home page" do 
  before(:each) do
    50.times { |i| User.create(first_name: "jim#{i}", last_name: "bob#{i}", username: "Jimbob#{i}", email:"jim#{i}@bob.com", sum_karma: 1000)}
  end

  it "shows the words KarmaVille's Most Famous" do     
    visit root_path
    page.should have_content "KarmaVille's Most Famous"
  end

  it "shows top 50 karma users in home page" do
    visit root_path 
    page.should have_content "Jimbob"
  end

  it "has no users in page 2" do
    visit "/?page=2"
    page.should_not have_content "Jimbob"
  end

  it "displays users ranked appropriately" do
    User.create(first_name: "#1", last_name: "bob", username: "Alejandro", email:"alejandro@bob.com", sum_karma: 2000)
    User.create(first_name: "#51", last_name: "bob", username: "George", email:"george@bob.com", sum_karma: 500)
  
    visit root_path
    page.should have_content "Alejandro"

    click_link "Next"
    page.should have_content "George"
  end

  it "lets you clicks Previous, and then disables" do
    visit root_path
    click_link "Next"
    click_link "Prev"

    current_url.should eql "http://www.example.com/?page=1"

    click_link "Prev"

    current_url.should eql "http://www.example.com/?page=1"
  end
end
