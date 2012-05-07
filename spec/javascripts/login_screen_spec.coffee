describe "LoginScreen", ->
  it "initializes", ->
    Ext.Loader.setPath('Portal', 'public/Portal')
    login_screen = Ext.create('Portal.ui.LoginScreen')
    expect(login_screen).not.toBeNull()