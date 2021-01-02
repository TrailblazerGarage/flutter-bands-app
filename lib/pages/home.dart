import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_band_name/models/band.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 2),
    Band(id: '2', name: 'Queen', votes: 3),
    Band(id: '3', name: 'Héroes del Silencio', votes: 1),
    Band(id: '4', name: 'Bon Jovi', votes: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames', style: TextStyle(color: Colors.black87) ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) => _bandTile(bands[index])
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        elevation: 1,
        onPressed: addNewBand
      ),
    );
  }

  ListTile _bandTile(Band band) {
    return ListTile(
          leading: CircleAvatar(
            child: Text( band.name.substring(0,2)),
            backgroundColor: Colors.blue[100],
          ),
          title: Text( band.name ),
          trailing: Text('${ band.votes }', style: TextStyle( fontSize: 20)),
          onTap: () {
            print(band.name);
          }
        );
  }

  addNewBand() {
    final TextEditingController textController = new TextEditingController();

    if ( Platform.isAndroid ) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("New band name"),
              content: TextField(
                controller: textController,
              ),
              actions: <Widget>[
                MaterialButton(
                    child: Text('Add'),
                    elevation: 5,
                    textColor: Colors.blue,
                    onPressed: () => addBandToList(textController.text)
                )
              ],
            );
          }
      );
    }

    // iOS
    showCupertinoDialog(
        context: context,
        builder: ( _ ) {
          return CupertinoAlertDialog(
            title: Text('New band name:'),
            content: CupertinoTextField(
              controller: textController,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Add'),
                onPressed: () => addBandToList( textController.text)
              ),
              CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text('Dismiss'),
                  onPressed: () => Navigator.pop(context)
              )
            ]
          );
        }
    );
  }

  void addBandToList( String name ) {
    if (name.length > 1) {
      this.bands.add( new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }
}