import 'package:flutter/material.dart';

class DispositivosScreen extends StatelessWidget {
  const DispositivosScreen({super.key});

  void _showScannerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2, // Ocupa metade da tela
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Escanear Dispositivos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              // Aqui você pode adicionar o widget para escanear dispositivos Bluetooth
              Expanded(
                child: Center(
                  child: Text('Aqui vai o Scanner Bluetooth'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSavedDevicesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2, // Ocupa metade da tela
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dispositivos Salvos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              // Lista de dispositivos salvos
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Dispositivo 1'),
                      onTap: () {
                        // Lógica ao clicar no dispositivo
                      },
                    ),
                    ListTile(
                      title: Text('Dispositivo 2'),
                      onTap: () {
                        // Lógica ao clicar no dispositivo
                      },
                    ),
                    // Adicione mais ListTiles conforme necessário
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispositivos'),
        backgroundColor: const Color(0xFF53a08e), // Cor da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => _showScannerBottomSheet(context),
              child: const Text('Escanear Dispositivos'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: const Color(0xFF53a08e), // Cor do botão
                shadowColor: Colors.black.withOpacity(0.1),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Divider(),
            const SizedBox(height: 16.0),
            Text(
              'Dispositivos Salvos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Dispositivo 1'),
                    onTap: () => _showSavedDevicesBottomSheet(context),
                  ),
                  ListTile(
                    title: Text('Dispositivo 2'),
                    onTap: () => _showSavedDevicesBottomSheet(context),
                  ),
                  // Adicione mais ListTiles conforme necessário
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
