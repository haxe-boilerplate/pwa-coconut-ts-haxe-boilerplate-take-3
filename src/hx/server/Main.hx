package server;

import js.npm.express.Request;
import js.npm.express.Middleware.MiddlewareHttp;
import js.node.http.IncomingMessage;
import js.npm.express.Static;
import js.npm.Express;

class Main {
  static var app = new Express();


  public static function main() {
    //app.set('view engine', 'ejs');

    app.use('/assets', new Static(untyped path.join(__dirname, '..', '..', '..', 'assets')));

    //app.use(staticsRouter());
    app.use(Routes.apiRouter());

    app.get('/foo', function(req, res):Void {
      $type(req);
      $type(res);
    });

    app.listen(Config.SERVER_PORT);
  }
}
