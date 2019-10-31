class TasksController < ApplicationController
  def index
    @task= Task.all
  end
  
  # New Task
  def new
    p @task = Task.new
  end
  
  # How to create
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render 'new'
    end
  end
  
  # how to edit
  def edit 
    @task = Task.find(params[:id])
  end
  
  # How to update
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
        render 'edit'
    end
  end
  
  # How to delete
  def destroy
    @task =  Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
  
  #Show function
  def show  
    @task = Task.find(params[:id])
  end
  
  #completed
  
  def complete
    
    @task=Task.find(params[:id])
    @task.update_attribute(:completed, params[:completed])
    redirect_to tasks_path
    
  end
  
  private 
  
  # This is what we see for the task instead of random info
  def task_params
    params.require(:task).permit(:title,:details,:completed)
  end
  
end
