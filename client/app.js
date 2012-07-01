(function() {

  Ext.application({
    name: 'Portal',
    icon: {
      57: 'images/app-icon-57.png',
      114: 'images/app-icon-114.png'
    },
    startupImage: {
      '320x460': 'images/startup-screen-320-460.png',
      '640x920': 'images/startup-screen-640-920.png'
    },
    requires: ['Portal.ui.HomeScreen', 'Portal.ui.LoginScreen'],
    controllers: ['Main'],
    launch: function() {
      var controller;
      controller = this.getController('Main');
      Ext.create('Portal.ui.HomeScreen', {
        id: 'home-screen',
        orientation: Ext.Viewport.getOrientation()
      });
      return Ext.create('Portal.ui.LoginScreen', {
        id: 'login-screen',
        listeners: {
          loginRequest: function(login, password) {
            return controller.validateUser({
              credentials: {
                login: login,
                password: password
              },
              success: function(context) {
                return controller.showHomeScreen(context);
              },
              failure: function(response) {
                return controller.showLoginError();
              }
            });
          }
        }
      });
    }
  });

}).call(this);
