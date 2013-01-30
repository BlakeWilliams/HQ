UI.DatePicker = Ember.View.extend UI.Widget,
  uiType: 'datepicker'
  uiOptions: ['disabled', 'contrainInput', 'dateFormat', 'defaultDate', 'maxDate', 'minDate', ]
  uiEvents: ['create', 'beforeShow', 'beforeShowDay', 'onChangeMonthYear'
  'onClose', 'onSelect']
  attributeBindings: ['type', 'value', 'placeholder']

  type: 'text'
  tagName: 'input'

  init: ->
    this._super()
    this.on 'change', this, ->
      Ember.set this, 'value', this.$().datepicker('getDate')
