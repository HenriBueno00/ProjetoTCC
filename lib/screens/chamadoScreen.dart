import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart'; // Importando o pacote geocoding

class ChamadoScreen extends StatefulWidget {
  const ChamadoScreen({super.key});

  @override
  State<ChamadoScreen> createState() => _ChamadoScreenState();
}

class _ChamadoScreenState extends State<ChamadoScreen> {
  late GoogleMapController _mapController;
  LatLng _currentLocation = LatLng(0.0, 0.0);
  String _currentAddress = "Endereço não encontrado";
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    var locationStatus = await Permission.location.request();
    if (locationStatus.isGranted) {
      _getCurrentLocation();
    } else {
      _showPermissionDialog("Permissão de Localização", "O aplicativo precisa de permissão para acessar a sua localização.");
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });

      _getAddressFromLatLng(_currentLocation);

      _mapController.animateCamera(
        CameraUpdate.newLatLng(_currentLocation),
      );
    } catch (e) {
      print("Erro ao obter localização: $e");
    }
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = "${place.street}, ${place.subLocality}, ${place.locality}";
      });
    } catch (e) {
      print("Erro ao obter endereço: $e");
    }
  }

  void _showPermissionDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Configurações"),
              onPressed: () async {
                await openAppSettings();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Chamado"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Nome de Usuário",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Número de Telefone",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Endereço Atual:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              _currentAddress,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Lógica para iniciar a gravação de áudio
              },
              icon: Icon(Icons.mic),
              label: Text("Gravar Áudio"),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: _currentLocation,
                  zoom: 15.0,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
