import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizza_slice_app/models/pizza_model.dart';
import 'package:pizza_slice_app/screens/success_screen.dart';
import 'package:pizza_slice_app/widgets/action_button.dart';
import 'package:pizza_slice_app/widgets/order_summary.dart';

class DeliveryScreen extends StatefulWidget {
  final Pizza pizza;
  const DeliveryScreen({super.key, required this.pizza});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  int _groupValue = -1;

  GoogleMapController? mapController;
  LatLng? _center;
  LatLng? _target;
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _target = LatLng(25.4052057, 68.3431474);
    // _initializeMap();
    _center = LatLng(25.4052057, 68.3431474);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
// Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }
// Request permission to get the user's location
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return;
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }
// Get the current location of the user
    _currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      _center = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order Summary",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  height: 1,
                  color: Color(0xffBFBDBD),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: OrderSummaryWidget(
                  orderPrice: widget.pizza.price.toString(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  height: 1,
                  color: Color(0xffBFBDBD),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "${widget.pizza.price! + 9.99 + 100}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 247, 212, 212),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estimated Delivery Time: ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "15 - 30 mins",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Payment Methods",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Divider(
                height: 1,
                color: Color(0xffBFBDBD),
              ),
              RadioListTile(
                value: 0,
                groupValue: _groupValue,
                onChanged: (newValue) =>
                    setState(() => _groupValue = newValue!),
                title: Text(
                  "Cash on Delivery",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ),
              Text(
                "Confirm Delivery Address",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Divider(
                height: 1,
                color: Color(0xffBFBDBD),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all()),
                  height: 270,
                  child: _center != null && _target != null
                      ? GoogleMap(
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _center!,
                            zoom: 18.0,
                          ),
                          markers: {
                            Marker(
                              markerId: const MarkerId('pizza_slice_location'),
                              position: _target!,
                              infoWindow: const InfoWindow(
                                  title: 'Pizza Slice Location'),
                            ),
                          },
                          circles: {
                            Circle(
                              circleId: CircleId('You'),
                              center: _center!,
                              radius: 500,
                            ),
                          },
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessScreen()));
                  },
                  child: ActionButton(text: "Place Order", isPlain: false))
            ],
          ),
        ),
      ),
    );
  }
}
