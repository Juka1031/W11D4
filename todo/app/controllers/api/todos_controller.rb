class TodosController < ApplicationController

    def index
        @todos = Todo.all
        render json:@todos
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            render json: @todo
        else
            render json: @todo.errors.full_messages, status: 422
        end
    end

    def show
        render json: Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        if @todo
            render json: @todo
        else
            flash[:errors] = ['Something went wrong!']
        end
    end

    def destroy
    end

    def todo_params
        params.require(:todo).permit(:title, :body, :done)
    end
end