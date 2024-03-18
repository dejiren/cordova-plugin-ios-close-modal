var exec = require("cordova/exec");

exports.close = function (success, error) {
  exec(success || null, error || null, "CloseModal", "close", []);
};
