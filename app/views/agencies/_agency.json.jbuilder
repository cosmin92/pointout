json.extract! agency, :id, :name, :phone, :email, :fax, :street, :number, :city, :zip_code, :note, :web_site_url, :created_at, :updated_at
json.url agency_url(agency, format: :json)
