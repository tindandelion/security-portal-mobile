(function() {
  var CONFIG_HORZ, CONFIG_VERT;

  CONFIG_VERT = {
    layout: 'vbox',
    flex: 1,
    items: [
      {
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
        orientation: 'portrait',
        dock: 'bottom'
      }
    ]
  };

  CONFIG_HORZ = {
    layout: 'hbox',
    flex: 1,
    items: [
      {
        xtype: 'panel',
        layout: 'vbox',
        flex: 1,
        items: [
          {
            xtype: 'label',
            cls: 'company-name-label',
            id: 'company-name',
            dock: 'top',
            html: 'Company Name'
          }, {
            xtype: 'summarypie',
            id: 'summary-pie',
            flex: 1
          }
        ]
      }, {
        xtype: 'summarynumbers',
        id: 'summary-panel',
        orientation: 'landscape',
        dock: 'right'
      }
    ]
  };

  Ext.define('Portal.ui.SummaryView', {
    extend: 'Ext.Panel',
    requires: ['Portal.ui.SummaryPie', 'Portal.ui.SummaryNumbers'],
    statics: {
      forOrientation: function(orientation) {
        var config;
        config = this.configFor(orientation);
        return new Portal.ui.SummaryView(config);
      },
      configFor: function(orientation) {
        if (orientation === 'portrait') {
          return CONFIG_VERT;
        }
        if (orientation === 'landscape') {
          return CONFIG_HORZ;
        }
      }
    },
    setContext: function(context) {
      this.down('#company-name').setHtml(context.company_name);
      this.down('#summary-panel').setSummary(context.summary);
      return this.down('#summary-pie').setSummary(context.summary);
    }
  });

}).call(this);
