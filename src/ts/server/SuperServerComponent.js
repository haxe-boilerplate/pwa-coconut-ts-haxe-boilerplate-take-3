// Class: server.SuperServerComponent

var $global = typeof window != "undefined" ? window : typeof global != "undefined" ? global : typeof self != "undefined" ? self : this

$global.Object.defineProperty(exports, "__esModule", {value: true});

var __map_reserved = {};

// Imports

var $hxClasses = require("./../hxClasses_stub").default;
var $hxEnums = require("./../hxEnums_stub").default;
var $import = require("./../import_stub").default;
function SomeTsClass() {return $import(require("./.././some-ts-class"));}

// Constructor

var SuperServerComponent = function(){}

// Meta

SuperServerComponent.__name__ = "server.SuperServerComponent";
SuperServerComponent.prototype = {
	saySomething: function(phrase) {
		console.log("src/hx/server/SuperServerComponent.hx:9:",phrase);
		new (SomeTsClass().default)("from server");
	}
};
SuperServerComponent.prototype.__class__ = SuperServerComponent.prototype.constructor = $hxClasses["server.SuperServerComponent"] = SuperServerComponent;

// Init



// Statics




// Export

exports.default = SuperServerComponent;