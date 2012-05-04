Ext.application
  launch: -> 
    document.title = "PSB Portal Mobile"
    home_screen = Ext.create "Ext.Panel",
      id: 'home-screen'
      fullscreen: true
      items: [
        {
          xtype: 'label'
          id: 'current-user'
          html: 'Current User'
        }
        ]
    
    login_screen = Ext.create "Ext.form.Panel",
      id: 'login-screen'
      fullscreen: true
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
            current_user_label = home_screen.child('#current-user')
            current_user_label.setHtml(credentials.username)
            Ext.Viewport.setActiveItem(home_screen)
        }]
    Ext.Viewport.setActiveItem(login_screen)
    
      
    