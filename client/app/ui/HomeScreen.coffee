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
    @currentPanel = @add(Portal.ui.SummaryView.forOrientation(newOrientation))
      
  setContext: (context) ->
    @currentPanel.setContext(context)
