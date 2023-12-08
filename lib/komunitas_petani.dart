import 'package:flutter/material.dart';

class KomunitasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF65451F),
        title: Text(
          'Komunitas Petani',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme:
            IconThemeData(color: Colors.white), // Mengatur warna ikon panah
      ),
      backgroundColor: Color(0xFFEAE6E0),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileCard(
                name: 'Petani 1',
                imagePath: 'assets/images/petani1.jpg',
              ),
              ProfileCard(
                name: 'Petani 2',
                imagePath: 'assets/images/petani1.jpg',
              ),
              ProfileCard(
                name: 'Petani 3',
                imagePath: 'assets/images/petani1.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String imagePath;

  ProfileCard({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0, // Menambahkan bayangan pada Card
      child: Column(
        children: [
          Container(
            height: 150.0,
            child: ClipOval(
              child: Image.asset(
                imagePath,
                height: 150.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Petani',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xFF8E745C),
            ),
            child: TextButton(
              onPressed: () {
                // Aksi ketika tombol "Kunjungi" ditekan
              },
              child: Text(
                'Kunjungi',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
