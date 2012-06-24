Ext.require ['Portal.ui.HomeScreen']

layoutMatchers = 
  toBeBelow: (element) -> 
    @message = ->
      "Expected #{@actual.getId()} to be below #{element.getId()}"
    @actual.getBox().top >= element.getBox().bottom
    
  toBeRightOf: (element) -> 
    @message = ->
      "Expected #{@actual.getId()} to be to the right of #{element.getId()}"
    @actual.getBox().left >= element.getBox().right
  
    
class HomeScreenStructure
  constructor: (element) -> 
    @element = element
    
  companyName: -> @element.down('#company-name')
  pie: -> @element.down('#summary-pie')
  numbers: -> @element.down('#summary-panel')

describe 'Home screen rotation', -> 
  viewport = null
    
  it 'gets created in portrait orientation', ->
    screen = createScreen('portrait')
    structure = new HomeScreenStructure(screen.element)
    
    expect(structure.pie()).toBeBelow(structure.companyName())
    expect(structure.numbers()).toBeBelow(structure.pie())
    
  xit 'gets created in landscape orientation', ->
    screen = createScreen('landscape')
    structure = new HomeScreenStructure(screen.element)
    
    expect(structure.pie()).toBeBelow(structure.companyName())
    expect(structure.numbers()).toBeRightOf(structure.pie())
    
    
  createScreen = (orientation) ->
    screen = Ext.create 'Portal.ui.HomeScreen',
      orientation: orientation
    viewport.add(screen)
    screen
    
    
  beforeEach ->
    @addMatchers(layoutMatchers)
    viewport = Ext.create 'Ext.Container',
      renderTo: Ext.getBody()
      layout: 'fit'
    viewport.element.setSize(width: 300, height: 400)

  afterEach ->
    viewport.destroy()