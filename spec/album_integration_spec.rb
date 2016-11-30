require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add new artist route', {:type => :feature}) do
  it ('adds a new artist and displays the success page') do
    visit('/')
    click_link('Add New Artist')
    fill_in('name', :with => 'The Beatles')
    click_button('Add Artist')
    expect(page).to have_content('Success!')
  end
end

describe('view all artists route', {:type => :feature}) do
  it('shows all arits after one has been created') do
    visit('/')
    click_link('Add New Artist')
    fill_in('name', :with => 'The Beatles')
    click_button('Add Artist')
    click_link('See Artist List')
    expect(page).to have_content('The Beatles')
  end
end

describe('add an album route', {:type => :feature}) do
  it('adds an album to a Artist') do
    visit('/')
    click_link('Add New Artist')
    fill_in('name', :with => 'The Beach Boys')
    click_button('Add Artist')
    click_link('See Artist List')
    click_link('The Beach Boys')
    click_link('Add a new album')
    fill_in('name', :with => "Pet Sounds")

    click_button('Add Album')
    expect(page).to have_content('Success!')
  end

  it('adds an album to an artist') do
    visit('/')
    click_link('Add New Artist')
    fill_in('name', :with => 'The Stones')
    click_button('Add Artist')
    click_link('See Artist List')
    click_link('The Stones')
    click_link('Add a new album')
    fill_in('name', :with => "Sticky Fingers")
    click_button('Add Album')
    click_link('See Artist List')
    click_link('The Stones')
    click_link('Sticky Fingers')
    expect(page).to have_content('Sticky Fingers')
  end
end
