import 'package:flutter/material.dart';

class Contatosemergenciascreen extends StatefulWidget {
  const Contatosemergenciascreen({super.key});

  @override
  State<Contatosemergenciascreen> createState() => _ContatosemergenciascreenState();
}

class _ContatosemergenciascreenState extends State<Contatosemergenciascreen> {
  List<Map<String, String>> contatos = [
    {
      "nome": "Maria Silva",
      "telefone": "123456789",
      "endereco": "Rua A, 123",
      "parentesco": "Mãe"
    },
    {
      "nome": "João Souza",
      "telefone": "987654321",
      "endereco": "Rua B, 456",
      "parentesco": "Pai"
    },
  ];

  void _showEditContactBottomSheet(BuildContext context, {Map<String, String>? contato}) {
    final TextEditingController nomeController = TextEditingController(text: contato?['nome']);
    final TextEditingController telefoneController = TextEditingController(text: contato?['telefone']);
    final TextEditingController enderecoController = TextEditingController(text: contato?['endereco']);
    final TextEditingController parentescoController = TextEditingController(text: contato?['parentesco']);

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
                contato == null ? 'Adicionar Novo Contato' : 'Editar Contato',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome Completo',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: telefoneController,
                decoration: const InputDecoration(
                  labelText: 'Número de Telefone',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: enderecoController,
                decoration: const InputDecoration(
                  labelText: 'Endereço',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: parentescoController,
                decoration: const InputDecoration(
                  labelText: 'Parentesco',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Lógica de salvar o novo contato ou as alterações
                  if (contato == null) {
                    // Adiciona novo contato
                    setState(() {
                      contatos.add({
                        'nome': nomeController.text,
                        'telefone': telefoneController.text,
                        'endereco': enderecoController.text,
                        'parentesco': parentescoController.text,
                      });
                    });
                  } else {
                    // Atualiza o contato existente
                    setState(() {
                      contato['nome'] = nomeController.text;
                      contato['telefone'] = telefoneController.text;
                      contato['endereco'] = enderecoController.text;
                      contato['parentesco'] = parentescoController.text;
                    });
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53a08e),
                ),
                child: const Text('Salvar'),
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
        title: const Text('Contatos de Emergência'),
        backgroundColor: const Color(0xFF53a08e),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: contatos.length,
                itemBuilder: (context, index) {
                  final contato = contatos[index];
                  return ListTile(
                    title: Text(contato['nome']!),
                    subtitle: Text(contato['telefone']!),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit, color: Color(0xFF53a08e)),
                      onPressed: () => _showEditContactBottomSheet(context, contato: contato),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEditContactBottomSheet(context),
        backgroundColor: const Color(0xFF53a08e),
        child: const Icon(Icons.add),
      ),
    );
  }
}
