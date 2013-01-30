App.ProjectNewIssueController = Ember.ObjectController.extend

  needs: ['project']

  save: ->
    @get('content').on 'didCreate', =>
      console.log @get('project')
      @transitionTo 'project.index', @get('controllers.project.content')
    @get('content').set('project', @get('controllers.project.content'))
    @get('content').store.commit()

  cancel: ->
    @transitionTo 'project.index', @get('controllers.project.content')

  didSave: (=>
    console.log 'saved!' if @content.get('isNew')
  ).observes('content.isNew')

