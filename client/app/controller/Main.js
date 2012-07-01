(function() {

  Ext.define('Portal.controller.Main', {
    extend: 'Ext.app.Controller',
    config: {
      refs: {
        viewport: 'viewport',
        homeScreen: '#home-screen',
        loginScreen: '#login-screen'
      },
      control: {
        viewport: {
          orientationchange: function(viewport, orientation) {
            return this.getHomeScreen().setOrientation(orientation);
          }
        }
      }
    },
    launch: function() {
      return this.showLoginScreen();
    },
    validateUser: function(params) {
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
    },
    showHomeScreen: function(context) {
      var screen;
      screen = this.getHomeScreen();
      screen.setContext(context);
      return this.getViewport().setActiveItem(screen);
    },
    showLoginScreen: function() {
      return this.getViewport().setActiveItem(this.getLoginScreen());
    },
    getOrientation: function() {
      return this.getViewport().getOrientation();
    },
    showLoginError: function() {
      return Ext.Msg.alert('Login error', 'Invalid user name or password');
    }
  });

}).call(this);
