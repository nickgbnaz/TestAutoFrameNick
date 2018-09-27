require_relative '../../features/step_definitions/Pages/Checkboxes'

checkboxes = Checkboxes.new

Given(/^I visit the checkbox page$/) do
  visit('/checkboxes')
end

When(/^I tick the first checkbox$/) do
  expect(page).to have_text('Checkboxes')
  #page.find(:xpath, '//*[@id="checkboxes"]/input[1]').click
  #checkboxes.click_checkbox_one
  checkboxes.click_element(checkboxes.checkbox_one_xpath, 'checkbox 1')
end

Then(/^the first checkbox is ticked$/) do
  expect(page.find(:xpath, checkboxes.checkbox_one_xpath).checked?).to equal true
end

