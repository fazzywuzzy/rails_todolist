class TodosController < ApplicationController
  before_action :find_todo, only: %i[destroy update]

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(description: params[:todo][:description])
    if @todo.valid?
      redirect_to root_path
    else
      render :index
    end
  end

  def destroy
    @todo.destroy
    redirect_to root_path
  end

  def update
    if @todo.update(todo_params)
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:description)
  end
end
