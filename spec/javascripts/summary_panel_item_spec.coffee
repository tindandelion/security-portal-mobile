Ext.require ['Portal.ui.SummaryPanelItem']

HtmlMatchers = 
  toHaveChild: (id, params) ->
    console.log(@actual)
    child = @actual.child(id)
    expect(child.getHtml()).toEqual(params.withHtml)
    return true
    
  toContainHtml: (html) ->
    expect(@actual.getHtml()).toEqual(html)
    return true

describe "SummaryPanelItem", ->
  beforeEach -> 
    @addMatchers(HtmlMatchers)
    @panel = Ext.create('Portal.ui.SummaryPanelItem') 
    
  afterEach -> 
    @panel.destroy()
    
  it "updates label", ->
    @panel.setLabel('Label text')
    expect(@panel).toHaveChild '#label', withHtml: 'Label text'
    
  it 'updates count', ->
    @panel.setCount(5)
    expect(@panel).toHaveChild '#count', withHtml: '5'
