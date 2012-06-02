Ext.application
  name: 'Portal'
  
  icon: 
    114: 'images/app-icon-114.png'
  glossOnIcon: false
  startupImage: 
    '640x920': 'images/startup-screen-640-920.png'
  
  requires: [
    'Portal.ui.HomeScreen',
    'Portal.ui.LoginScreen'
    ]
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
            success: (summary) -> 
              home_screen.setSummary(summary)
              Ext.Viewport.setActiveItem(home_screen)
            failure: (response) -> 
              Ext.Msg.alert('Login error', 'Invalid user name or password')
      
    Ext.Viewport.setActiveItem(login_screen)
