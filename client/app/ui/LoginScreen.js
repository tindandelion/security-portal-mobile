(function() {

  Ext.define('Portal.ui.LoginScreen', {
    extend: 'Ext.form.Panel',
    config: {
      fullscreen: true,
      layout: {
        type: 'vbox',
        pack: 'center'
      },
      items: [
        {
          xtype: 'fieldset',
          items: [
            {
              xtype: 'textfield',
              autoCapitalize: false,
              name: 'username',
              placeHolder: 'User name'
            }, {
              xtype: 'passwordfield',
              name: 'password',
              placeHolder: 'Password'
            }
          ]
        }, {
          xtype: 'button',
          id: 'action',
          text: 'Log In',
          ui: 'confirm',
          listeners: {
            tap: function() {
              return this.parent.fireLoginRequest();
            }
          }
        }
      ]
    },
    fireLoginRequest: function() {
      var credentials;
      credentials = this.getValues();
      return this.fireEvent('loginRequest', credentials.username, credentials.password);
    }
  });

}).call(this);
