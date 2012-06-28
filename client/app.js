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
    launch: function() {
      var home_screen, login_screen, validateUser, viewport;
      viewport = Ext.Viewport;
      validateUser = function(params) {
        return Ext.Ajax.request({
          url: "/validate",
          method: 'POST',
          jsonData: params.credentials,
          success: function(response) {
            var context;
            context = Ext.decode(response.responseText);
            return params.success(context);
          },
          failure: params.failure
        });
      };
      home_screen = Ext.create('Portal.ui.HomeScreen', {
        id: 'home-screen',
        orientation: viewport.getOrientation()
      });
      login_screen = Ext.create('Portal.ui.LoginScreen', {
        id: 'login-screen',
        listeners: {
          loginRequest: function(login, password) {
            return validateUser({
              credentials: {
                login: login,
                password: password
              },
              success: function(context) {
                home_screen.setContext(context);
                return viewport.setActiveItem(home_screen);
              },
              failure: function(response) {
                return Ext.Msg.alert('Login error', 'Invalid user name or password');
              }
            });
          }
        }
      });
      viewport.setActiveItem(login_screen);
      return viewport.on('orientationchange', function(viewport, orientation) {
        return home_screen.setOrientation(orientation);
      });
    }
  });

}).call(this);
