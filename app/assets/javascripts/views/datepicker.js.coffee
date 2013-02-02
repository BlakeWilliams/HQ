App.PickADate = Ember.View.extend
  attributes: ['monthsFull', 'monthsShort', 'weekdaysFull', 'weekdaysShort',
  'monthPrev', 'monthNext', 'showMonthsFull', 'showWeekdaysShort', 'today',
  'clear', 'format', 'formatSubmit', 'hiddenSuffix', 'firstDay', 'monthSelector',
  'yearSelector', 'dateMin', 'dateMax', 'datesDisabled', 'disablePicker']
  events: ['onOpen', 'onClose', 'onSelect', 'onStart']
  attributeBindings: ['type', 'value', 'placeholder']

  type: 'text'
  tagName: 'input'
  classNames: 'pickadate'

  didInsertElement: ->
    options = {}
    self = this

    @get('events').forEach (event) ->
      callback = self[event]
      if callback
        options[event] = ->
          callback.call(this)

    @get('attributes').forEach (attr) ->
      options[attr] = self[attr] if self[attr] != undefined

    onSelectCallback = options.onSelect
    options.onSelect = ->
      Ember.set self, 'value', this.getDate(true)
      onSelectCallback.call(this) if onSelectCallback

    options.keydown = ->
    @$().pickadate(options).off('keydown').on 'keydown', (e) ->
      e.preventDefault() if e.keyCode == 8 || e.keyCode == 46
