package server;

import js.npm.express.Request;
import js.npm.express.Middleware.MiddlewareHttp;
import js.node.http.IncomingMessage;
import js.npm.express.Static;
import js.npm.Express;

class Main {
  static var app = new Express();

  public static function main() {
    var path = js.Lib.require('path');

    app.set('view engine', 'ejs');

    app.use('/assets', new Static(path.join(untyped __dirname, '..', '..', '..', 'assets')));
    app.use(Routes.apiRouter());
    app.use(Routes.staticRouter());
    app.use('/tink_api', (a: Request, b: js.node.http.ServerResponse, next) -> { TinkAPI.main(a, b); });
    app.use(Routes.pagesRouter());

    app.listen(Config.SERVER_PORT, () -> { trace('Express server listening on port ${Config.SERVER_PORT}'); });
  }
}
