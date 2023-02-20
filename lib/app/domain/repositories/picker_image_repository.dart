import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class PickerImageRepository {
  Future<File> pickerImage(ImageSource source);
}
