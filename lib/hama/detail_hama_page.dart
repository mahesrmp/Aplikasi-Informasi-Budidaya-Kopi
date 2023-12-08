import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailHamaPage extends StatelessWidget {
  final dynamic data;

  DetailHamaPage({required this.data});

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
              Text(
                tahapan,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Deskripsi: $deskripsi'),
              Text('Sumber Artikel: $sumberArtikel'),
              if (imageUrls.length > 2)
                CarouselSlider.builder(
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
                )
              else if (imageUrls.length == 2)
                Row(
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
                )
              else if (imageUrls.length == 1)
                Image.network(
                  imageUrls[0],
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              Text('Credit Gambar: $creditGambar'),
              Text('Link: $link'),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
