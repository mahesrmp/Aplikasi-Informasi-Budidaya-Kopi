// information_page.dart

import 'package:flutter/material.dart';
import 'syarat_tumbuh/syarat_tumbuh_page.dart';
import 'pola_tanam/pola_tanam_page.dart';

class InformationPage extends StatelessWidget {
  final List<String> categories = [
    'Syarat Tumbuh',
    'Pola Tanam',
    'Pohon Pelindung',
    'Pembibitan',
    'Pemupukan',
    'Pemangkasan',
    'Hama dan Penyakit',
    'Sanitasi Kebun',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Budidaya'),
        leading: IconButton(
          onPressed: () {
            // Navigasi ke ProsesBudidayaPage dan menggantikan halaman saat ini
            Navigator.pushReplacementNamed(context, '/');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              categories.length,
              (index) {
                var category = categories[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman yang sesuai berdasarkan kategori
                        if (category == 'Syarat Tumbuh') {
                          Navigator.pushNamed(context, '/syarat_tumbuh');
                        }else if(category == 'Pola Tanam'){
                          Navigator.pushNamed(context, '/pola_tanam');
                        }else if(category == 'Pohon Pelindung'){
                          Navigator.pushNamed(context, '/pohon_pelindung');
                        }else {
                          // Tambahkan navigasi ke halaman lain jika diperlukan
                        }
                      },
                      child: Text(category),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
