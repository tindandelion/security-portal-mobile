Ext.define 'Portal.ui.HomeScreen',
  extend: 'Ext.Panel'
  config:
    fullscreen: true
    items: [
      {
        xtype: 'titlebar'
        id: 'company-name'
        title: 'Company Name'
      }]
  setCompany: (company) ->
    @child('#company-name').setTitle(company)
