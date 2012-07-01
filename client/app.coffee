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
    
  controllers: ['Main']
  
  launch: -> 
    controller = @getController('Main')

    Ext.create 'Portal.ui.HomeScreen', 
      id: 'home-screen'
      orientation: controller.getOrientation()
      
    Ext.create 'Portal.ui.LoginScreen', 
      id: 'login-screen'
      listeners: 
        loginRequest: (login, password) -> 
          controller.validateUser
            credentials: {login, password}
            success: (context) -> controller.showHomeScreen(context)
            failure: (response) -> controller.showLoginError()
              
    controller.showLoginScreen()
      
