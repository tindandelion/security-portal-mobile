Ext.define 'Portal.ui.PieSlicer',
  sectors: []
    
  draw: (canvas) -> 
    displayed = ({type, count} for type, count of @data when count > 0)
    return if displayed.length == 0
    
    if displayed.length == 1
      @drawSingleSector(canvas, displayed[0].type)
    else
      sectors = @calculateSectors(displayed)
      @drawMultiSectors(canvas, sectors)
  
  drawSingleSector: (canvas, type) -> 
    canvas.circle(type)
    
  calculateSectors: (items) -> 
    total = @totalOf(items)
    @respectiveAnglesOf(items, total)
    
  totalOf: (values) -> 
    total = 0
    total += value.count for value in values 
    total
  
  respectiveAnglesOf: (values, total) -> 
    for value in values
      angle = 2 * Math.PI * value.count / total
      {type: value.type, angle}
    
  drawMultiSectors: (canvas, sectors) ->
    startAngle = 0
    for sector in sectors 
      endAngle = startAngle + sector.angle
      canvas.sector(startAngle, endAngle, sector.type)
      startAngle = endAngle
      
  setData: (data) -> @data = data
