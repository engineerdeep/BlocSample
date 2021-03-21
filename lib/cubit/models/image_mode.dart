import 'package:BlocSample/cubit/models/mode.dart';

enum ImageProperty {
  none,
  addImage,
  editImage,
}

class ImageMode extends Mode {
  ImageMode({this.selectedProperty = ImageProperty.none});

  final ImageProperty selectedProperty;

  ImageMode copyWith(ImageProperty selectedProperty) {
    return ImageMode(selectedProperty: selectedProperty);
  }
}
