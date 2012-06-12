(function() {

  Ext.define('Portal.ui.PieSlicer', {
    sectors: [],
    setData: function(data) {
      var count, toDisplay, type;
      toDisplay = (function() {
        var _results;
        _results = [];
        for (type in data) {
          count = data[type];
          if (count > 0) {
            _results.push({
              type: type,
              count: count
            });
          }
        }
        return _results;
      })();
      return this.sectors = this.calculateSectors(toDisplay);
    },
    drawOn: function(canvas) {
      if (this.sectors.length === 0) {
        return;
      }
      if (this.sectors.length === 1) {
        return this.drawSingleSector(canvas, this.sectors[0].type);
      } else {
        return this.drawMultiSectors(canvas, this.sectors);
      }
    },
    drawSingleSector: function(canvas, type) {
      return canvas.circle(type);
    },
    calculateSectors: function(items) {
      var angle, item, total, _i, _len, _results;
      total = this.totalOf(items);
      _results = [];
      for (_i = 0, _len = items.length; _i < _len; _i++) {
        item = items[_i];
        angle = 2 * Math.PI * item.count / total;
        _results.push({
          type: item.type,
          angle: angle
        });
      }
      return _results;
    },
    totalOf: function(values) {
      var total, value, _i, _len;
      total = 0;
      for (_i = 0, _len = values.length; _i < _len; _i++) {
        value = values[_i];
        total += value.count;
      }
      return total;
    },
    drawMultiSectors: function(canvas, sectors) {
      var endAngle, sector, startAngle, _i, _len, _results;
      startAngle = 0;
      _results = [];
      for (_i = 0, _len = sectors.length; _i < _len; _i++) {
        sector = sectors[_i];
        endAngle = startAngle + sector.angle;
        canvas.sector(startAngle, endAngle, sector.type);
        _results.push(startAngle = endAngle);
      }
      return _results;
    }
  });

}).call(this);
