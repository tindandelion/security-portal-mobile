Ext.define 'Portal.ui.SummaryEntry',
  extend: 'Ext.Panel'
  xtype: 'summaryentry'
  config:
    label: '' 
    count: 0
    
    baseCls: 'summary-panel-item'
    items: [
      { xtype: 'label', cls: 'label', itemId: 'label' }, 
      { xtype: 'label', cls: 'count', itemId: 'count' }]
      
  updateLabel: (newValue) -> 
    @child('#label').setHtml(newValue)
  
  updateCount: (newValue) -> 
    @child('#count').setHtml(newValue.toString())
