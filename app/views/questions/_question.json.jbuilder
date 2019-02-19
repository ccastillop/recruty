json.extract! question, :id, :questionnaire_id, :kind, :name, :body, :created_at, :updated_at
json.url question_url(question, format: :json)
