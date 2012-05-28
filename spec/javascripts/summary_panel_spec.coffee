Ext.require ['Portal.ui.SummaryPanel']

describe 'SummaryPanel', ->
    
  it "gets created", ->
    panel = Ext.create('Portal.ui.SummaryPanel')
    expect(panel.items.length).toEqual(3)
    
  it "sets corresponding count values", ->
    panel = Ext.create 'Portal.ui.SummaryPanel'
    summary = 
      critical: 5
      warning: 6
      protected: 1
      
    panel.setSummary(summary)
    
    expect(panel.child('#critical').getCount()).toEqual(5)
    expect(panel.child('#warning').getCount()).toEqual(6)
    expect(panel.child('#protected').getCount()).toEqual(1)
    
