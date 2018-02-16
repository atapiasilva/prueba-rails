class TodosController < ApplicationController

    def index
        @todos = Todo.all
    end

    def new
        @todo = Todo.new
    end

    def create     
        todo = Todo.new(todo_params)
        if todo.save
          redirect_to todos_path, notice: 'creado con exito'
        else
          redirect_to todos_new_path, notice: 'ha ocurrido un error'
        end
    end


    def show
        @todo = Todo.find(params[:id])
    end


    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
            if @todo.update(todo_params)
                redirect_to @todo, notice: 'actualizado con exito'
            else
                redirect_to root_path(@todo), notice: 'intentalo nuevamente'
            end
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        redirect_to root_path, notice:'se eliminó el registro'
    end

    def complete
        @todo = Todo.find(params[:id])
        if @todo.save
            redirect_to root_path, notice:'se ha guardado el registro'
        else
            redirect_to root_path(@todo), notice:'no se ha guardado el registro'
        end    
    end

    def list
        @todos = Todo.all

    end
    private

    def todo_params
        params.require(:todo).permit(:description, :completed)
    end




end
