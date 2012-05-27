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
        styleHtmlContent: true
        cls: 'x-title'
        id: 'company-name'
        dock: 'top'
        html: 'Company Name'
      },
      {
        xtype: 'container'
        flex: 1
        layout: 'vbox'
        items: [
          {
            xtype: 'placeholder'
            id: 'summary-chart'
            html: 'Summary Chart'
            flex: 1
          }, 
          {
            xtype: 'summarypanel'
            id: 'summary-panel'
            height: '4em'
            margin: '0.8em 0 0 0'
            dock: 'bottom'
          }]
      }]
      
  setCompany: (company) ->
    @child('#company-name').setHtml(company)
