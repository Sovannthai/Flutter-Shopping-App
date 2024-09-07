import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  late GoogleMapController mapController;
  LatLng _currentLocation =
      const LatLng(40.748817, -73.985428); // Example initial location (NYC)
  final TextEditingController searchController = TextEditingController();
  List<dynamic> _placeSuggestions = [];
  Timer? _debounce; // Timer to handle debouncing

  // Google Places API Key (Your Key)
  final String _placesApiKey = 'AIzaSyCDBGk-OPs4D6aQIl9C0hhfYx_VuMg0qqg';

  // Function to handle the search dynamically
  Future<void> _searchPlace(String input) async {
    if (input.isEmpty) {
      setState(() {
        _placeSuggestions = [];
      });
      return;
    }

    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$_placesApiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _placeSuggestions = data['predictions'];
      });
    } else {
      throw Exception('Failed to load suggestions');
    }
  }
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchPlace(query);
    });
  }

  Future<void> _onSuggestionTap(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$_placesApiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final location = data['result']['geometry']['location'];
      final LatLng newLatLng = LatLng(location['lat'], location['lng']);

      setState(() {
        _currentLocation = newLatLng;
        mapController.animateCamera(CameraUpdate.newLatLng(newLatLng));
        _placeSuggestions = [];
        searchController.text = data['result']['formatted_address'];
      });
    } else {
      throw Exception('Failed to load location details');
    }
  }

  void _onChooseLocation() {
    Navigator.pop(context, _currentLocation);
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for a location',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onChanged: _onSearchChanged, // Search dynamically
                ),
                // List of location suggestions
                _placeSuggestions.isNotEmpty
                    ? Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: _placeSuggestions.length,
                          itemBuilder: (context, index) {
                            final suggestion = _placeSuggestions[index];
                            return ListTile(
                              title: Text(suggestion['description']),
                              onTap: () {
                                _onSuggestionTap(suggestion['place_id']);
                              },
                            );
                          },
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _currentLocation,
                zoom: 14.0,
              ),
              onCameraMove: (CameraPosition position) {
                _currentLocation =
                    position.target; // Update location when camera moves
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: _onChooseLocation,
            child: const Text(
              "Choose Location",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
