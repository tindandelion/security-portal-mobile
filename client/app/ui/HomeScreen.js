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
      this.currentPanel = Portal.ui.SummaryView.forOrientation(newOrientation);
      if (this.context) {
        this.currentPanel.setContext(this.context);
      }
      return this.add(this.currentPanel);
    },
    setContext: function(context) {
      this.context = context;
      return this.currentPanel.setContext(this.context);
    }
  });

}).call(this);
