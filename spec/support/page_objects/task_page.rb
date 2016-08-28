class TaskPage
  include Capybara::DSL

  def visit_page
    visit('/authenticable/tasks')
    self
  end

  def add_task(body = "")
    within("#new_task") do
      fill_in("Add new task", with: body)
      click_on("Add")
    end
    self
  end

  def has_task?(task_body)
    task_list.has_css? 'li', text: task_body
  end

  def has_error?(error)
    task_error.has_css? 'li', text: error
  end

  private

  def task_list
    find('#sortable')
  end

  def task_error
    find('#task_error')
  end
end
