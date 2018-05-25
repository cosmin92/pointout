json.extract! notice, :id, :title, :content, :posting_date, :expiration_date, :notice_type, :created_at, :updated_at
json.url notice_url(notice, format: :json)
