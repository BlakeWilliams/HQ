json.projects do
  json.array!(@projects) do |project|
    json.partial! "project", project: project
  end
end
