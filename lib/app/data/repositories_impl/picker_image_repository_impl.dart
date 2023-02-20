import 'dart:io';

import 'package:finance_app/app/domain/repositories/picker_image_repository.dart';
import 'package:image_picker/image_picker.dart';

class PickerImageRepositoryImpl extends PickerImageRepository {
  @override
  Future<File> pickerImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: source);
    File img = File(image!.path);
    return img;
  }
}
