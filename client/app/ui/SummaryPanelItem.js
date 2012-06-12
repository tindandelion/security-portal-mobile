(function() {

  Ext.define('Portal.ui.SummaryPanelItem', {
    extend: 'Ext.Panel',
    xtype: 'summarypanelitem',
    requires: ['Portal.ui.Placeholder'],
    config: {
      label: '',
      count: 0,
      baseCls: 'summary-panel-item',
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
    updateLabel: function(newValue, oldValue) {
      return this.child('#label').setHtml(newValue);
    },
    updateCount: function(newValue) {
      return this.child('#count').setHtml(newValue.toString());
    }
  });

}).call(this);
