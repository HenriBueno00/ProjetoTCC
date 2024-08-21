import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ConfiguracoesScreen extends StatefulWidget {
  const ConfiguracoesScreen({super.key});

  @override
  State<ConfiguracoesScreen> createState() => _ConfiguracoesScreenState();
}

class _ConfiguracoesScreenState extends State<ConfiguracoesScreen> {
  final TextEditingController _appNameController = TextEditingController();
  XFile? _selectedIcon;

  // Método para escolher uma imagem da galeria
  Future<void> _pickIcon() async {
    final ImagePicker picker = ImagePicker();
    final XFile? icon = await picker.pickImage(source: ImageSource.gallery);

    if (icon != null) {
      setState(() {
        _selectedIcon = icon;
      });
    }
  }

  @override
  void dispose() {
    _appNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: const Color(0xFF53a08e),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nome do Aplicativo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _appNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: 'Digite o nome do aplicativo',
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Ícone do Aplicativo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _pickIcon,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53a08e),
                  ),
                  child: const Text('Escolher Ícone'),
                ),
                const SizedBox(width: 16.0),
                if (_selectedIcon != null)
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.file(
                      File(_selectedIcon!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
