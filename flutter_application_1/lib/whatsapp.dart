import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _mensaje(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Código para deshacer
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Aumenté a 4 para incluir la cámara
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF075E54), // Color verde WhatsApp
          title: const Text("WhatsApp"),
          actions: [
            IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              onPressed: () {
                _mensaje("");
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                _mensaje("");
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                _mensaje("");
              },
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white, // Color del indicador
            labelColor: Colors.white, // Color de las letras seleccionadas
            unselectedLabelColor: Colors.white60, // Color de las letras no seleccionadas
            tabs: [
              Tab(icon: Icon(Icons.camera_alt_rounded, color: Colors.white)), // Cámara
              Tab(child: Text("CHATS", style: TextStyle(color: Colors.white))),
              Tab(child: Text("STATUS", style: TextStyle(color: Colors.white))),
              Tab(child: Text("CALLS", style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
        body: TabBarView(
          children: [ const
            Center (
              child: Icon(Icons.camera_alt_rounded, size: 50, color: Colors.grey),
            ),
            ListView(
              children: [ ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(''),
                    radius: 25,
                  ),
                  title: const Text("Pedro picapiedra",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Row(
                    children: const [
                      Icon(Icons.done_all, color: Colors.blue, size: 18),
                      SizedBox(width: 5),
                      Text("Pablo devuelveme el tronco movil..."),
                    ],
                  ),
                  trailing: const Text(
                    "Ayer",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    _mensaje("");
                  },
                ),

              ],
            ),
            ListView(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      '',
                    ),
                    radius: 25,
                  ),
                  //aqui va el estado para pedro
                  title: const Text("Pedro picapiedra",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Row(
                    children: [
                      Icon(Icons.done_all, color: Colors.blue, size: 18),
                      SizedBox(width: 5),
                      Text("Yabadabadu.."),
                    ],
                  ),
                  trailing: const Text(
                    "Now",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    _mensaje("");
                  },
                ),
              ],
            ),
            const Center(child: Text("Aquí van las Llamadas")),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF25D366),
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text('Hola! Soy un SnackBar'),
              action: SnackBarAction(
                label: 'Deshacer',
                onPressed: () {
                  // Alguna acción de deshacer
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Icon(Icons.message, color: Colors.white),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}
