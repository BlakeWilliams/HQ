App.ProjectRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'content', model
    @controllerFor('sidebar').set 'project', model

App.ProjectsRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'content', App.Project.all()
    @controllerFor('sidebar').set 'project', null

App.ProjectsNewRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'content', App.Project.createRecord()
