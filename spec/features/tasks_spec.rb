require 'rails_helper'

feature 'User Tasks' do
  let(:user) { FactoryGirl.create(:user) }
  let(:task_page) { TaskPage.new }
  let(:task) { FactoryGirl.create(:task, user: user) }

  before do
    login_as(user, scope: :user)
    user.tasks << task
  end

  scenario "add new task", js: true do
    task_page.visit_page.add_task("new task test")
    expect(task_page).to have_task("new task test")
  end

  scenario "add a blank task", js: true do
    task_page.visit_page.add_task
    expect(task_page).to have_error("Body can't be blank")
  end

  scenario "edit task body", js: true do
    task_page.visit_page.edit_task(task.id, "new name")
    expect(task_page).to have_task("new name")
  end

  scenario "finish a task", js: true do
    task_page.visit_page.finish_task(task.id)
    expect(task_page).to have_finished_task(task.body)
  end


end
