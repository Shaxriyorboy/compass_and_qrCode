import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

class CompassPage extends StatefulWidget {
  const CompassPage({Key? key}) : super(key: key);
  static const String id = "compass_page";

  @override
  _CompassPageState createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  double direction = 0;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        direction = event.heading!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Flutter Compass'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildCompass()),
          ],

        ),
      ),
    );
  }

  Widget _buildCompass() {
    return Material(
      shape: CircleBorder(),
      clipBehavior: Clip.antiAlias,
      elevation: 4.0,
      child: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Transform.rotate(
          angle: (direction * (math.pi / 180) * -1),
          child: Image.asset('assets/images/compass1.jpg'),
        ),
      ),
    );
  }
}


// with permission
// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
// import 'package:flutter_compass/flutter_compass.dart';
// import 'package:permission_handler/permission_handler.dart';
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   static const String id = "home_page";
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   bool _hasPermissions = false;
//   CompassEvent? _lastRead;
//   DateTime? _lastReadAt;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchPermissionStatus();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: const Text('Flutter Compass'),
//         ),
//         body: Builder(builder: (context) {
//           if (_hasPermissions) {
//             return Column(
//               children: <Widget>[
//                 _buildManualReader(),
//                 Expanded(child: _buildCompass()),
//               ],
//             );
//           } else {
//             return _buildPermissionSheet();
//           }
//         }),
//       ),
//     );
//   }
//
//   Widget _buildManualReader() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: <Widget>[
//           ElevatedButton(
//             child: Text('Read Value'),
//             onPressed: () async {
//               final CompassEvent tmp = await FlutterCompass.events!.first;
//               setState(() {
//                 _lastRead = tmp;
//                 _lastReadAt = DateTime.now();
//               });
//             },
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     '$_lastRead',
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                   Text(
//                     '$_lastReadAt',
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCompass() {
//     return StreamBuilder<CompassEvent>(
//       stream: FlutterCompass.events,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error reading heading: ${snapshot.error}');
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//
//         double? direction = snapshot.data!.heading;
//
//         // if direction is null, then device does not support this sensor
//         // show error message
//         if (direction == null) {
//           return const Center(
//             child: Text("Device does not have sensors !"),
//           );
//         }
//
//         return Material(
//           shape: CircleBorder(),
//           clipBehavior: Clip.antiAlias,
//           elevation: 4.0,
//           child: Container(
//             padding: EdgeInsets.all(16.0),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//             ),
//             child: Transform.rotate(
//               angle: (direction * (math.pi / 180) * -1),
//               child: Image.asset('assets/images/compass1.jpg'),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildPermissionSheet() {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text('Location Permission Required'),
//           ElevatedButton(
//             child: Text('Request Permissions'),
//             onPressed: () {
//               Permission.locationWhenInUse.request().then((ignored) {
//                 _fetchPermissionStatus();
//               });
//             },
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             child: Text('Open App Settings'),
//             onPressed: () {
//               openAppSettings().then((opened) {
//                 //
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }
//
//   void _fetchPermissionStatus() {
//     Permission.locationWhenInUse.status.then((status) {
//       if (mounted) {
//         setState(() => _hasPermissions = status == PermissionStatus.granted);
//       }
//     });
//   }
// }
