App.ProjectIssuesController = Ember.ArrayController.extend
  needs: ['project']
  sortProperties: ['due', 'id']
  sortAscending: false

  content: (->
    @get('controllers.project.filtered')
  ).property('controllers.project.filter')
