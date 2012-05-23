Ext.define 'Portal.ui.SummaryElement', 
  extend: 'Ext.Panel'
  xtype: 'summaryelement'
  config: 
    baseCls: 'x-button-label'
    cls: 'summary-element'

Ext.define 'Portal.ui.SummaryPanel', 
  extend: 'Ext.Panel'
  xtype: 'summarypanel'
  config: 
    cls: 'summary-panel'
    margin: '0.8em'
    layout: 'hbox'
    items: [
      {
        xtype: 'summaryelement'
        flex: 1
        html: 'Critical'
      }
      {
        xtype: 'summaryelement'
        flex: 1
        html: 'Warnings'
      }
      {
        xtype: 'summaryelement'
        flex: 1
        html: 'Protected'
      }
      ]

Ext.define 'Portal.ui.HomeScreen',
  extend: 'Ext.Panel'
  config:
    fullscreen: true
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
        html: 'Company Name'
      }
      {
        xtype: 'summarypanel'
        id: 'summary-panel'
        docked: 'bottom'
      }]
  setCompany: (company) ->
    @child('#company-name').setHtml(company)
