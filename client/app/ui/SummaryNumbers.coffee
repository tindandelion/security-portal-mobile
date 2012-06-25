Ext.define 'Portal.ui.SummaryNumbers',
  extend: 'Ext.Container'
  requires: ['Portal.ui.SummaryEntry']
  xtype: 'summarynumbers'
  config: 
    cls: 'summary-panel'
    orientation: 'portrait'
    items: [
      {
        xtype: 'summaryentry'
        cls: 'critical'
        label: 'CRITICAL'
        itemId: 'critical'
        flex: 1
      },
      {
        xtype: 'summaryentry'
        cls: 'warning'
        label: 'WARNING'
        itemId: 'warning'
        flex: 1
      },
      {
        xtype: 'summaryentry'
        cls: 'protected'
        label: 'PROTECTED'
        itemId: 'protected'
        flex: 1
      }]
      
  initConfig: (config) -> 
    config.layout = 'vbox' if config.orientation == 'landscape'
    config.layout = 'hbox' if config.orientation == 'portrait'
    @callParent(arguments)
      
  initialize: -> 
    @callParent()
    @styleFirstAndLastItems(@getOrientation())
    
  styleFirstAndLastItems: (orientation) -> 
    items = @getItems().items
    firstItem = items[0]
    lastItem = items[items.length-1]
    
    firstItem.addCls('first-entry-' + orientation)
    lastItem.addCls('last-entry-' + orientation)
      
  setSummary: (summary) -> 
    for item in @summaryEntries()
      item.setCount(summary[item.getItemId()])

  summaryEntries: -> 
    @getItems().items