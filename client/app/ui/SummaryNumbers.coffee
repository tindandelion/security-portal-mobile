Ext.define 'Portal.ui.SummaryNumbers',
  extend: 'Ext.Container'
  requires: ['Portal.ui.SummaryEntry']
  xtype: 'summarynumbers'
  config: 
    layout: 'hbox'
    cls: 'summary-panel'
    items: [
      {
        xtype: 'summaryentry'
        cls: 'critical'
        label: 'CRITICAL'
        itemId: 'critical'
        flex: 1
      },
      {
        xtype: 'summaryentry',
        cls: 'warning'
        label: 'WARNING'
        itemId: 'warning'
        flex: 1
      },
      {
        xtype: 'summaryentry',
        cls: 'protected'
        label: 'PROTECTED'
        itemId: 'protected'
        flex: 1
      }]
      
  setSummary: (summary) -> 
    for item in @summaryEntries()
      item.setCount(summary[item.getItemId()])

  summaryEntries: -> 
    @getItems().items