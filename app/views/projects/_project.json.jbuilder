json.(project, :id, :name, :description)
json.issues project.issues.pluck('id')
