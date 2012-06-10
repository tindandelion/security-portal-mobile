Ext.define 'Portal.ui.PieCanvas', 
  constructor: (canvas) -> 
    @canvas = canvas
    this
    
  setBounds: (bounds) -> 
    pixelRatio = window.devicePixelRatio
    @canvas.width = bounds.width * pixelRatio
    @canvas.height = bounds.height * pixelRatio
    
  sector: (cx, cy, radius, start, end, color) -> 
    context = @getContext()
    center = @getCenter()
    @drawSector(context, center.x, center.y, radius, start, end, color)
  
  getCenter: -> 
    x: @canvas.width / 2
    y: @canvas.height / 2
    
  getContext: -> 
    context = @canvas.getContext('2d')
    context.strokeStyle = '#eee8d5'
    context.lineWidth = 2
    context
    
  drawSector: (context, cx, cy, radius, start, end, color) -> 
    rotation = Math.PI / 2

    context.beginPath()
    context.moveTo(cx, cy)
    context.arc(cx, cy, radius, start - rotation, end - rotation)
    context.lineTo(cx, cy)
    context.closePath()
    context.fillStyle = color
    context.fill()
    context.stroke()



Ext.define 'Portal.ui.Pie', 
  constructor: (config) -> 
    @element = config.element
    @canvas = Ext.create('Portal.ui.PieCanvas', @element.dom)
    this
    
  getCanvas: -> @canvas.canvas
  
  draw: (bounds) -> 
    @updateBounds(bounds)
    @drawPie()
    
  updateBounds: (bounds) -> 
    pixelRatio = window.devicePixelRatio
    @element.setBox(bounds)
    @canvas.setBounds(bounds)
  
  drawPie: -> 
    sectors = [
      {start: 0; end: Math.PI / 3; fill: "#dc322f"},
      {start: Math.PI / 3; end: Math.PI ; fill: "#b58900"},
      {start: Math.PI; end: Math.PI * 2; fill: "#2aa198"}]
      
    @drawSector(sector) for sector in sectors
    
  drawSector: (sector) -> 
    {x:cx, y:cy} = @canvas.getCenter()
    
    {start, end} = sector
    radius = Math.min(cx, cy) - 5
    
    @canvas.sector(cx, cy, radius, start, end, sector.fill)

Ext.define 'Portal.ui.SummaryPie',
  extend: 'Ext.Component'
  xtype: 'summarypie'
  config: 
    baseCls: 'summary-pie'
    html: '<canvas></canvas>'
        
  initialize: -> 
    @pie = Ext.create 'Portal.ui.Pie', 
      element: @element.down('canvas')
      
    @on 'painted', -> @pie.draw(@element.getBox())
  
  setSummary: (value) ->
    
  
    
  
