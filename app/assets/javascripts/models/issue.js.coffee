App.Issue = DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')
  closed: DS.attr('boolean')
  due: DS.attr('date')

  project: DS.belongsTo('App.Project')

  dueDate: (->
    date = @get('due')
    return "" unless date
    month = (date.getMonth() + 1).toString()
    month = "0" + month if month.length == 1
    day = (date.getDate()).toString()
    day = "0" + day if day.length == 1
    return "#{month}/#{day}/#{date.getFullYear()}"
  ).property('due')

  isDue: (->
    date = @get('due')
    return false unless date
    return false if @get('closed')
    date.setHours(0,0,0,0) == (new Date()).setHours(0,0,0,0)
  ).property('due', 'closed')

  isOverdue: (->
    date = @get('due')
    return false unless date
    (date.setHours(0,0,0,0) < (new Date()).setHours(0,0,0,0)) && !@get('closed')
  ).property('due', 'closed')
