Ext.require ['Portal.ui.SummaryNumbers']

describe 'SummaryNumbers', ->
  beforeEach ->
    @panel = Ext.create 'Portal.ui.SummaryNumbers', {}
    
  afterEach ->
    @panel.destroy()
    
  it "gets created with correct number of items", ->
    expect(@panel.summaryEntries().length).toEqual(3)
    
  it "sets count values to corresponding items", ->
    summary = 
      critical: 5
      warning: 6
      protected: 1
      
    @panel.setSummary(summary)
    
    expect(@panel.child('#critical').getCount()).toEqual(5)
    expect(@panel.child('#warning').getCount()).toEqual(6)
    expect(@panel.child('#protected').getCount()).toEqual(1)
    
