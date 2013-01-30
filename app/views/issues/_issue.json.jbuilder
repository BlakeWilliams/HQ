json.(issue, :id, :name, :description, :closed)
json.due issue.due.to_time.iso8601
json.project_id issue.project_id
