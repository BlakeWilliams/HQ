App.ProjectNewIssueView = Ember.View.extend
  didInsertElement: ->
    console.log 'rendered'

  datePicker: UI.DatePicker.extend()
