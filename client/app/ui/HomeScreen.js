(function() {

  Ext.define('Portal.ui.HomeScreen', {
    extend: 'Ext.Container',
    requires: ['Portal.ui.SummaryPie', 'Portal.ui.SummaryNumbers'],
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
          xtype: 'summarynumbers',
          id: 'summary-panel',
          dock: 'bottom'
        }
      ]
    },
    setSummary: function(context) {
      this.child('#company-name').setHtml(context.company_name);
      this.child('#summary-panel').setSummary(context.summary);
      return this.child('#summary-pie').setSummary(context.summary);
    }
  });

}).call(this);
