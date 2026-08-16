json.extract! contact, :id, :first_name, :last_name, :email, :phone, :company, :job_title, :address, :city, :state, :postal_code, :country, :notes, :created_at, :updated_at
json.url contact_url(contact, format: :json)
