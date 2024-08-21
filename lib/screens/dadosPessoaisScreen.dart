import 'package:flutter/material.dart';

class Dadospessoaisscreen extends StatefulWidget {
  const Dadospessoaisscreen({super.key});

  @override
  State<Dadospessoaisscreen> createState() => _DadospessoaisscreenState();
}

class _DadospessoaisscreenState extends State<Dadospessoaisscreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados Pessoais"),
        backgroundColor: const Color(0xFF53a08e), // Cor da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              controller: _nomeController,
              label: "Nome completo",
              icon: Icons.person,
            ),
            const SizedBox(height: 16.0),
            _buildTextField(
              controller: _cpfController,
              label: "CPF",
              icon: Icons.credit_card,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            _buildTextField(
              controller: _idadeController,
              label: "Idade",
              icon: Icons.calendar_today,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            _buildTextField(
              controller: _telefoneController,
              label: "Número de Telefone",
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16.0),
            _buildTextField(
              controller: _enderecoController,
              label: "Endereço",
              icon: Icons.home,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Ação ao clicar em Sair
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0), backgroundColor: const Color(0xFF53a08e), // Cor do botão
                shadowColor: Colors.black.withOpacity(0.1),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Sair",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF53a08e)), // Ícone do campo
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFF53a08e), width: 2.0),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFF53a08e), width: 1.0),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
