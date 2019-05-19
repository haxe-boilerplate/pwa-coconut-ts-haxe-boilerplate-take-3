package client.data;

import coconut.data.*;
//import tink.pure.List;
using tink.CoreApi;

class Thing extends Model {

  @:observable var someObsevableField: String = 'Original value';
  @:loaded var someFieldLoadedFromTheServer: String;

  @:transition function changeObservableField() {
    return {someObservableField: "Oh wow, I've got a new value!"};
  }

  private static function loadFromServer() {

  }
}
