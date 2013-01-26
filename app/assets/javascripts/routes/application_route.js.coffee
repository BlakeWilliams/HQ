App.ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('sidebar').set 'content', App.Project.find()
  
App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'projects'
