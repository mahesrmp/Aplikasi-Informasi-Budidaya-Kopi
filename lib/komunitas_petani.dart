import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'komunitas_detail.dart';

class KomunitasPage extends StatelessWidget {
  Future<List<Map<String, dynamic>>> fetchData() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/komunitas'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF65451F),
        title: Text(
          'Komunitas Petani',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xFFEAE6E0),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Map<String, dynamic>> komunitasData = snapshot.data!;
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: komunitasData.map((data) {
                    return ProfileCard(
                      name: data['username'] ?? 'Nama Pengguna',
                      imagePath: data['foto_selfie'] ??
                          'assets/images/default_image.jpg',
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilPage(
                              fotoSelfie: data['foto_selfie'] ?? '',
                              noTelp: data['no_telp'] ?? '',
                              deskripsiPengalaman:
                                  data['deskripsi_pengalaman'] ?? '',
                              kabupaten: data['kabupaten'] ?? '',
                              username: data['username'] ?? '',
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback onPress;

  ProfileCard({
    required this.name,
    required this.imagePath,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      child: Column(
        children: [
          Container(
            height: 150.0,
            child: ClipOval(
              child: InkWell(
                onTap: onPress,
                child: Image.network(
                  imagePath,
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
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
              onPressed: onPress,
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
