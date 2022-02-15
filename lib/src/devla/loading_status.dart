import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class LoadingOverlay {
  final BuildContext context;
  final String title;

  LoadingOverlay({this.context, this.title = "ກຳລັງສົ່ງຂໍ້ມູນ..."});

  void hide() {
    Navigator.of(context).pop();
  }

  void show() {
    final size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: size.width * 0.5,
            height: size.width * 0.5,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_FullScreenLoader(), Text("ກຳລັງສົ່ງຂໍ້ມູນ...")],
            ),
          ),
        );
      },
    );
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this.context, this.title);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context, "ກຳລັງສົ່ງຂໍ້ມູນ...");
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Platform.isIOS
            ? CupertinoActivityIndicator()
            : CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)));
  }
}
