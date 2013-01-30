App.ProjectsNewController = Ember.ObjectController.extend
  save: ->
    @get('content').on 'didCreate', =>
      @transitionTo('projects')
    @get('content').store.commit()

  cancel: ->
    @transitionTo('projects')

  didSave: (=>
    console.log 'saved!' if @content.get('isNew')
  ).observes('content.isNew')
