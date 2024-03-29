Ext.application
  name: 'Portal'
  icon: 
    57: 'images/app-icon-57.png'
    114: 'images/app-icon-114.png'
  startupImage:
    '320x460': 'images/startup-screen-320-460.png' 
    '640x920': 'images/startup-screen-640-920.png'
    
  controllers: ['Login', 'Home']
  views: ['Login', 'Home']
  
  launch: -> 
    Ext.create 'Portal.view.Home', 
      orientation: Ext.Viewport.getOrientation()
      id: 'home-screen'
      
    Ext.create 'Portal.view.Login', 
      id: 'login-screen'
