// Class: server.TinkAPI

var $global = typeof window != "undefined" ? window : typeof global != "undefined" ? global : typeof self != "undefined" ? self : this

$global.Object.defineProperty(exports, "__esModule", {value: true});

var __map_reserved = {};

// Imports

var $hxClasses = require("./../hxClasses_stub").default;
var $hxEnums = require("./../hxEnums_stub").default;
var $import = require("./../import_stub").default;
function tink_web_routing_Router0() {return require("./../tink/web/routing/Router0");}
function server_Root() {return require("./../server/Root");}
function tink_http_containers_NodeContainer() {return require("./../tink/http/containers/NodeContainer");}
function tink_http_SimpleHandler() {return require("./../tink/http/SimpleHandler");}
function tink_web_routing_Context() {return require("./../tink/web/routing/Context");}
function tink_core__$Promise_Recover_$Impl_$() {return require("./../tink/core/_Promise/Recover_Impl_");}
function tink_http__$Response_OutgoingResponse_$Impl_$() {return require("./../tink/http/_Response/OutgoingResponse_Impl_");}
function tink_core__$Future_SyncFuture() {return require("./../tink/core/_Future/SyncFuture");}
function tink_core__$Lazy_LazyConst() {return require("./../tink/core/_Lazy/LazyConst");}

// Constructor

var TinkAPI = function(){}

// Meta

TinkAPI.__name__ = "server.TinkAPI";
TinkAPI.prototype = {
	
};
TinkAPI.prototype.__class__ = TinkAPI.prototype.constructor = $hxClasses["server.TinkAPI"] = TinkAPI;

// Init



// Statics


TinkAPI.main = (function($this) {
	var $r;
	var router = new (tink_web_routing_Router0().default)(new (server_Root().default)());
	$r = (tink_http_containers_NodeContainer().default).toNodeHandler(new (tink_http_SimpleHandler().default)(function(req) {
		var this1 = (tink_web_routing_Context().default).ofRequest(req);
		var this2 = router.route(this1);
		var f = (tink_core__$Promise_Recover_$Impl_$().default).ofSync((tink_http__$Response_OutgoingResponse_$Impl_$().default).reportError);
		var ret = this2.flatMap(function(o) {
			switch(o._hx_index) {
			case 0:
				var d = o.data;
				return new (tink_core__$Future_SyncFuture().default)(new (tink_core__$Lazy_LazyConst().default)(d));
			case 1:
				var e = o.failure;
				return f(e);
			}
		});
		return ret.gather();
	}));
	return $r;
}(this))

// Export

exports.default = TinkAPI;