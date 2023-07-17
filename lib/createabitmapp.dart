
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';


class createabitmapp extends StatefulWidget {
  const createabitmapp({super.key});

  @override
  State<createabitmapp> createState() => _createabitmappState();
}

class _createabitmappState extends State<createabitmapp> {
  double scaleFactor = 5.0; // Initial scale factor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Zoom and Bitmap Example'),
        ),
        body: Center(
          child: GestureDetector(
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                scaleFactor = details.scale;
              });
            },
            child: Transform.scale(
              scale: scaleFactor,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _captureImage();
          },
          child: Icon(Icons.camera_alt),
        ),
      ),
    );
  }

  Future<void> _captureImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final width = 200 * scaleFactor;
    final height = 200 * scaleFactor;
    canvas.scale(scaleFactor);
    final paint = Paint()..color = Colors.blue;
    canvas.drawRect(Rect.fromLTWH(0, 0, 200, 200), paint);

    final picture = recorder.endRecording();
    final image = await picture.toImage(width.toInt(), height.toInt());

    // Convert the image to Uint8List format
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      final Uint8List imageData = byteData.buffer.asUint8List();
      // Process or save the imageData as desired

    }
  }
}
