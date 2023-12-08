import 'package:flutter/material.dart';

class PenjualanPage extends StatelessWidget {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              'Penjualan Page',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Card(
                elevation: 4.0,
                margin: EdgeInsets.all(16.0),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/penjualan.png', // Ganti dengan path gambar sesuai kebutuhan
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
