package client.ui;

import js.html.*;
import client.data.Thing;
import coconut.ui.View;

class ThingsView extends View {
  @:attribute var things:Array<Thing>;

  function render() {
  return
    <div>
    <h1>Things</h1>
    <if {things.length > 0}>
      <ol>
        <for {thing in things}>
          <h2>pleaceholder</h2>
        </for>
      </ol>
    </if>
  </div>;
  }
}
