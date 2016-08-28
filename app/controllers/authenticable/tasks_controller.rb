class Authenticable::TasksController < Authenticable::AuthenticableController

  def index
    @finished_tasks = current_user.tasks.finished
    @not_finished_tasks = current_user.tasks.not_finished
    @task = Task.new
  end


  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.js {}
      else
        format.js { render 'error', status: :unprocessable_entity  }
      end
    end
  end


  private

  def task_params
    params.require(:task).permit(:body)
  end

end
