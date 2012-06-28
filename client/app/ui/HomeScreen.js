(function() {

  Ext.define('Portal.ui.HomeScreen', {
    extend: 'Ext.Container',
    requires: ['Portal.ui.SummaryView'],
    config: {
      orientation: 'portrait',
      fullscreen: true,
      layout: 'vbox',
      items: [
        {
          xtype: 'titlebar',
          title: 'Summary'
        }
      ]
    },
    applyOrientation: function(newOrientation) {
      if (this.currentPanel) {
        this.currentPanel.destroy();
      }
      return this.currentPanel = this.add(Portal.ui.SummaryView.forOrientation(newOrientation));
    },
    setContext: function(context) {
      return this.currentPanel.setContext(context);
    }
  });

}).call(this);
