Ext.define 'Portal.ui.Placeholder', 
  extend: 'Ext.Panel'
  xtype: 'placeholder'
  config: 
    style: 'background-color: blue; opacity: 0.3'
    
Ext.define 'Portal.ui.HomeScreen',
  extend: 'Ext.Container'
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
            xtype: 'placeholder'
            id: 'summary-panel'
            height: '4em'
            margin: '0.8em 0 0 0'
            dock: 'bottom'
            html: 'Summary Buttons'
          }]
      }]
      
  setCompany: (company) ->
    @child('#company-name').setHtml(company)
