json.extract! userrequest, :id, :news, :purpose, :created_at, :updated_at
json.url userrequest_url(userrequest, format: :json)
