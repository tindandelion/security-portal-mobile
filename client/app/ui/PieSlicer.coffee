Ext.define 'Portal.ui.PieSlicer',
  setData: (data) -> @data = data

  drawOn: (canvas) -> 
    itemsToDisplay = ({type, count} for type, count of @data when count > 0)
    return if itemsToDisplay.length == 0
    
    if itemsToDisplay.length == 1
      @drawSingleSector(canvas, itemsToDisplay[0].type)
    else
      sectors = @calculateSectors(itemsToDisplay)
      @drawMultiSectors(canvas, sectors)
  
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
      
