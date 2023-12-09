import 'package:flutter/material.dart';
import 'budidaya.dart';
import 'panen.dart';
import 'pasca_panen.dart';
import 'login.dart';
import 'penjualan_page.dart';
import 'kedai_kopi/kedai_kopi.dart';
import 'komunitas_petani.dart';
import 'tambah_pengajuan_page.dart';
import 'auth_manager_page.dart';

class SuccessPage extends StatelessWidget {
  final int user;

  SuccessPage({required this.user});
  String? username = AuthManager.getUsername();

  void logout(BuildContext context) {
    // Tambahkan logika logout di sini, seperti membersihkan data pengguna, kembali ke halaman login, dll.
    Navigator.popUntil(context,
        ModalRoute.withName('/')); // Kembali ke halaman utama (main.dart)
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Markopi'),
  //       backgroundColor: Color(0xFF65451F),
  //       leading: Builder(
  //         builder: (context) => IconButton(
  //           icon: Icon(Icons.menu),
  //           onPressed: () {
  //             // Buka drawer saat ikon menu diklik
  //             Scaffold.of(context).openDrawer();
  //           },
  //         ),
  //       ),
  //     ),

  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text('Selamat! Anda berhasil login.'),
  //           Text('Username: ${user.username}'),
  //           Text('Email: ${user.email}'),
  //           Text('ID: ${user.id}'),
  //           Text('Token: ${user.token}'),
  //           SizedBox(height: 20),
  //           ElevatedButton(
  //             onPressed: () {
  //               // Panggil fungsi logout saat tombol ditekan
  //               logout(context);
  //             },
  //             child: Text('Logout'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
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
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              // Buka drawer saat ikon menu diklik
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF65451F),
              ),
              child: Text(
                'Welcome ${username}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Budidaya'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformationPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Panen'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PanenPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Pasca Panen'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PascaPanenPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Penjualan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PenjualanPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Kedai Kopi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KedaiKopiPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Komunitas Petani'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KomunitasPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Pengajuan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TambahPengajuanPage()),
                );
              },
            ),
            ListTile(
              title: ElevatedButton(
                onPressed: () {
                  // Panggil fungsi logout saat tombol ditekan
                  logout(context);
                },
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
      body: CardGrid(),
    );
  }
}

class CardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Color.fromRGBO(234, 230, 224, 0.4),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              CardItem(
                color: const Color.fromARGB(255, 255, 255, 255),
                imagePath: 'assets/images/1.png',
                caption: 'Budidaya',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformationPage()),
                  );
                },
              ),
              CardItem(
                color: const Color.fromARGB(255, 255, 255, 255),
                imagePath: 'assets/images/2.png',
                caption: 'Panen',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PanenPage()),
                  );
                },
              ),
              CardItem(
                color: const Color.fromARGB(255, 255, 255, 255),
                imagePath: 'assets/images/3.png',
                caption: 'Pasca Panen',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PascaPanenPage()),
                  );
                },
              ),
              CardItem(
                color: const Color.fromARGB(255, 255, 255, 255),
                imagePath: 'assets/images/4.png',
                caption: 'Penjualan',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PenjualanPage()),
                  );
                },
              ),
              CardItem(
                color: const Color.fromARGB(255, 255, 255, 255),
                imagePath: 'assets/images/5.png',
                caption: 'Kedai Kopi',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KedaiKopiPage()),
                  );
                },
              ),
              CardItem(
                color: const Color.fromARGB(255, 255, 255, 255),
                imagePath: 'assets/images/6.png',
                caption: 'Komunitas Petani',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KomunitasPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final String imagePath;
  final String caption;
  final VoidCallback onTap;

  CardItem({
    required this.color,
    required this.imagePath,
    required this.caption,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Card(
              color: color,
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            caption,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
