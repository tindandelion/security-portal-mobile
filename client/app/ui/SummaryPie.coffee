Ext.define 'Portal.ui.PieCanvas', 
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
    context.sector(cx, cy, radius, start, end)
    
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
    context
  
  newContext: (fill) -> 
    context = @canvas.getContext('2d')
    context.fillStyle = fill
    context.strokeStyle = '#eee8d5'
    context.lineWidth = 2
    context

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
    
    

Ext.define 'Portal.ui.SummaryPie',
  extend: 'Ext.Component'
  xtype: 'summarypie'
  config: 
    baseCls: 'summary-pie'
    html: '<canvas></canvas>'
        
  initialize: -> 
    @pieSlicer = Ext.create('Portal.ui.PieSlicer')
    @pieCanvas = Ext.create 'Portal.ui.PieCanvas', 
      element: @element.down('canvas')
      colors: 
        'critical': '#2aa198'
        'warning': '#b58900'
        'protected': '#dc322f'
        
    @on 'painted', @draw
      
  draw: -> 
    @pieCanvas.setBox(@element.getBox())
    @pieSlicer.draw(@pieCanvas)
  
  setSummary: (summary) ->
    @pieSlicer.setData(summary)
    
  
