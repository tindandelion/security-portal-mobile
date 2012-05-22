Ext.Loader.setPath('Portal', 'client/Portal')
Ext.require ['Portal.core.Backend']

describe "Backend", ->
  
  it "gets created", ->
    backend = Ext.create("Portal.core.Backend")
    expect(backend).toBeDefined()
