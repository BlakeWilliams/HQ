App.ProjectController = Ember.ObjectController.extend
  goto: ->
    @transitionTo 'projects'
