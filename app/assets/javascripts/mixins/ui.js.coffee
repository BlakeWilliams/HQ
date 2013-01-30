#= require_self
#= require_tree ./jquery-ui
window.UI = Ember.Namespace.create
  VERSION: '0.0.1'

  Widget: Ember.Mixin.create
    didInsertElement: ->
      options = @_getOptions()
      type = @get('uiType')

      @_getEvents(options)

      if jQuery.ui[type] == 'function'
        ui = jQuery.ui[type](options, @get('element'))
      else
        ui = @$()[type](options)

      @set 'ui', ui
      window.ui = ui

    willDestroyElement: ->
      return unless @get('ui')

      for observer in @_observers
        @removeObserver(property, this, @_observers[observer])


    _getOptions: ->
      @_observers = @_observers || {}

      uiOptions = @get('uiOptions')
      options = {}

      for key in uiOptions
        options[key] = @get(key)

        @_observers[key] = observer = ->
          @get('ui').setOption key, @get(key)

        @addObserver(key, this ,@_observers[key])

      options

    _getEvents: (options) ->
      self = @
      uiEvents = @get('uiEvents') || []

      for event in uiEvents
        callback = @[event]
        if callback
          options[event] = (event, ui, context) ->
            callback.call(this, event, ui, self)
