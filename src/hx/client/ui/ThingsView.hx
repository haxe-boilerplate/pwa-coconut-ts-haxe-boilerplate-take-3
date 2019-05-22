package client.ui;

import mui.core.Grid;
import js.html.*;
import client.data.Thing;
import coconut.ui.View;
import mui.core.Button;



class ThingsView extends View {
  @:attribute var thing: Thing;

  function render() {
  return
    <div>
    <Grid
      container
      direction={Row}
      justify={Center}
      alignItems={Center}
    >
    <Button variant={Outlined}>Foo</Button>
    <h1>{thing.foo}</h1>
    </Grid>
    </div>;
  }
}
