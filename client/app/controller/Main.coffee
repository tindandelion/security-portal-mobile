Ext.define 'Portal.controller.Main', 
  extend: 'Ext.app.Controller'
  config: 
    refs: 
      viewport: 'viewport'
      homeScreen: '#home-screen'
      loginScreen: '#login-screen'
    control: 
      viewport: 
        orientationchange: (viewport, orientation)-> 
          @getHomeScreen().setOrientation(orientation)
          
  launch: -> 
    @showLoginScreen()
    
  validateUser: (params) -> 
    Ext.Ajax.request
      url: "/validate"
      method: 'POST'
      jsonData: params.credentials
      success: (response) ->
        context = Ext.decode(response.responseText) 
        params.success(context)
      failure: params.failure
    
  showHomeScreen: (context) -> 
    screen = @getHomeScreen()
    screen.setContext(context)
    @getViewport().setActiveItem(screen)
    
  showLoginScreen: -> 
    @getViewport().setActiveItem(@getLoginScreen())
    
  getOrientation: -> 
    @getViewport().getOrientation()
  
  showLoginError: -> 
    Ext.Msg.alert('Login error', 'Invalid user name or password')
    