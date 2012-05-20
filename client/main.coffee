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
        failure: params.failure
        
    showLoginError = -> 
      Ext.Msg.alert('Login error', 'Invalid user name or password')
      
    
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
            failure: (response) -> 
              showLoginError()
      
    Ext.Viewport.setActiveItem(login_screen)
