(function() {

  Ext.define('Portal.ui.SummaryEntry', {
    extend: 'Ext.Panel',
    xtype: 'summaryentry',
    config: {
      label: '',
      count: 0,
      baseCls: 'summary-entry',
      items: [
        {
          xtype: 'label',
          cls: 'label',
          itemId: 'label'
        }, {
          xtype: 'label',
          cls: 'count',
          itemId: 'count'
        }
      ]
    },
    updateLabel: function(newValue) {
      return this.child('#label').setHtml(newValue);
    },
    updateCount: function(newValue) {
      return this.child('#count').setHtml(newValue.toString());
    }
  });

}).call(this);
