// main.dart


import 'package:belajar_flutter/hama/hama_page.dart';
import 'package:belajar_flutter/panen/ciri_buah_kopi.dart';
import 'package:belajar_flutter/panen/pemetikan.page.dart';
import 'package:belajar_flutter/pasca_panen/fermentasi_kering.dart';
import 'package:belajar_flutter/pasca_panen/fermentasi_mekanis.dart';
import 'package:belajar_flutter/pemangkasan/pemangkasan.dart';
import 'package:belajar_flutter/pembibitan/pembibitan_page.dart';
import 'package:belajar_flutter/pemupukan/pemupukan.dart';
import 'package:belajar_flutter/sanitasi/sanitasi.dart';

import 'package:belajar_flutter/auth_manager_page.dart';

import 'package:flutter/material.dart';
import 'budidaya.dart';
import 'syarat_tumbuh/syarat_tumbuh_page.dart';
import 'pola_tanam/pola_tanam_page.dart';
import 'pohon_pelindung/pohon_pelindung_page.dart';
import 'panen.dart';

import 'landing_page.dart';

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
      home: MainScreen(), // Set ProsesBudidayaPage sebagai halaman utama
      routes: {
        // '/': (context) =>
        //     InformationPage(), // Tambahkan rute untuk InformationPage
        '/home': (context) => SuccessLoginPage(userId: AuthManager.userId!),
        '/budidaya': (context) => InformationPage(),
        '/syarat_tumbuh': (context) => SyaratTumbuhPage(),
        '/pola_tanam': (context) => PolaTanamPage(),
        '/pohon_pelindung': (context) => PohonPelindungPage(),
        '/panen': (context) => PanenPage(),

        '/pembibitan': (context) => PembibitanPage(),
        '/pemupukan': (context) => PemupukanPage(),
        '/pemangkasan': (context) => PemangkasanPage(),
        '/hama': (context) => HamaPage(),
        '/sanitasi': (context) => SanitasiPage(),

        //Panen
        '/pemetikan': (context) => PemetikanPage(),
        '/ciri_buah_kopi': (context) => CiriKopiPage(),

        //Pasca Panen
        '/fermentasi_kering': (context) => FermentasiKeringPage(),
        '/fermentasi_mekanis': (context) => FermentasiMekanisPage(),

        '/login': (context) => LoginPage(),
        '/pengajuan': (context) => PengajuanPage(),
        '/addpengajuan': (context) => TambahPengajuanPage(),

      },
    );
  }
}
