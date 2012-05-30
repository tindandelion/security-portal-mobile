Ext.define 'Portal.ui.SummaryPanelItem',
  extend: 'Ext.Panel'
  xtype: 'summarypanelitem'
  requires: ['Portal.ui.Placeholder']
  config:
    label: '' 
    count: 0
    
    baseCls: 'summary-panel-item'
    items: [
      { xtype: 'label', cls: 'label', itemId: 'label' }, 
      { xtype: 'label', cls: 'count', itemId: 'count' }]
      
  updateLabel: (newValue, oldValue) -> 
    @child('#label').setHtml(newValue)
  
  updateCount: (newValue) -> 
    @child('#count').setHtml(newValue.toString())
