Ext.define 'Portal.ui.HomeScreen',
  extend: 'Ext.Container'
  requires: ['Portal.ui.SummaryView']
  config:
    orientation: 'portrait'
    fullscreen: true
    layout: 'vbox'
    items: [
      {
        xtype: 'titlebar'
        title: 'Summary'
      }]
    
  applyOrientation: (newOrientation) -> 
    @currentPanel.destroy() if @currentPanel
    @currentPanel = Portal.ui.SummaryView.forOrientation(newOrientation)
    @currentPanel.setContext(@context) if @context
    @add(@currentPanel)
      
  setContext: (context) ->
    @context = context
    @currentPanel.setContext(@context)
