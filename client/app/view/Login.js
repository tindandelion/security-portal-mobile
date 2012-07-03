(function() {
  var FIELD_WIDTH;

  FIELD_WIDTH = '15em';

  Ext.define('Portal.view.Login', {
    extend: 'Ext.form.Panel',
    config: {
      layout: {
        type: 'vbox',
        pack: 'center',
        align: 'center'
      },
      items: [
        {
          xtype: 'fieldset',
          width: FIELD_WIDTH,
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
          width: FIELD_WIDTH,
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
      return this.fireEvent('loginrequest', credentials.username, credentials.password);
    }
  });

}).call(this);
