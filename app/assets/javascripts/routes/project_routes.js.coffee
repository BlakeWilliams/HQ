App.ProjectRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'content', model

App.ProjectNewIssueRoute = Ember.Route.extend
  setupController: (controller, model) ->
    issue = App.Issue.createRecord()
    controller.set 'content', issue

  exit: ->
    model = @controllerFor('project.newIssue').get('content')
    model.deleteRecord() if model.get('isNew')

App.ProjectsRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'content', App.Project.all()

App.ProjectsNewRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'content', App.Project.createRecord()

  exit: ->
    model = @controllerFor('projects.new').get('content')
    model.deleteRecord() if model.get('isNew')
