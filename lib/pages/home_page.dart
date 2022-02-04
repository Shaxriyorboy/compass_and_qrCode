import 'package:flutter/material.dart';
import 'package:kompos/pages/compass_page.dart';
import 'package:kompos/pages/qr_code_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: 200,
              onPressed: () {
                Navigator.of(context).pushNamed(QrCodePage.id);
              },
              child: Text("Qr Code"),
              color: Colors.blue,
            ),
            MaterialButton(
              minWidth: 200,
              onPressed: () {
                Navigator.of(context).pushNamed(CompassPage.id);
              },
              child: Text("Compass Code"),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
