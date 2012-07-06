Ext.require ['Portal.controller.Login']

describe "Login Controller", -> 
  it 'creates', ->
    app = jasmine.createSpyObj('application', ['getRouter', 'control', 'getName'])
    Ext.create 'Portal.controller.Login',
      application: app