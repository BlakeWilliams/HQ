App.Router.map (match) ->
  @resource 'projects', ->
  @resource 'project', { path: '/projects/:project_id' }
