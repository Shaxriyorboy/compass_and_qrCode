import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);
  static const String id = "qr_code_page";

  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImage(
          data: "http://onelink.to/9fweyq",
          version: QrVersions.auto,
          size: 250,
        ),
      ),
    );
  }
}
