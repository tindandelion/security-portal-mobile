Ext.define 'Portal.ui.HomeScreen',
  extend: 'Ext.Panel'
  config:
    fullscreen: true
    items: [
      {
        xtype: 'label'
        id: 'company-name'
        html: 'Company Name'
      }]
