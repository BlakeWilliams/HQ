App.ProjectsNewController = Ember.ObjectController.extend
  save: ->
    @get('content').store.commit()

  cancel: ->
    @get('content').deleteRecord()
    @transitionTo('projects')
