contentPanel = {
  xtype: 'panel'
  layout: 'vbox'
  flex: 1
  items: [
    {
      xtype: 'label'
      cls: 'company-name-label'
      id: 'company-name'
      dock: 'top'
      html: 'Company Name'
    },
    {
      xtype: 'summarypie'
      id: 'summary-pie'
      flex: 1
    },
    {
      xtype: 'summarynumbers'
      id: 'summary-panel'
      dock: 'bottom'
    }]
}
  
  
Ext.define 'Portal.ui.HomeScreen',
  extend: 'Ext.Container'
  requires: [
    'Portal.ui.SummaryPie', 
    'Portal.ui.SummaryNumbers']
  config:
    fullscreen: true
    layout: 'vbox'
    items: [
      {
        xtype: 'titlebar'
        title: 'Summary'
      }]
      
  initialize: -> 
    @callParent()
    @add(contentPanel)
      
  setSummary: (context) ->
    @down('#company-name').setHtml(context.company_name)
    @down('#summary-panel').setSummary(context.summary)
    @down('#summary-pie').setSummary(context.summary)
