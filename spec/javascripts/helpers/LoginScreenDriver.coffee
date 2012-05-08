class LoginScreenDriver 
  constructor: (screen) -> 
    @screen = screen
  
  clickLogin: ->
    button = @screen.child('#action')
    handler = button.getHandler()
    handler(button)
  
  setCredentials: (username, password) ->
    @screen.setValues({username, password})

window.LoginScreenDriver = LoginScreenDriver