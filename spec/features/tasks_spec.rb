require 'rails_helper'

feature 'User Tasks' do
  let(:user) { FactoryGirl.create(:user) }
  let(:task_page) { TaskPage.new }

  before do
    login_as(user, scope: :user)
  end

  scenario "add new task", js: true do
    task_page.visit_page.add_task("new task test")
    expect(task_page).to have_task("new task test")
  end

  scenario "add a blank task", js: true do
    task_page.visit_page.add_task
    expect(task_page).to have_error("Body can't be blank")
  end

end
