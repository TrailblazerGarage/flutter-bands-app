import 'package:flutter/material.dart';
import 'package:flutter_band_name/services/socket_service.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Text("Connect to server via socket")
      ),
    );
  }
}