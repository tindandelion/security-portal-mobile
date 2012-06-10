Ext.define 'Portal.ui.Pie', 
    
  constructor: (config) -> 
    @element = config.element
    this
  
  draw: (box) -> 
    pixelRatio = window.devicePixelRatio
    canvas = @element.dom 
    
    @updateBox(box)
    canvas.width = box.width * pixelRatio
    canvas.height = box.height * pixelRatio
    context = canvas.getContext("2d") 
    @drawPie(context, canvas.width, canvas.height)
    
  updateBox: (box) -> @element.setBox(box)
  
  drawPie: (context, width, height) -> 
    @drawSector context,
      center: 
        x: width / 2
        y: height / 2
      angles: 
        start: 0
        end: Math.PI / 3
      fill: "#dc322f"
    @drawSector context,
      center: 
        x: width / 2
        y: height / 2
      angles: 
        start: Math.PI / 3
        end: Math.PI
      fill: "#b58900"
    @drawSector context,
      center: 
        x: width / 2
        y: height / 2
      angles: 
        start: Math.PI
        end: Math.PI * 2
      fill: "#2aa198"
    
  drawSector: (context, sector) -> 
    rotation = Math.PI / 2
    {x:cx, y:cy} = sector.center
    {start, end} = sector.angles
    radius = Math.min(cx, cy) - 5
    
    context.beginPath()
    context.moveTo(cx, cy)
    context.arc(cx, cy, radius, start - rotation, end - rotation)
    context.lineTo(cx, cy)
    context.closePath()
    context.fillStyle = sector.fill
    context.strokeStyle = '#eee8d5'
    context.lineWidth = 2
    context.fill()
    context.stroke()

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
    
  
    
  
