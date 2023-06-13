import 'package:meta/meta.dart';


@immutable
abstract class ThemeEvent {
  // Passing class fields in a list to the Equatable super class
  const ThemeEvent([List props = const []]) : super();
}

class ThemeChanged extends ThemeEvent {

  ThemeChanged() : super([]);

}
