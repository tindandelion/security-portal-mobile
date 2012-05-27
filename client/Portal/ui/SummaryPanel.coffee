Ext.define 'Portal.ui.SummaryPanel',
  extend: 'Ext.Container'
  requires: ['Portal.ui.SummaryPanelItem']
  xtype: 'summarypanel'
  config: 
    layout: 'hbox'
    items: [
      {
        xtype: 'summarypanelitem'
        count: 5
        label: 'CRITICAL'
        flex: 1
      },
      {
        xtype: 'summarypanelitem',
        count: 2
        label: 'WARNING'
        flex: 1
      },
      {
        xtype: 'summarypanelitem',
        count: 1
        label: 'PROTECTED'
        flex: 1
      }]