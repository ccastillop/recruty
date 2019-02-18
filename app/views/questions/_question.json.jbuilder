json.extract! question, :id, :questionnarie_id, :kind, :name, :body, :created_at, :updated_at
json.url question_url(question, format: :json)
