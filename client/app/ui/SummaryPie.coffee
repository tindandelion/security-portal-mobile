Ext.define 'Portal.ui.PieCanvas', 
  constructor: (canvas) -> 
    @canvas = canvas
    this
    
  setBounds: (bounds) -> 
    pixelRatio = window.devicePixelRatio
    @canvas.width = bounds.width * pixelRatio
    @canvas.height = bounds.height * pixelRatio
    
  sector: (start, end, fill) -> 
    cx = @canvas.width / 2
    cy = @canvas.height / 2
    radius = Math.min(cx, cy) - 5
    context = @getContext(fill)
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

Ext.define 'Portal.ui.Pie', 
  constructor: (element) -> 
    @element = element
    @canvas = Ext.create('Portal.ui.PieCanvas', @element.dom)
    @sectors = []
    this
    
  draw: (bounds) -> 
    @element.setBox(bounds)
    @canvas.setBounds(bounds)
    for sector in @sectors 
      @canvas.sector(sector.start, sector.end, sector.fill)
      
  setData: (data) -> 
    @sectors = [
      {start: 0; end: Math.PI / 3; fill: "#dc322f"},
      {start: Math.PI / 3; end: Math.PI ; fill: "#b58900"},
      {start: Math.PI; end: Math.PI * 2; fill: "#2aa198"}]
    
    

Ext.define 'Portal.ui.SummaryPie',
  extend: 'Ext.Component'
  xtype: 'summarypie'
  config: 
    baseCls: 'summary-pie'
    html: '<canvas></canvas>'
        
  initialize: -> 
    @canvas = @element.down('canvas')
    @pie = Ext.create('Portal.ui.Pie', @canvas)
    @on 'painted', -> @pie.draw(@element.getBox())
  
  setSummary: (summary) ->
    @pie.setData(summary)
    
  
