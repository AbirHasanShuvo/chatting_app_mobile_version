import 'dart:io';

import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';

final imageProvider = StateNotifierProvider<ImageController, File?>((ref){
  return ImageController();
});

class ImageController extends StateNotifier<File?> {
  ImageController() : super(null);

  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      state = File(image.path);
    }
  }

  void clearImage(){
    state = null;
  }
}
