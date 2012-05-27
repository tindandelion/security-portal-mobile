Ext.define 'Portal.ui.SummaryPanelItem',
  extend: 'Ext.Panel'
  xtype: 'summarypanelitem'
  requires: ['Portal.ui.Placeholder']
  config:
    label: '' 
    count: 0
    
    items: [
      { xtype: 'label', itemId: 'label' }, 
      { xtype: 'label', itemId: 'count' }]
      
  updateLabel: (newValue, oldValue) -> 
    @child('#label').setHtml(newValue)
  
  updateCount: (newValue) -> 
    @child('#count').setHtml(newValue.toString())
