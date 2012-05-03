Ext.application
  launch: -> 
    document.title = "PSB Portal Mobile"
    Ext.create "Ext.form.Panel",
      id: 'login-screen'
      fullscreen: true
      items: [
        {
          xtype: 'textfield'
          name: 'login-username'
          label: 'User name'
        },
        {
          xtype: 'passwordfield'
          name: 'login-password'
          label: 'Password'
        },
        {
          xtype: 'button'
          id: 'login-action'
          text: 'Log in'
          ui: 'confirm'
          handler: -> 
            Ext.Viewport.setActiveItem(1)
        }]
    Ext.create "Ext.Panel",
      id: 'home-screen'
      fullscreen: true
      
    