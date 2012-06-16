(function() {

  Ext.define('Portal.ui.HomeScreen', {
    extend: 'Ext.Container',
    requires: ['Portal.ui.SummaryPie', 'Portal.ui.SummaryPanel'],
    config: {
      fullscreen: true,
      layout: 'vbox',
      items: [
        {
          xtype: 'titlebar',
          title: 'Summary'
        }, {
          xtype: 'label',
          cls: 'company-name-label',
          id: 'company-name',
          dock: 'top',
          html: 'Company Name'
        }, {
          xtype: 'summarypie',
          id: 'summary-pie',
          flex: 1
        }, {
          xtype: 'summarypanel',
          id: 'summary-panel',
          dock: 'bottom'
        }
      ]
    },
    initialize: function() {
      var _this = this;
      this.callParent(arguments);
      return Ext.Viewport.on('orientationchange', function(viewport, orientation) {
        return _this.changeOrientation(orientation);
      });
    },
    setSummary: function(context) {
      this.child('#company-name').setHtml(context.company_name);
      this.child('#summary-panel').setSummary(context.summary);
      return this.child('#summary-pie').setSummary(context.summary);
    },
    changeOrientation: function(orientation) {
      return console.log("Changed orientation to: " + orientation);
    }
  });

}).call(this);
