json.(issue, :id, :name, :description, :closed)
if issue.due?
  json.due issue.due.to_time.iso8601
else
  json.due nil
end
json.project_id issue.project_id
