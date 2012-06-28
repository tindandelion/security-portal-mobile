CONFIG_VERT = {
  layout: 'vbox', flex: 1
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
      orientation: 'portrait'
      dock: 'bottom'
    }]
}

CONFIG_HORZ = {
  layout: 'hbox', flex: 1
  items: [
    {
      xtype: 'panel', layout: 'vbox', flex: 1
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
        }]
    },
    {
      xtype: 'summarynumbers'
      id: 'summary-panel'
      orientation: 'landscape'
      dock: 'right'
    }]
}

Ext.define 'Portal.ui.SummaryView', 
  extend: 'Ext.Panel'
  requires: [
    'Portal.ui.SummaryPie', 
    'Portal.ui.SummaryNumbers']
  statics: 
    forOrientation: (orientation) ->
      config = @configFor(orientation)
      new Portal.ui.SummaryView(config)
      
    configFor: (orientation) ->
      return CONFIG_VERT if orientation == 'portrait'
      return CONFIG_HORZ if orientation == 'landscape'
  
  setContext: (context) ->
    @down('#company-name').setHtml(context.company_name)
    @down('#summary-panel').setSummary(context.summary)
    @down('#summary-pie').setSummary(context.summary)
