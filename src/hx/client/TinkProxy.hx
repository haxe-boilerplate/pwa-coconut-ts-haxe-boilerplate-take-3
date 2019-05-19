package client;

import tink.core.Callback.CallbackLink;
import tink.http.clients.*;
import tink.web.proxy.Remote;
import tink.url.Host;

using tink.core.Future.JsPromiseTools;

import ApiResult.Result;

@:expose
class Client {
   static var HOST = new Host('localhost');
    public static function call() {
        var remote = new Remote<Root>(new NodeClient(), new RemoteEndpoint(new Host('localhost', 3000)));
        var ret = remote.json().flatMap((o) -> {
            switch(o) {
                case Success(e): return e;
                case Failure(e): throw e;
            }
        });
        $type(ret); //tink.Future<Result>;
        return ret;
    }
}

interface Root {
    @:get('/tink_api/')
    function json():Result;
}


