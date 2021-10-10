json.extract! news, :id, :name, :created_at, :updated_at
json.url news_url(news, format: :json)
