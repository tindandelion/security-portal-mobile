(function() {

  Ext.define('Portal.controller.Login', {
    extend: 'Ext.app.Controller',
    requires: ['Ext.MessageBox'],
    config: {
      refs: {
        viewport: 'viewport',
        homeScreen: '#home-screen',
        loginScreen: '#login-screen'
      },
      control: {
        loginScreen: {
          loginrequest: 'onLoginRequest'
        }
      }
    },
    launch: function() {
      return this.showLoginScreen();
    },
    onLoginRequest: function(login, password) {
      var _this = this;
      return Ext.Ajax.request({
        url: "/validate",
        method: 'POST',
        jsonData: {
          login: login,
          password: password
        },
        success: function(response) {
          var context;
          context = Ext.decode(response.responseText);
          return _this.showHomeScreen(context);
        },
        failure: function() {
          return _this.showLoginError();
        }
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
    showLoginError: function() {
      return Ext.Msg.alert('Login error', 'Invalid user name or password');
    }
  });

}).call(this);
