package server;

import js.Node.process;

using Std;

class Config {
  public static var IS_PRODUCTION = process.env.get('NODE_ENV') == 'production';
  public static var SERVER_PORT = (process.env.get('PORT') != null ? process.env.get('PORT') : '3000').parseInt();
  public static var WEBPACK_PORT = 8080;
}
