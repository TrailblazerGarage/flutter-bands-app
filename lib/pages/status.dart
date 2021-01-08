import 'package:flutter/material.dart';
import 'package:flutter_band_name/services/socket_service.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    // socketService.socket.emit(event)

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Server status: ${ socketService.serverStatus }')
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.message),
        onPressed: (){
          // Task
          // Emit: emit-message
          // { name: 'Flutter', message: 'Hi from Flutter'}
        },
      ),
    );
  }
}