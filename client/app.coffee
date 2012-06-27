Ext.application
  name: 'Portal'
  icon: 
    57: 'images/app-icon-57.png'
    114: 'images/app-icon-114.png'
  startupImage:
    '320x460': 'images/startup-screen-320-460.png' 
    '640x920': 'images/startup-screen-640-920.png'
  
  requires: [
    'Portal.ui.HomeScreen',
    'Portal.ui.LoginScreen']
  launch: -> 
    viewport = Ext.Viewport 
    
    validateUser = (params) ->
      Ext.Ajax.request
        url: "/validate"
        method: 'POST'
        jsonData: params.credentials
        success: (response) ->
          context = Ext.decode(response.responseText) 
          params.success(context)
        failure: params.failure

    home_screen = Ext.create 'Portal.ui.HomeScreen', 
      id: 'home-screen'
      orientation: viewport.getOrientation()
      
    login_screen = Ext.create 'Portal.ui.LoginScreen', 
      id: 'login-screen'
      listeners: 
        loginRequest: (login, password) -> 
          validateUser
            credentials: {login, password}
            success: (summary) -> 
              home_screen.setSummary(summary)
              viewport.setActiveItem(home_screen)
            failure: (response) -> 
              Ext.Msg.alert('Login error', 'Invalid user name or password')
      
    viewport.setActiveItem(login_screen)
    viewport.on 'orientationchange', (viewport, orientation)-> 
      home_screen.setOrientation(orientation)
