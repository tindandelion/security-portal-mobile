class DomButtonClicker
  constructor: (button) ->
    @button = button

  click: -> 
    evt = document.createEvent('MouseEvents')
    evt.initMouseEvent('mouseup', true, true, 
      document.defaultView, 1, 0, 0, 0, 0, 
      false, false, false, false, 0, null);
    @button.onTap(evt)
  
class window.LoginScreenDriver 
  constructor: (screen) -> 
    @screen = screen
  
  clickLogin: ->
    new DomButtonClicker(@getLoginButton()).click()
    
  getLoginButton: ->
    @screen.query('#action')[0]
  
  setCredentials: (username, password) ->
    @screen.setValues({username, password})
