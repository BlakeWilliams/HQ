App.ProjectNewIssueView = Ember.View.extend
  datePicker: App.PickADate.extend
    format: 'dddd, mmmm d, yyyy'
    firstDay: 1
    clear: false

    onStart: ->
      date = new Date()
      this.setDate(date.getFullYear(), date.getMonth() + 1, date.getDate())

    keyPress: (e) ->
      e.preventDefault()
      console.log e

