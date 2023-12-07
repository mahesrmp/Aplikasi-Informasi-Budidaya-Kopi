// syarat_tumbuh_page.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail_pola_tanam_page.dart';

class PolaTanamPage extends StatelessWidget {
  final String apiUrl = "http://127.0.0.1:8000/api/budidaya/pola_tanam";

  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pola Tanam'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fecthDataUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    snapshot.data.length,
                    (index) {
                      var data = snapshot.data[index];
                      var tahapan = data['tahapan'];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPolaTanamPage(data: data),
                                ),
                              );
                            },
                            child: Text(tahapan),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
