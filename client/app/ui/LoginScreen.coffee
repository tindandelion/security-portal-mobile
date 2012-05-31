Ext.define 'Portal.ui.LoginScreen', 
  extend: 'Ext.form.Panel'
  config:
    fullscreen: true
    items: [
      {
        xtype: 'fieldset'
        items: [
          {
            xtype: 'textfield'
            name: 'username'
            placeHolder: 'User name'
          },
          {
            xtype: 'passwordfield'
            name: 'password'
            placeHolder: 'Password'
          }]
      },
      {
        xtype: 'button'
        id: 'action'
        text: 'Log in'
        ui: 'confirm'
      }]
  
  initialize: -> 
    @callParent(arguments)
    @child('#action').setHandler => 
      credentials = @getValues()
      @fireEvent('loginRequest', credentials.username, credentials.password)    
