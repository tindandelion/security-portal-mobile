Ext.define 'Portal.ui.HomeScreen',
  extend: 'Ext.Container'
  requires: ['Portal.ui.Placeholder', 'Portal.ui.SummaryPanel']
  config:
    fullscreen: true
    layout: 'vbox'
    items: [
      {
        xtype: 'titlebar'
        title: 'Summary'
      }, 
      {
        xtype: 'label'
        cls: 'company-name-label'
        id: 'company-name'
        dock: 'top'
        html: 'Company Name'
      },
      {
        xtype: 'placeholder'
        flex: 1
      },
      {
        xtype: 'summarypanel'
        id: 'summary-panel'
        dock: 'bottom'
      }]
      
  setSummary: (context) ->
    @child('#company-name').setHtml(context.company_name)
    @child('#summary-panel').setSummary(context.summary)
