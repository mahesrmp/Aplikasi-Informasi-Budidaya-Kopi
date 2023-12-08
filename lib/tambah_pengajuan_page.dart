import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'auth_manager_page.dart';
import 'pengajuan_page.dart';

class TambahPengajuanPage extends StatefulWidget {
  @override
  _TambahPengajuanPageState createState() => _TambahPengajuanPageState();
}

class _TambahPengajuanPageState extends State<TambahPengajuanPage> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    int? userId = AuthManager.getUserId();

    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/pengajuan_status/$userId'));

    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);
      List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(responseData);

      setState(() {
        data = result;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Pengajuan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: data.isEmpty || data[0]['status'] == '2', // Tampilkan jika status 0 atau 2
              child: ElevatedButton(
                onPressed: () {
                  // Mengarahkan ke halaman PengajuanPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PengajuanPage()),
                  );
                },
                child: Text('Tambah Pengajuan'), // Mengganti teks tombol
              ),
            ),
            SizedBox(height: 20),
            Text('Data from API:'),
            SizedBox(height: 10),
            if (data.isEmpty)
              Text('No data available')
            else
              Column(
                children: data.map((item) {
                  return ListTile(
                    title: Text('Status: ${item['status']}'),
                    subtitle: Text(
                        'ID: ${item['id']} - Petani ID: ${item['petani_id']}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika untuk tindakan sesuai dengan status
                        if (item['status'] == '0') {
                          // Tindakan ketika status = 0 (Menunggu)
                          print('Menunggu');
                        } else if (item['status'] == '1') {
                          // Tindakan ketika status = 1 (Diterima)
                          print('Diterima');
                        } else if (item['status'] == '2') {
                          // Tindakan ketika status = 2 (Ditolak)
                          print('Ditolak');
                        }
                      },
                      child: Text(
                        item['status'] == '0'
                            ? 'Menunggu'
                            : (item['status'] == '1' ? 'Diterima' : 'Ditolak'),
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
