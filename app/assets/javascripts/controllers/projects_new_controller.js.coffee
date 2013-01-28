App.ProjectsNewController = Ember.ObjectController.extend
  save: ->
    @get('content').on 'didCreate', =>
      @transitionTo('projects')
    @get('content').store.commit()

  cancel: ->
    @get('content').deleteRecord()
    @transitionTo('projects')
