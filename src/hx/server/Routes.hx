package server;

import js.npm.express.Request;
import js.npm.express.Router;

class Routes {
  public static function apiRouter() {
    var bodyParser = js.Lib.require('body-parser');
    var db: Dynamic = js.Lib.require('db');
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

  public static function pagesRoute() {
    //TODO Macro-wrapped require that checks that the js / ts exists?
    return js.Lib.require('routes/pages-router');
  }



//import { users, getUserById } from '../db';

/*  router.use(bodyParser.json());

  router.get('/api/users', (req, res) => {
    res.json(users);
  });

  router.get('/api/user/:userId', (req, res) => {
    const userId = req.params.userId;
    res.json(getUserById(userId));
  });

  router.post('/api/set-user', (req, res) => {
    res.send(`ok`);
  });

  return router;
}

  }*/
}
