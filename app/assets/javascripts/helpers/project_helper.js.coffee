Handlebars.registerHelper 'link', (text) ->
  template = "<a {{action changeFilter '#{text}'}}>#{text}</a>"
  return new Handlebars.SafeString(template);
