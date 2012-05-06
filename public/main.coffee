Ext.require [
  'Portal.ui.HomeScreen',
  'Portal.ui.LoginScreen']

Ext.application
  launch: -> 
    home_screen = Ext.create 'Portal.ui.HomeScreen', id: 'home-screen'
    
    login_screen = Ext.create 'Portal.ui.LoginScreen',
      id: 'login-screen'
      items: [
        {
          xtype: 'textfield'
          name: 'username'
          label: 'User name'
        },
        {
          xtype: 'passwordfield'
          name: 'password'
          label: 'Password'
        },
        {
          xtype: 'button'
          id: 'action'
          text: 'Log in'
          ui: 'confirm'
          handler: -> 
            credentials = login_screen.getValues()
            home_screen.setUserName(credentials.username)
            Ext.Viewport.setActiveItem(home_screen)
        }]
    Ext.Viewport.setActiveItem(login_screen)
    
      
    