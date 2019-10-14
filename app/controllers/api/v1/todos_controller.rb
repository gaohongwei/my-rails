module Api::V1
  class TodosController < ActionController::API
    respond_to :json
    def index
      todos = Todo.all
      total_count = Todo.count

      # respond_with {total_count: total_count, rows: todos}
      render json: {total_count: total_count, rows: todos}
    end
  end
end
