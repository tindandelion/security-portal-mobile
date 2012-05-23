Ext.require [
  'Portal.ui.HomeScreen',
  'Portal.ui.LoginScreen']

Ext.application
  name: 'Portal'
  launch: -> 
    validateUser = (params) ->
      Ext.Ajax.request
        url: "/validate"
        method: 'POST'
        jsonData: params.credentials
        success: (response) ->
          context = Ext.decode(response.responseText) 
          params.success(context)
        failure: params.failure

    home_screen = Ext.create 'Portal.ui.HomeScreen', id: 'home-screen'
    login_screen = Ext.create 'Portal.ui.LoginScreen', 
      id: 'login-screen'
      listeners: 
        loginRequest: (login, password) -> 
          validateUser
            credentials: {login, password}
            success: (context) -> 
              home_screen.setCompany(context.company)
              Ext.Viewport.setActiveItem(home_screen)
            failure: (response) -> 
              Ext.Msg.alert('Login error', 'Invalid user name or password')
      
    Ext.Viewport.setActiveItem(login_screen)
