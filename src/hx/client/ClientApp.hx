package client;

import js.Browser.*;
import coconut.Ui.hxx;
import client.ui.ThingsView;

class ClientApp {
  static function main() {
    
    var things = [new client.data.Thing()];

    coconut.ui.Renderer.mount(
      cast document.body.appendChild(document.createDivElement()),
      hxx('<ThingsView things=${things}/>'));
  }
}
