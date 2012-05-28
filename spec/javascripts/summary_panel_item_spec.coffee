Ext.require ['Portal.ui.SummaryPanelItem']

ChildMatchers = 
  toHaveChild: (id, params) ->
    child = @actual.child(id)
    expect(child.getHtml()).toEqual(params.withHtml)
    return true

describe "SummaryPanelItem", ->
  beforeEach -> 
    @addMatchers(ChildMatchers)
    @panel = Ext.create('Portal.ui.SummaryPanelItem') 
    
  afterEach -> 
    @panel.destroy()
    
  it "updates label", ->
    @panel.setLabel('Label text')
    expect(@panel).toHaveChild '#label', withHtml: 'Label text'
    
  it 'updates count', ->
    @panel.setCount(5)
    expect(@panel).toHaveChild '#count', withHtml: '5'
