App.Issue = DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')

  project: DS.belongsTo('project')
