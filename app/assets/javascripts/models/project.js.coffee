App.Project = DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')

  issues: DS.hasMany('App.Issue')
