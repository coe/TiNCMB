# Titanium用ニフティクラウド mobile backendモジュール

激しく開発中。

http://mb.cloud.nifty.com/

## Usage

```
var NCMBiOS = require('com.nifty.cloud.mb.ios');
Ti.API.info("module is => " + NCMBiOS);
NCMBiOS.NCMBKey(your_application_key, your_client_key);

if (NCMBiOS.postKey('TestClass', {message: 'Hello World!'})){
    Ti.API.info("Saved!");
}else{
    Ti.API.info("Failed ...");
}
```

## License

MIT License