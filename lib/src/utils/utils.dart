import 'dart:convert';
import 'dart:typed_data';

import 'package:devla/src/models/file_response.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

Future<FileResponse> convertWidget(
    ScreenshotController _controller, dynamic _imgName) async {
  Uint8List image = await _controller.capture();
  if (image != null) {
    await [Permission.storage].request();
    String filaName = _imgName != null
        ? _imgName
        : DateTime.now().millisecondsSinceEpoch.toString();
    final _res = await ImageGallerySaver.saveImage(image, name: filaName);
    final _json = json.encode(_res);
    FileResponse result = fileResponseFromJson(_json);
    return result;
  } else {
    return null;
  }
}
