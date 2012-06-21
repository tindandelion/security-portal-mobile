Ext.require ['Portal.ui.HomeScreen']

describe 'Home screen rotation', -> 
  it 'gets created', ->
    body = Ext.getBody()
    viewport = Ext.create 'Ext.Container',
      renderTo: body
      layout: 'fit'
      
    viewport.element.setSize(width: 300, height: 400)
    
    screen = Ext.create 'Portal.ui.HomeScreen'
    viewport.add(screen)
    
    element = screen.element
    title = element.down('#company-name')
    pie = element.down("#summary-pie")
    numbers = element.down('#summary-panel')
    
    console.log pie.getBox()
    console.log numbers.getBox()
    
    expect(pie.getBox().top).not.toBeLessThan(title.getBox().bottom)
    expect(numbers.getBox().top).not.toBeLessThan(pie.getBox().bottom)
  