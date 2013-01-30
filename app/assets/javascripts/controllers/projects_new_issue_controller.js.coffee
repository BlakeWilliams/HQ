App.ProjectNewIssueController = Ember.ObjectController.extend

  needs: ['project']

  save: ->
    @get('content').on 'didCreate', =>
      @transitionTo 'project.index', @get('controllers.project.content')
    @get('content').set('project', @get('controllers.project.content'))
    @get('content').store.commit()

  cancel: ->
    @transitionTo 'project.index', @get('controllers.project.content')

  dueChanged: (->
    console.log @get('content.due')
  ).observes('content.due')

  didSave: (=>
    console.log 'saved!' if @content.get('isNew')
  ).observes('content.isNew')

