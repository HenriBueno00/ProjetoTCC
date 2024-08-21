import 'package:flutter/material.dart';
import 'package:voce_mais_segura/screens/chamadoScreen.dart';
import 'package:voce_mais_segura/screens/configuracoesScreen.dart';
import 'package:voce_mais_segura/screens/contatosEmergenciaScreen.dart';
import 'package:voce_mais_segura/screens/dadosPessoaisScreen.dart';
import 'package:voce_mais_segura/screens/dispositivosScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Menu Principal"),
        backgroundColor: const Color(0xFF53a08e), // Cor da AppBar
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Abre o Drawer usando a chave do Scaffold
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF53a08e), // Cor de fundo do Drawer
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings, color: Color(0xFF53a08e)),
                    title: const Text('Configurações'),
                    onTap: () {
                      // Ação ao clicar em Configurações
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConfiguracoesScreen(),
                          )
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.devices, color: Color(0xFF53a08e)),
                    title: const Text('Dispositivos'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DispositivosScreen(),
                        )
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, color: Color(0xFF53a08e)),
                    title: const Text('Dados Pessoais'),
                    onTap: () {
                      // Navegar para a tela de Dados Pessoais
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dadospessoaisscreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.emergency, color: Color(0xFF53a08e)),
                    title: const Text('Contatos de Emergência'),
                    onTap: () {
                      // Ação ao clicar em Contatos de Emergência
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Contatosemergenciascreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.warning, color: Colors.white),
              label: const Text(
                "Emitir alerta",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: const Color(0xFF53a08e), // Cor do botão
                shadowColor: Colors.black.withOpacity(0.1),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Navegar para a tela de chamado
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChamadoScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.phone, color: Colors.white),
              label: const Text(
                "Ligar para contato",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: const Color(0xFF7ebea3), // Cor do botão
                shadowColor: Colors.black.withOpacity(0.1),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ligar para contato não implementado')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
