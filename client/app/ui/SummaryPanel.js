(function() {

  Ext.define('Portal.ui.SummaryPanel', {
    extend: 'Ext.Container',
    requires: ['Portal.ui.SummaryPanelItem'],
    xtype: 'summarypanel',
    config: {
      layout: 'hbox',
      cls: 'summary-panel',
      items: [
        {
          xtype: 'summarypanelitem',
          cls: 'critical',
          label: 'CRITICAL',
          itemId: 'critical',
          flex: 1
        }, {
          xtype: 'summarypanelitem',
          cls: 'warning',
          label: 'WARNING',
          itemId: 'warning',
          flex: 1
        }, {
          xtype: 'summarypanelitem',
          cls: 'protected',
          label: 'PROTECTED',
          itemId: 'protected',
          flex: 1
        }
      ]
    },
    setSummary: function(summary) {
      var item, _i, _len, _ref, _results;
      _ref = this.summaryPanelItems();
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        item = _ref[_i];
        _results.push(item.setCount(summary[item.getItemId()]));
      }
      return _results;
    },
    summaryPanelItems: function() {
      return this.getItems().items;
    }
  });

}).call(this);
