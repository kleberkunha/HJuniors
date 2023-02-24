json.extract! job, :id, :name, :country_id, :description, :start_date, :end_date, :link, :created_at, :updated_at
json.url job_url(job, format: :json)
