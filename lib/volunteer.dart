
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Volunteer extends StatefulWidget {
  const Volunteer({Key? key}) : super(key: key);

  @override
  State<Volunteer> createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
  late MapType _currentMapType = MapType.normal;
  late GoogleMapController mapController;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor selectedMarkerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
  final LatLng _center = const LatLng(20.979643, 56.438857);
  List<LocModel> mosques = [
    LocModel(
      lat: 23.829989923438273,
      lon: 57.4299319088459,
      name: "Volunteer",
      id: "1",
    ),
    LocModel(
      lat: 23.839989923438273,
      lon: 57.4399319088459,
      name: "Volunteer",
      id: "2",
    ),
    LocModel(
      lat: 23.849989923438273,
      lon: 57.4199319088459,
      name: "Volunteer",
      id: "3",
    ),
    LocModel(
      lat: 23.829989923438273,
      lon: 57.4239319088459,
      name: "Volunteer",
      id: "4",
    ),
    LocModel(
      lat: 23.829989923438273,
      lon: 57.4219319088459,
      name: "Volunteer",
      id: "5",
    ),
    LocModel(
      lat: 23.826989923438273,
      lon: 57.42919319088459,
      name: "Volunteer",
      id: "6",
    ),
    LocModel(
      lat: 23.819989923438273,
      lon: 57.4199319088459,
      name: "Volunteer",
      id: "7",
    ),
    LocModel(
      lat: 23.812989923438273,
      lon: 57.4199319088459,
      name: "House",
      id: "7",
    ),
    LocModel(
      lat: 23.817989923438273,
      lon: 57.4199319088459,
      name: "House",
      id: "7",
    ),

  ];
bool isPressed = false;
  final MaterialStateProperty<Icon?> thumbIcon2 =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
  List<List> selected_mosques = [];
  late LatLng currentPostion=const LatLng(23.334543, 57.530217) ;
  void _getUserLocation() async {
    await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      setState(() {
        currentPostion = const LatLng(23.334543, 57.530217);
      });
    }
    setState(() {
      currentPostion = LatLng(position.latitude, position.longitude);
    });
  }


  void _onMapCreated(GoogleMapController controller) {
    // print("_onMapCreated");
    mapController = controller;

    //on
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserLocation();
  }
  void changeMapType() {
    setState(() {
      _currentMapType = (_currentMapType == MapType.normal)
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
          Center(
            child:Stack(
              children: [
                GoogleMap(
                  mapType: _currentMapType,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  zoomControlsEnabled: true,
                  onTap: (argument) {

                  },
                  onMapCreated: _onMapCreated,
                  onCameraIdle: () async {
                    LatLngBounds visibla = await mapController.getVisibleRegion();
                    double lat =
                        (visibla.northeast.latitude + visibla.southwest.latitude) / 2;
                    double lon = (visibla.northeast.longitude +
                        visibla.southwest.longitude) /
                        2;

                    print("---------------");
                    print("lat = $lat");
                    print("lon = $lon");

                  },
                  markers: mosques.map((mosque) {
                    return Marker(
                      markerId: MarkerId(mosque.id.toString()),
                      position: LatLng(mosque.lat ?? 0.0, mosque.lon ?? 0.0),
                      infoWindow: InfoWindow(title: mosque.name),
                      //if mosque is in selected_mosques show default marker
                      icon:mosque.name == "Volunteer" ? markerIcon : selectedMarkerIcon,
                      //call _marker_taped(mosque) when marker taped
                      // onTap: () => _marker_taped(mosque),
                    );
                  }).toSet(),
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 6.3,
                  ),
                ),
                Positioned(
                  top: 120, // Adjust this value as needed
                  left: 0, // Adjust this value as needed
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: FloatingActionButton(
                      //size of floating button
                      mini: true,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      foregroundColor: Colors.black,
                      onPressed: changeMapType,
                      child: const SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: Icon(Icons.map),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0, // Adjust this value as needed
                  left: 0, // Adjust this value as needed
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                   padding: const EdgeInsets.all(2),
                   child: Row(
                      children: [
                        const Text("Online",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'round'),),
                        Switch(
                          thumbIcon: thumbIcon2,
                          activeColor: Colors.white,
                          activeTrackColor:  const Color(0xff50A000),
                          inactiveThumbColor: const Color(0xff50A000),
                          inactiveTrackColor: const Color(0xffBDF388),
                          value: isPressed,
                          onChanged: (bool value) {
                            setState(() {
                              isPressed = value;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          );
  }
}
class LocModel {
  final String id;
  final String name;
  final double lat;
  final double lon;

  LocModel({required this.lat,required this.lon,required this.name,required this.id});
}