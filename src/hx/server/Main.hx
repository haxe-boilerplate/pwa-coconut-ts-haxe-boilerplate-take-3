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

    //app.use(staticsRouter());
    app.use(Routes.apiRouter());

    app.use(Routes.staticRouter());
    app.use(Routes.pagesRouter());

    /*app.use('/tink_api', (a: Request, b: js.node.http.ServerResponse) -> {
      TinkAPI.main(a, b);
    });*/

    trace('fooooo');
    app.listen(Config.SERVER_PORT, () -> { trace('LISTENING ON PORT ${Config.SERVER_PORT}'); });
  }
}
