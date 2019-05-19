package client;

import js.Browser.*;
import coconut.Ui.hxx;
import client.ui.ThingsView;

class ClientApp {
  static function main() {
    
    var thing = new client.data.Thing();

    coconut.ui.Renderer.mount(
//      cast document.body.appendChild(document.createDivElement()),
      document.getElementById('app'),
      hxx('<ThingsView thing=${thing}/>'));
  }
}
