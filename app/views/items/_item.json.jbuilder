json.extract! item, :id, :name, :done, :todo_id, :created_at, :updated_at
json.url item_url(item, format: :json)
