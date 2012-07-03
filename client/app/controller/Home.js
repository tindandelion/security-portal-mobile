(function() {

  Ext.define('Portal.controller.Home', {
    extend: 'Ext.app.Controller',
    config: {
      refs: {
        viewport: 'viewport',
        homeScreen: '#home-screen'
      },
      control: {
        viewport: {
          orientationchange: 'onOrientationChange'
        }
      }
    },
    onOrientationChange: function(viewport, orientation) {
      return this.getHomeScreen().setOrientation(orientation);
    }
  });

}).call(this);
