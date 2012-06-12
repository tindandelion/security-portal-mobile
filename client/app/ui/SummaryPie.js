(function() {

  Ext.define('Portal.ui.PieCanvas', {
    rotationAngle: Math.PI / 4,
    constructor: function(config) {
      this.element = config.element, this.colors = config.colors;
      this.canvas = this.element.dom;
      return this;
    },
    setBox: function(box) {
      var pixelRatio;
      this.element.setBox(box);
      pixelRatio = window.devicePixelRatio;
      this.canvas.width = box.width * pixelRatio;
      return this.canvas.height = box.height * pixelRatio;
    },
    sector: function(start, end, type) {
      var context, cx, cy, radius;
      cx = this.canvas.width / 2;
      cy = this.canvas.height / 2;
      radius = Math.min(cx, cy) - 5;
      context = this.getContext(this.colors[type]);
      return context.sector(cx, cy, radius, start - this.rotationAngle, end - this.rotationAngle);
    },
    circle: function(type) {
      var context, cx, cy, radius;
      cx = this.canvas.width / 2;
      cy = this.canvas.height / 2;
      radius = Math.min(cx, cy) - 5;
      context = this.getContext(this.colors[type]);
      return context.circle(cx, cy, radius);
    },
    getContext: function(fill) {
      var context;
      context = this.newContext(fill);
      context.sector = function(cx, cy, radius, start, end) {
        this.beginPath();
        this.moveTo(cx, cy);
        this.arc(cx, cy, radius, start, end);
        this.lineTo(cx, cy);
        this.closePath();
        this.fill();
        return this.stroke();
      };
      context.circle = function(cx, cy, radius) {
        this.arc(cx, cy, radius, 0, 2 * Math.PI);
        return this.fill();
      };
      return context;
    },
    newContext: function(fill) {
      var context;
      context = this.canvas.getContext('2d');
      context.fillStyle = fill;
      context.strokeStyle = '#eee8d5';
      context.lineWidth = 2;
      return context;
    }
  });

  Ext.define('Portal.ui.SummaryPie', {
    extend: 'Ext.Component',
    xtype: 'summarypie',
    requires: ['Portal.ui.PieCanvas', 'Portal.ui.PieSlicer'],
    config: {
      baseCls: 'summary-pie',
      html: '<canvas></canvas>'
    },
    initialize: function() {
      this.pieSlicer = Ext.create('Portal.ui.PieSlicer');
      this.pieCanvas = Ext.create('Portal.ui.PieCanvas', {
        element: this.element.down('canvas'),
        colors: {
          'critical': '#dc322f',
          'warning': '#b58900',
          'protected': '#2aa198'
        }
      });
      return this.on('painted', this.draw);
    },
    draw: function() {
      this.pieCanvas.setBox(this.element.getBox());
      return this.pieSlicer.drawOn(this.pieCanvas);
    },
    setSummary: function(summary) {
      return this.pieSlicer.setData(summary);
    }
  });

}).call(this);
