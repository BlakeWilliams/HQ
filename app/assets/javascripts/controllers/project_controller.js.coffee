App.ProjectController = Ember.ObjectController.extend
  filter: 'all'
  mine: false

  filters:
    all: 'all'
    open: 'open'
    closed: 'closed'
    today: 'dueToday'
    overdue: 'overdue'

  changeFilter: (filter) ->
    @set('filter', filter)

  toggleMine: ->
    @set 'mine', !@get('mine')

  filtered: (-> 
    @get(@filter)
  ).property('filter', 'all', 'open', 'closed', 'dueToday', 'overdue')

  toggleIssue: (issue) ->
    issue.set 'closed', !issue.get('closed')
    issue.transaction.commit()

  all: (->
    @get('content.issues')
  ).property('content.issues.@each.closed')

  open: (->
    @get('content.issues').filterProperty('closed', false)
  ).property('content.issues.@each.closed')

  closed: (->
    @get('content.issues').filterProperty('closed', true)
  ).property('content.issues.@each.closed')

  dueToday: (->
    @get('content.issues').filterProperty('isDue', true)
  ).property('content.issues.@each.closed')

  overdue: (->
    @get('content.issues').filterProperty('isOverdue', true)
  ).property('content.issues.@each.closed')

  isAll:      (-> @filter == 'all').property('filter')
  isOpen:     (-> @filter == 'open').property('filter')
  isClosed:   (-> @filter == 'closed').property('filter')
  isToday:    (-> @filter == 'dueToday').property('filter')
  isOverdue:  (-> @filter == 'overdue').property('filter')
