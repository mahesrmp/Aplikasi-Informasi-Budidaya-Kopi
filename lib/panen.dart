import 'package:flutter/material.dart';

class PanenPage extends StatelessWidget {
  final List<String> categories = [
    'Ciri Buah Kopi',
    'Pemetikan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Panen'),
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
                        if (category == 'Ciri Buah Kopi') {
                          Navigator.pushNamed(context, '/ciri_buah_kopi');
                        }else if(category == 'Pemetikan'){
                          Navigator.pushNamed(context, '/pemetikan');
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
