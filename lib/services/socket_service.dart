import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier{
  ServerStatus _serverStatus = ServerStatus.Connecting;

  get serverStatus => this._serverStatus;
  IO.Socket _socket;

  SocketService(){
    this._initConfig();
  }

  void _initConfig() {
    //192.168.1.104
     this._socket = IO.io("http://192.168.1.104:3000/", <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true
      });

    this._socket.on('connect', (_) {
      print('connect');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect',(_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
  }
}