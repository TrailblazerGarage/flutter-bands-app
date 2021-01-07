import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier{
  ServerStatus _serverStatus = ServerStatus.Connecting;

  SocketService(){
    this._initConfig();
  }

  void _initConfig() {
    //IO.Socket socket = IO.io('http://192.168.1.104:3000');
    IO.Socket socket = IO.io("http://0.0.0.0:3000", {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.onConnect((_) {
      print('connect');
      socket.emit('message', 'test from Android app');
    });

    socket.onConnectError((_){
      print('Connect Error');
    });

    socket.onConnecting((_){
      print('Connecting...');
    });

    socket.onDisconnect((_) => print('disconnect'));

    /*
      //IO.Socket socket = IO.io('http://192.168.1.104:3000',
      this._socket = IO.io('http://192.168.1.104:3000', {
        'transports': ['websocket'],
        'autoConnect': true
      });

      this._socket.onConnect((_){
        print('connect');
      });

      this._socket.onDisconnect((_) {
        print('disconnected');
      });
     */
  }
}