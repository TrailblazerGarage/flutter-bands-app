import 'package:flutter/material.dart';
import 'package:flutter_band_name/services/socket_service.dart';
import 'package:provider/provider.dart';

import 'package:flutter_band_name/pages/home.dart';
import 'package:flutter_band_name/pages/status.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => SocketService())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'home',
          routes: {
            'home': ( _ ) => HomePage(),
            'status': ( _ ) => StatusPage()
          }
      ),
    );
  }
}
