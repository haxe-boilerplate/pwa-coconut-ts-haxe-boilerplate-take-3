package;

@:jsRequire('../some-ts-class', 'default') // root is ts/
@:expose
extern class SomeTsClass {
  public function new(someArg: String);
}
