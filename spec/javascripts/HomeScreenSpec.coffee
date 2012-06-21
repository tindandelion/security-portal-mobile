Ext.require ['Portal.ui.HomeScreen']

layoutMatchers = 
  toBeBelow: (element) -> 
    actual = @actual
    @message = ->
      "Expected #{actual.getId()} to be below #{element.getId()}"
    actual.getBox().top >= element.getBox().bottom
    
class HomeScreenStructure
  constructor: (element) -> 
    @element = element
    
  companyName: -> @element.down('#company-name')
  pie: -> @element.down('#summary-pie')
  numbers: -> @element.down('#summary-panel')

describe 'Home screen rotation', -> 
  beforeEach ->
    @addMatchers(layoutMatchers)
    @viewport = Ext.create 'Ext.Container',
      renderTo: Ext.getBody()
      layout: 'fit'
    @viewport.element.setSize(width: 300, height: 400)
    
  it 'gets created', ->
    screen = Ext.create 'Portal.ui.HomeScreen'
    @viewport.add(screen)
    
    structure = new HomeScreenStructure(screen.element)
    expect(structure.pie()).toBeBelow(structure.companyName())
    expect(structure.numbers()).toBeBelow(structure.pie())
  