// Class: server.SuperComponent

var $global = typeof window != "undefined" ? window : typeof global != "undefined" ? global : typeof self != "undefined" ? self : this

$global.Object.defineProperty(exports, "__esModule", {value: true});

var __map_reserved = {};

// Imports

var $hxClasses = require("./../hxClasses_stub").default;

// Constructor

var SuperComponent = function(){}

// Meta

SuperComponent.__name__ = ["server","SuperComponent"];
SuperComponent.prototype = {
	saySomething: function(phrase) {
		console.log("src/hx/server/SuperComponent.hx:7:",phrase);
	}
};
SuperComponent.prototype.__class__ = SuperComponent.prototype.constructor = $hxClasses["server.SuperComponent"] = SuperComponent;

// Init



// Statics




// Export

exports.default = SuperComponent;