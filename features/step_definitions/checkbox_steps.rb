Given(/^I visit the checkbox page$/) do
  visit('/checkboxes')
end

When(/^I tick the first checkbox$/) do
  expect(page).to have_text('Checkboxes')
  page.find(:xpath, '//*[@id="checkboxes"]/input[1]').click
end

Then(/^the first checkbox is ticked$/) do
  expect(page.find(:xpath, '//*[@id="checkboxes"]/input[1]').checked?).to eq true
end