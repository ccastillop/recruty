json.extract! answer, :id, :user_id, :questionnarie_id, :question_id, :choice_id, :body, :score, :created_at, :updated_at
json.url answer_url(answer, format: :json)
