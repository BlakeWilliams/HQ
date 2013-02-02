App.Router.map (match) ->
  @resource 'projects', ->
    @route 'new', {path: 'new'}
  @resource 'project', { path: '/projects/:project_id' }, ->
    @route 'newIssue', {path: 'issues/new'}
    @resource 'issue', {path: 'issues/:issue_id'}
