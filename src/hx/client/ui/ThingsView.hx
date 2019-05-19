package client.ui;

import js.html.*;
import client.data.Thing;
import coconut.ui.View;
import mui.core.Button;
import mui.core.button.ButtonVariant.*;



class ThingsView extends View {
  @:attribute var thing: Thing;

  function render() {
  return
    <div>
    <Button variant={Outlined}>Foo</Button>
    <h1>{thing.foo}</h1>
    </div>;
  }
}
