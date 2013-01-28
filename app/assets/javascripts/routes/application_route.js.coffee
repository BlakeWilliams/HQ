App.ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('sidebar').set 'content', App.Project.find()
    window.content = @controllerFor('sidebar').get('content')
  
App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'projects'
