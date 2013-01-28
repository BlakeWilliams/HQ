App.SidebarController = Ember.ArrayController.extend

  sortProperties: ['id', 'name']
  
  showProjects: false

  toggleProjects: ->
    @set 'showProjects', !@get('showProjects')

  loaded: (->
    @get('arrangedContent').filterProperty('isNew', false)
  ).property('content.@each.id').cacheable()

  currentProject: (->
    @get('projectName') || 'No Project Selected'
  ).property('projectName')

  projectNameBinding: Ember.Binding.oneWay('project.name')
