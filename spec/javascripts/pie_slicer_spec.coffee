Ext.require 'Portal.ui.PieSlicer'

describe 'PieSlicer', -> 
  beforeEach ->
    @slicer = Ext.create('Portal.ui.PieSlicer')
    @canvas = jasmine.createSpyObj('canvas', ['circle', 'sector'])
     
  it 'gets created', -> 
    expect(@slicer).toBeDefined()
    
  it 'draws a circle if all computers are protected', -> 
    @slicer.setData 
      critical: 0
      warning: 0
      protected: 10
    @slicer.draw(@canvas)
    expect(@canvas.circle).toHaveBeenCalledWith('protected')
    
  it 'draws a circle if all computers are critical', ->
    @slicer.setData 
      critical: 10
      warning: 0
      protected: 0
    @slicer.draw(@canvas)
    expect(@canvas.circle).toHaveBeenCalledWith('critical')
    
  it 'draws nothing if no computers are found', ->
    @slicer.setData 
      critical: 0
      warning: 0
      protected: 0
    @slicer.draw(@canvas)
    expect(@canvas.circle).not.toHaveBeenCalled()
    
  it 'draws 2 sectors if there are critical and protected computers', ->
    @slicer.setData
      critical: 1
      warning: 0
      protected: 1
    @slicer.draw(@canvas)
    expect(@canvas.sector).toHaveBeenCalledWith(0, Math.PI, 'critical')
    expect(@canvas.sector).toHaveBeenCalledWith(Math.PI, Math.PI * 2, 'protected')
    
  it 'draws 3 sectors if there are all types of data', ->
    @slicer.setData
      critical: 1
      warning: 1
      protected: 2
    @slicer.draw(@canvas)
    expect(@canvas.sector).toHaveBeenCalledWith(0, Math.PI / 2, 'critical')
    expect(@canvas.sector).toHaveBeenCalledWith(Math.PI / 2, Math.PI, 'warning')
    expect(@canvas.sector).toHaveBeenCalledWith(Math.PI, Math.PI * 2, 'protected')
  