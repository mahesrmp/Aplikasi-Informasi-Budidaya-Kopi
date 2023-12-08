// main.dart

import 'package:belajar_flutter/auth_manager_page.dart';
import 'package:flutter/material.dart';
import 'budidaya.dart';
import 'utama_page.dart';
import 'syarat_tumbuh/syarat_tumbuh_page.dart';
import 'pola_tanam/pola_tanam_page.dart';
import 'pohon_pelindung/pohon_pelindung_page.dart';
import 'panen.dart';
import 'panen/ciri_buah_kopi_page.dart';
import 'panen/pemetikan_page.dart';
import 'login_page.dart';
import 'success_login_page.dart';
import 'pengajuan_page.dart';
import 'tambah_pengajuan_page.dart';

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
        '/home': (context) => SuccessLoginPage(userId: AuthManager.userId!),
        '/budidaya': (context) => InformationPage(),
        '/syarat_tumbuh': (context) => SyaratTumbuhPage(),
        '/pola_tanam': (context) => PolaTanamPage(),
        '/pohon_pelindung': (context) => PohonPelindungPage(),
        '/panen': (context) => PanenPage(),
        '/login': (context) => LoginPage(),
        '/pengajuan': (context) => PengajuanPage(),
        '/addpengajuan': (context) => TambahPengajuanPage(),
      },
    );
  }
}
