// information_page.dart
import 'package:flutter/material.dart';

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
        title: Text(
          'Markopi',
          style: TextStyle(
            color: Colors.white, // Warna teks di AppBar
          ),
        ),
        backgroundColor: Color(0xFF65451F),
        leading: IconButton(
          onPressed: () {
            // Navigasi ke ProsesBudidayaPage dan menggantikan halaman saat ini
            Navigator.pushReplacementNamed(context, '/');
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background.png'), // Ganti dengan path gambar Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height:
                      kToolbarHeight + 0), // Sesuaikan jarak sesuai kebutuhan
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16, top: 0),
                child: Text(
                  'Budidaya',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
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
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF8E745C), // Warna tombol
                              ),
                              onPressed: () {
                                // Navigasi ke halaman yang sesuai berdasarkan kategori
                                if (category == 'Syarat Tumbuh') {
                                  Navigator.pushNamed(
                                      context, '/syarat_tumbuh');
                                } else if (category == 'Pola Tanam') {
                                  Navigator.pushNamed(context, '/pola_tanam');
                                } else if (category == 'Pohon Pelindung') {
                                  Navigator.pushNamed(
                                      context, '/pohon_pelindung');
                                } else if (category == 'Pembibitan') {
                                  Navigator.pushNamed(context, '/pembibitan');
                                } else if (category == 'Pemupukan') {
                                  Navigator.pushNamed(context, '/pemupukan');
                                } else if (category == 'Pemangkasan') {
                                  Navigator.pushNamed(context, '/pemangkasan');
                                } else if (category == 'Hama dan Penyakit') {
                                  Navigator.pushNamed(context, '/hama');
                                } else if (category == 'Sanitasi Kebun') {
                                  Navigator.pushNamed(context, '/sanitasi');
                                } else {
                                  // Tambahkan navigasi ke halaman lain jika diperlukan
                                }
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    color: Colors.white, // Warna teks
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
