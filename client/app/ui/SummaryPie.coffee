Ext.define 'Portal.ui.PieCanvas', 
  rotationAngle: Math.PI / 4
  
  constructor: (config) -> 
    {@element, @colors} = config
    @canvas = @element.dom
    this
    
  setBox: (box) -> 
    @element.setBox(box)
    pixelRatio = window.devicePixelRatio
    @canvas.width = box.width * pixelRatio
    @canvas.height = box.height * pixelRatio
    
  sector: (start, end, type) -> 
    cx = @canvas.width / 2
    cy = @canvas.height / 2
    radius = Math.min(cx, cy) - 5
    context = @getContext(@colors[type])
    context.sector(cx, cy, radius, start - @rotationAngle, end - @rotationAngle)
    
  circle: (type) -> 
    cx = @canvas.width / 2
    cy = @canvas.height / 2
    radius = Math.min(cx, cy) - 5
    context = @getContext(@colors[type])
    context.circle(cx, cy, radius)
    
  getContext: (fill) -> 
    context = @newContext(fill)
    context.sector = (cx, cy, radius, start, end) -> 
      @beginPath()
      @moveTo(cx, cy)
      @arc(cx, cy, radius, start, end)
      @lineTo(cx, cy)
      @closePath()
      @fill()
      @stroke()
    context.circle = (cx, cy, radius) ->
      @arc(cx, cy, radius, 0, 2 * Math.PI)   
      @fill()
      
    context
  
  newContext: (fill) -> 
    context = @canvas.getContext('2d')
    context.fillStyle = fill
    context.strokeStyle = '#eee8d5'
    context.lineWidth = 2
    context

Ext.define 'Portal.ui.SummaryPie',
  extend: 'Ext.Component'
  xtype: 'summarypie'
  requires: [
    'Portal.ui.PieCanvas', 
    'Portal.ui.PieSlicer']
  config: 
    baseCls: 'summary-pie'
    html: '<canvas style="position: absolute;"></canvas>'
        
  initialize: -> 
    @pieSlicer = Ext.create('Portal.ui.PieSlicer')
    @pieCanvas = Ext.create 'Portal.ui.PieCanvas', 
      element: @element.down('canvas')
      colors: 
        'critical': '#dc322f'
        'warning': '#b58900'
        'protected': '#2aa198'
        
    @on 
      'painted': @draw
      'resize': @draw
      
  draw: -> 
    @pieCanvas.setBox @element.getBox()
    @pieSlicer.drawOn @pieCanvas
  
  setSummary: (summary) ->
    @pieSlicer.setData summary
    
  
