import 'package:BlocSample/cubit/models/mode.dart';

enum TextProperty {
  none,
  editText,
}

class TextMode extends Mode {
  TextMode({this.selectedProperty = TextProperty.none});

  final TextProperty selectedProperty;

  TextMode copyWith(TextProperty selectedProperty) {
    return TextMode(selectedProperty: selectedProperty);
  }
}
