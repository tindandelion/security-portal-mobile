Ext.define 'Portal.ui.HomeScreen',
  extend: 'Ext.Panel'
  config:
    fullscreen: true
    items: [
      {
        xtype: 'label'
        id: 'current-user'
        html: 'Current User'
      }]
      
  setUserName: (value) ->
    @child('#current-user').setHtml(value)
