import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const WattpadScreen(),
    );
  }
}

class WattpadScreen extends StatelessWidget {
  const WattpadScreen({super.key});

  // --- LISTA DE IMÁGENES PARA LA PARTE DE ABAJO ---
  // Agrega aquí todos los links que quieras mostrar en la fila horizontal
  final List<String> misImagenesAbajo = const [
    'https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/lobro4.JPG',
    'https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/orgullo.JPG',
    'https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/rey.JPG',
    'https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/sk.JPG',
    'https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/carolline.JPG',
    'https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/cumbres.JPG',
  ];

  final TextStyle sectionStyle = const TextStyle(
    fontSize: 18, 
    fontWeight: FontWeight.bold,
    fontFamily: 'Comic Sans MS', 
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Icon(
          Icons.auto_stories, 
          color: Colors.orange,
          size: 32, 
        ),
        actions: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Prueba Premium',
                style: TextStyle(fontSize: 12, color: Colors.purpleAccent),
              ),
            ),
          ),
          const IconButton(
            icon: Icon(Icons.card_giftcard, color: Colors.yellow),
            onPressed: null,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/SISI.JPG'),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              'https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/coralline2.JPG',
              height: 140, 
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          
          Text("Historias de los escritores que te gustan", style: sectionStyle),
          const SizedBox(height: 10),
          
          SizedBox(
            height: 210, 
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: _buildBookCover('https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/cumbres.JPG'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(child: _buildBookCover('https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/l.JPG')),
                            const SizedBox(width: 8),
                            Expanded(child: _buildBookCover('https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/libro2.JPG')),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(child: _buildBookCover('https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/libro3.JPG')),
                            const SizedBox(width: 8),
                            Expanded(child: _buildBookCover('https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/ll.JPG')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 25),
          Text("Éxitos Clasicos", style: sectionStyle),
          const SizedBox(height: 10),
          
          // --- AQUÍ ESTÁ EL CAMBIO PARA IMÁGENES DIVERSAS ---
          SizedBox(
            height: 140, 
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: misImagenesAbajo.length, // Usa el largo de tu lista
              itemBuilder: (context, index) {
                // Selecciona la imagen de la lista según la posición (index)
                return _buildSquareBook(misImagenesAbajo[index]);
              },
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey[600],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book, color: Colors.white, size: 28), 
            label: ''
          ),
          BottomNavigationBarItem(icon: Icon(Icons.edit_note), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ''),
        ],
      ),
    );
  }

  Widget _buildBookCover(String url) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildSquareBook(String url) {
    return Container(
      width: 95, 
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      ),
    );
  }
}