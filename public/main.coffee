Ext.require [
  'Portal.ui.HomeScreen',
  'Portal.ui.LoginScreen']

Ext.application
  launch: -> 
    home_screen = Ext.create 'Portal.ui.HomeScreen', id: 'home-screen'
    login_screen = Ext.create 'Portal.ui.LoginScreen', 
      id: 'login-screen'
      listeners: 
        login: -> 
          credentials = login_screen.getValues()
          home_screen.setUserName(credentials.username)
          Ext.Viewport.setActiveItem(home_screen)
      
    Ext.Viewport.setActiveItem(login_screen)
    
      
    