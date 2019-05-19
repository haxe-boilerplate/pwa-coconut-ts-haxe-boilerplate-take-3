package server;

import SomeTsClass;

@:expose
class SuperServerComponent {
  var thisIsNice: Int;

  public function new() {};

  public function saySomething(phrase: String) {
    trace(phrase);
    new SomeTsClass('from server');
  }
}
