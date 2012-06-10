Ext.define 'Portal.ui.PieSlicer',
  sectors: []
  
  setData: (data) -> 
    toDisplay = ({type, count} for type, count of data when count > 0)
    @sectors = @calculateSectors(toDisplay)

  drawOn: (canvas) -> 
    return if @sectors.length == 0
    
    if @sectors.length == 1
      @drawSingleSector(canvas, @sectors[0].type)
    else
      @drawMultiSectors(canvas, @sectors)
  
  drawSingleSector: (canvas, type) -> 
    canvas.circle(type)
    
  calculateSectors: (items) -> 
    total = @totalOf(items)
    for item in items
      angle = 2 * Math.PI * item.count / total
      {type: item.type, angle}
    
  totalOf: (values) -> 
    total = 0
    for value in values 
      total += value.count 
    total
  
  drawMultiSectors: (canvas, sectors) ->
    startAngle = 0
    for sector in sectors 
      endAngle = startAngle + sector.angle
      canvas.sector(startAngle, endAngle, sector.type)
      startAngle = endAngle
      
