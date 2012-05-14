Ext.require [
  'Portal.ui.HomeScreen',
  'Portal.ui.LoginScreen']

Ext.application
  name: 'Portal'
  launch: -> 
    validateUser = (params) ->
      Ext.Ajax.request
        url: "http://localhost:4567/validate"
        method: 'POST'
        jsonData: params.credentials
        success: params.success
    
    home_screen = Ext.create 'Portal.ui.HomeScreen', id: 'home-screen'
    login_screen = Ext.create 'Portal.ui.LoginScreen', 
      id: 'login-screen'
      listeners: 
        loginRequest: (username, password) -> 
          validateUser
            credentials: {username, password}
            success: -> 
              home_screen.setUserName(username)
              Ext.Viewport.setActiveItem(home_screen)
      
    Ext.Viewport.setActiveItem(login_screen)
