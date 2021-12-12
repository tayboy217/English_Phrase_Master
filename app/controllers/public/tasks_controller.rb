class Public::TasksController < ApplicationController

  def new
    @task = Task.new
    @tasks = Task.all
  end

  def index
    @tasks = Task.all
  end

  def show
  end

  def create
     @task = Task.new(task_params)
     @task.user_id = current_user.id
  if @task.save!
     redirect_to new_task_path
  else
     render root_path
  end
  end

  def edit
     @task = Task.find(params[:id])
  if @task.update(task_params)
     redirect_to tasks_path
  else
     render :edit
  end
  end

  def update
  end

  def destroy
  end

  private
  def task_params
    params.require(:task).permit(:title, :starts_at, :ends_at)
  end

end
