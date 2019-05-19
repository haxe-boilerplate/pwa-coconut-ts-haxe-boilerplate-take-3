package client;

import js.Browser.*;
import coconut.Ui.hxx;
import todomvc.ui.TodoListView;

class ClientApp {
  static function main() {
    
    var things = [new data.Thing()];

    coconut.ui.Renderer.mount(
      cast document.body.appendChild(document.createDivElement()),
      hxx('<ThingsView things=${things}/>')
    );
  }
}
