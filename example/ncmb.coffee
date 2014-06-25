NCMBiOS = require('com.nifty.cloud.mb.ios')
class NCMB
  constructor: (application_key, client_key) ->
    NCMBiOS.NCMBKey(application_key, client_key)
  Object: (class_name) ->
    new NCMB_Object(class_name)

class NCMB_Object
  constructor: (class_name) ->
    @class_name = class_name
    @data = {}
  set: (key, value) ->
    @data[key] = value
  save: (f) ->
    if NCMBiOS.postKey(@class_name, @data)
      f.success()
    else
      f.error()
exports.App = NCMB