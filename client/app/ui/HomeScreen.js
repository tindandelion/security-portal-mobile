(function() {
  var contentPanelHorz, contentPanelVert, panels;

  contentPanelVert = {
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
      }, {
        xtype: 'summarynumbers',
        id: 'summary-panel',
        dock: 'bottom'
      }
    ]
  };

  contentPanelHorz = {
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
      }, {
        xtype: 'summarynumbers',
        id: 'summary-panel',
        dock: 'bottom'
      }
    ]
  };

  panels = {
    portrait: contentPanelVert,
    landscape: contentPanelHorz
  };

  Ext.define('Portal.ui.HomeScreen', {
    extend: 'Ext.Container',
    requires: ['Portal.ui.SummaryPie', 'Portal.ui.SummaryNumbers'],
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
    initialize: function() {
      this.callParent();
      return this.add(panels[this.getOrientation()]);
    },
    setSummary: function(context) {
      this.down('#company-name').setHtml(context.company_name);
      this.down('#summary-panel').setSummary(context.summary);
      return this.down('#summary-pie').setSummary(context.summary);
    }
  });

}).call(this);
