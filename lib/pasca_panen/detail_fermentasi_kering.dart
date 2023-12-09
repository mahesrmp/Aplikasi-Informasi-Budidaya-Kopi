import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailFermentasiKeringPage extends StatelessWidget {
  final dynamic data;

  DetailFermentasiKeringPage({required this.data});

  @override
  Widget build(BuildContext context) {
    var tahapan = data['tahapan'];
    var deskripsi = data['deskripsi'];
    var link = data['link'];
    var sumberArtikel = data['sumber_artikel'];
    var creditGambar = data['credit_gambar'];
    var imageUrls = List<String>.from(
      data['images'].map((image) => image['url']),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(tahapan),
        backgroundColor: Color(0xFF65451F),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tahapan,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Deskripsi: $deskripsi'),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sumber Artikel: $sumberArtikel'),
                    ],
                  ),
                ),
              ),
              if (imageUrls.length > 2)
                Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CarouselSlider.builder(
                      itemCount: (imageUrls.length / 2).ceil(),
                      options: CarouselOptions(
                        height: 150.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                      itemBuilder: (BuildContext context, int carouselIndex,
                          int carouselInnerIndex) {
                        int firstImageIndex = carouselIndex * 2;
                        int secondImageIndex = firstImageIndex + 1;

                        if (secondImageIndex < imageUrls.length) {
                          // Jika ada dua gambar
                          return Row(
                            children: [
                              Expanded(
                                child: Image.network(
                                  imageUrls[firstImageIndex],
                                  height: 150,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Image.network(
                                  imageUrls[secondImageIndex],
                                  height: 150,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          );
                        } else {
                          // Jika tinggal satu gambar, tampilkan secara penuh
                          return Image.network(
                            imageUrls[firstImageIndex],
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          );
                        }
                      },
                    ),
                  ),
                )
              else if (imageUrls.length == 2)
                Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.network(
                            imageUrls.length > 0 ? imageUrls[0] : '',
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Image.network(
                            imageUrls.length > 1 ? imageUrls[1] : '',
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else if (imageUrls.length == 1)
                Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(
                      imageUrls[0],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Credit Gambar: $creditGambar'),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Link:'),
                      GestureDetector(
                        onTap: () {
                          _launchYouTubeLink(link);
                        },
                        child: Text(
                          link,
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuka tautan YouTube di aplikasi YouTube atau browser
  void _launchYouTubeLink(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
