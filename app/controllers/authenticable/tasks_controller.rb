class Authenticable::TasksController < Authenticable::AuthenticableController
  before_action :set_task, only: [ :update, :destroy ]

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

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.js {}
      else
        format.js { render 'error', status: :unprocessable_entity  }
      end
    end
  end

  def destroy
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:body, :finished)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

end
