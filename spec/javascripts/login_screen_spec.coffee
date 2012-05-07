describe "LoginScreen", ->
  it "initializes", ->
    login_screen = Ext.create('Portal.ui.LoginScreen')
    expect(login_screen).not.toBeNull()