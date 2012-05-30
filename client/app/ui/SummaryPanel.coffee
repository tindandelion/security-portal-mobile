Ext.define 'Portal.ui.SummaryPanel',
  extend: 'Ext.Container'
  requires: ['Portal.ui.SummaryPanelItem']
  xtype: 'summarypanel'
  config: 
    layout: 'hbox'
    cls: 'summary-panel'
    items: [
      {
        xtype: 'summarypanelitem'
        cls: 'critical'
        label: 'CRITICAL'
        itemId: 'critical'
        flex: 1
      },
      {
        xtype: 'summarypanelitem',
        cls: 'warning'
        label: 'WARNING'
        itemId: 'warning'
        flex: 1
      },
      {
        xtype: 'summarypanelitem',
        cls: 'protected'
        label: 'PROTECTED'
        itemId: 'protected'
        flex: 1
      }]
      
  setSummary: (summary) -> 
    for item in @summaryPanelItems()
      item.setCount(summary[item.getItemId()])

  summaryPanelItems: -> 
    @getItems().items