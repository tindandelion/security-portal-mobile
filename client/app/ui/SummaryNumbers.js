(function() {

  Ext.define('Portal.ui.SummaryNumbers', {
    extend: 'Ext.Container',
    requires: ['Portal.ui.SummaryEntry'],
    xtype: 'summarynumbers',
    config: {
      cls: 'summary-panel',
      items: [
        {
          xtype: 'summaryentry',
          cls: 'critical',
          label: 'CRITICAL',
          itemId: 'critical',
          flex: 1
        }, {
          xtype: 'summaryentry',
          cls: 'warning',
          label: 'WARNING',
          itemId: 'warning',
          flex: 1
        }, {
          xtype: 'summaryentry',
          cls: 'protected',
          label: 'PROTECTED',
          itemId: 'protected',
          flex: 1
        }
      ]
    },
    setSummary: function(summary) {
      var item, _i, _len, _ref, _results;
      _ref = this.summaryEntries();
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        item = _ref[_i];
        _results.push(item.setCount(summary[item.getItemId()]));
      }
      return _results;
    },
    summaryEntries: function() {
      return this.getItems().items;
    }
  });

}).call(this);
