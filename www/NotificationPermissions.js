var exec = require('cordova/exec');

exports.checkStatus = function(success, error) {
  exec(success, error, 'NotificationPermissions', 'checkStatus');
};
