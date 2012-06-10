Ext.define 'Portal.ui.PieSlicer',
  sectors: []
    
  draw: (canvas) -> 
    for sector in @sectors 
      canvas.sector(sector.start, sector.end, sector.type)
      
  setData: (data) -> 
    @sectors = [
      {start: 0; end: Math.PI / 3; type: 'critical'},
      {start: Math.PI / 3; end: Math.PI; type: 'warning'},
      {start: Math.PI; end: Math.PI * 2; type: 'protected'}]
