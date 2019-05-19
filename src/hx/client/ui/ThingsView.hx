package client.ui;

import js.html.*;
import todomvc.data.*;
import coconut.ui.*;

class ThingsView extends View {
  @:attribute var things:Array<Thing>;

  function render()
    <div>
    <h1>Things</h1>
    <if {things.length > 0}>
      <ol>
        <for thing in things>
          <h2>${thing}</h2>
        </for>
      </ol>
    </if>
  </div>

}
