package server;

import tink.core.Future.JsPromiseTools;
import tink.http.containers.*;
import tink.http.Response;
import tink.web.routing.*;
import tink.http.Request;
import tink.io.Source;
import tink.io.Sink;
import tink.http.Response;

import ApiResult.Result;

// Simple API example, not a proxy

class Root {
    public function new() {}

    @:get('/')
    @:get('/print/$name')
    public function hello(name = 'World'):Result
        return  {
            slideshow: {
                title: 'Look!',
                author: 'Mr. Bean',
                date: '2018-08-08',
                slides: [
                    {
                        title: 'Woohoo',
                        type: 'silly',
                        items: ['item_foo', 'item_bar']
                    }
                ]
            }

        }
}

@:expose
class TinkAPI {
    public static var main = {
        var router = new Router<Root>(new Root());
        NodeContainer.toNodeHandler(req -> router.route(Context.ofRequest(req)).recover(OutgoingResponse.reportError));
    }
}
