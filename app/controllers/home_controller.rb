class HomeController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.order(created_at: :desc) # แก้จาก @task เป็น @tasks
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path
    else
      @tasks = Task.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def toggle_status
    @task = Task.find(params[:id])
    @task.update(status: !@task.status)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path, notice: "Task deleted!" }
    end
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
