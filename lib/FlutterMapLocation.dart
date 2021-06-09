import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'FlutterMapLocation.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Location location = Location();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  location.requestService().then((value) {
                    print(value);
                  });
                },
                child: Text("Request Service"),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (await location.hasPermission() !=
                      PermissionStatus.granted) {
                  } else {
                    print("zaten açık");
                  }
                },
                child: Text("Request Permission"),
              ),
              ElevatedButton(
                onPressed: () {
                  location.getLocation().then((value){
                    print(value.longitude);
                    print(value.latitude);
                  });
                },
                child: Text("Current Location"),
              ),
              ElevatedButton(
                onPressed: () {
                  location.onLocationChanged.listen((event) {
                    print(event.latitude);
                    print(event.longitude);
                  });
                },
                child: Text("onLocationChanged"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
