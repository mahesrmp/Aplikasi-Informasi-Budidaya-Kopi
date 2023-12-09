import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilPage extends StatelessWidget {
  final String fotoSelfie;
  final String noTelp;
  final String deskripsiPengalaman;
  final String kabupaten;
  final String username;

  ProfilPage({
    required this.fotoSelfie,
    required this.noTelp,
    required this.deskripsiPengalaman,
    required this.kabupaten,
    required this.username,
  });

  _launchWhatsApp() async {
    String url = "https://wa.me/$noTelp";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double halfScreenHeight = screenHeight / 2;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: halfScreenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(fotoSelfie),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: halfScreenHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Color(0xFF65451F),
                      ],
                      stops: [0.0, 0.5, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Petani Kopi Arabica',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF65451F),
                    const Color.fromARGB(255, 49, 47, 47),
                  ],
                  stops: [0.0, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi Profil Anda\n$deskripsiPengalaman',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _launchWhatsApp,
                      child: Text('Hubungi via WhatsApp'),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Kabupaten: $kabupaten',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
