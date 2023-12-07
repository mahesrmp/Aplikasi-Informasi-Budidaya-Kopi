// main.dart

import 'package:flutter/material.dart';
import 'budidaya.dart';
import 'utama_page.dart';
import 'syarat_tumbuh/syarat_tumbuh_page.dart';
import 'pola_tanam/pola_tanam_page.dart';
import 'pohon_pelindung/pohon_pelindung_page.dart';
import 'panen.dart';
import 'panen/ciri_buah_kopi_page.dart';
import 'panen/pemetikan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          ProsesBudidayaPage(), // Set ProsesBudidayaPage sebagai halaman utama
      routes: {
        // '/': (context) =>
        //     InformationPage(), // Tambahkan rute untuk InformationPage
        '/budidaya': (context) => InformationPage(),
        '/syarat_tumbuh': (context) => SyaratTumbuhPage(),
        '/pola_tanam': (context) => PolaTanamPage(),
        '/pohon_pelindung': (context) => PohonPelindungPage(),
        '/panen': (context) => PanenPage(),
      },
    );
  }
}
