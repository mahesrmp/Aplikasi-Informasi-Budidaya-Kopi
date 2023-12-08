import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'status_pengajuan_page.dart';
import 'auth_manager_page.dart';

class PengajuanPage extends StatefulWidget {
  @override
  _PengajuanPageState createState() => _PengajuanPageState();
}

class _PengajuanPageState extends State<PengajuanPage> {
  final String apiUrl = "http://127.0.0.1:8000/api/pengajuantambah";

  String fotoKTPPath = '';
  String fotoSelfiePath = '';
  String fotoSertifikatPath = '';
  final TextEditingController deskripsiController = TextEditingController();

  Future<int?> getUserId() async {
    return AuthManager.userId;
  }

  Future<void> submitPengajuan({
    required String fotoKTP,
    required String fotoSelfie,
    required String deskripsiPengalaman,
    required String fotoSertifikat,
    required int userId,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..fields['deskripsi_pengalaman'] = deskripsiPengalaman
        ..fields['petani_id'] = userId.toString()
        ..files.add(await http.MultipartFile.fromPath(
          'foto_ktp',
          fotoKTP,
        ))
        ..files.add(await http.MultipartFile.fromPath(
          'foto_selfie',
          fotoSelfie,
        ))
        ..files.add(await http.MultipartFile.fromPath(
          'foto_sertifikat',
          fotoSertifikat,
        ));

      var response = await request.send();

      if (response.statusCode == 200) {
        // Berhasil mengirim pengajuan, Anda dapat menanggapi hasilnya di sini.
        print("Pengajuan berhasil");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StatusPengajuanPage(),
          ),
        );
      } else {
        // Gagal mengirim pengajuan, Anda dapat menanggapi hasilnya di sini.
        print("Pengajuan gagal");
        Navigator.pop(context);
      }
    } catch (error) {
      // Handle error
      print("Error: $error");
      Navigator.pop(context);
    }
  }

  Future<void> pickImage(String field) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.isNotEmpty) {
      String imagePath = result.files.first.path!;
      setState(() {
        if (field == 'foto_ktp') {
          fotoKTPPath = imagePath;
        } else if (field == 'foto_selfie') {
          fotoSelfiePath = imagePath;
        } else if (field == 'foto_sertifikat') {
          fotoSertifikatPath = imagePath;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengajuan Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await pickImage('foto_ktp');
              },
              child: Text('Pilih Foto KTP'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await pickImage('foto_selfie');
              },
              child: Text('Pilih Foto Selfie'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await pickImage('foto_sertifikat');
              },
              child: Text('Pilih Foto Sertifikat'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: deskripsiController,
              decoration: InputDecoration(
                labelText: 'Deskripsi Pengalaman',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                int? userId = await getUserId();
                if (userId != null) {
                  submitPengajuan(
                    fotoKTP: fotoKTPPath,
                    fotoSelfie: fotoSelfiePath,
                    deskripsiPengalaman: deskripsiController.text,
                    fotoSertifikat: fotoSertifikatPath,
                    userId: userId,
                  );
                }
              },
              child: Text('Submit Pengajuan'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PengajuanPage(),
  ));
}
