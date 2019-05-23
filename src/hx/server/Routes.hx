package server;

import js.npm.express.Static;
import js.npm.express.Response;
import js.npm.express.Request;
import js.npm.express.Router;
import tink.core.Future;

@await class Routes {
  public static function apiRouter() {
    var bodyParser = js.Lib.require('body-parser');
    var db: Dynamic = js.Lib.require('./db');
    var router = new Router();

    router.use(untyped bodyParser.json());

    router.get('/api/users', (req, res) -> {
      res.json(db.users);
    });

    router.get('/api/user/:userId', (req, res) -> {
      var userId = req.params.userId;
      res.json(db.getUserById(userId));
    });

    router.post('/api/set-user', function(req: Request, res) {
      res.send('ok');
    });


    return router;
  }

  public static function pagesRouter() {
    //TODO Macro-wrapped require that checks that the js / ts exists?
    var router = new Router();
    var getManifest = (js.Lib.require('./routes/manifest-manager') : {getManifest: () -> js.Promise<String>}).getManifest;

    router.get('/**', @async (_, res: Response) -> {
      var manifest = @await Future.ofJsPromise(getManifest());
      res.render('page.ejs', {manifest: manifest});
    });

    return router;
  }

  public static function staticRouter() {
    var router = new Router();
    //TODO Convert to externs
    var path = js.Lib.require('path');
    var proxy = js.Lib.require('http-proxy-middleware');

    if (Config.IS_PRODUCTION) {
      var staticsPath = path.join(untyped __dirname, '..', '..', '..', 'statics');
      router.use('/statics', new Static(staticsPath));
    } else {
      trace(Config.WEBPACK_PORT);
      router.use(
        '/statics',
          proxy({
           target: 'http://localhost:${Config.WEBPACK_PORT}/',
          })
      );
    };

    return router;
  }
}
