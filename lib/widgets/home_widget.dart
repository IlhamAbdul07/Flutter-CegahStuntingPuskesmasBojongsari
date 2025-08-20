import 'package:flutter/material.dart';
import 'package:stunting_web/constants/colors.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                width: double.infinity,
                height: 450.0,
                color: CustomColor.whiteSecondary,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/home1.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 75,
                          left: 75,
                          right: 75,
                          bottom: 75,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "APA ITU STUNTING ?",
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.04,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Kondisi gagal pada proses pertumbuhan dan perkembangan anak balita akibat kekurangan gizi sejak dalam kandungan, yang ditandai dengan tubuh lebih pendek atau kerdil dibandingkan dengan anak seusianya.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width *
                                    0.018, // responsif (1.8% lebar layar)
                                color: Colors.black87,
                                height: 1.5, // biar enak dibaca (line spacing)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 250.0,
                color: CustomColor.greenMain,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "MENURUNKAN ANGKA STUNTING DI INDONESIA",
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.03,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Pemerintah berupaya menurunkan angka stunting di Indonesia. Data kementerian kesehatan menunjukkan pravelensi stunting nasional pada tahun 2021 mencapai 24,4 persen. Angka ini melebihi batas yang ditetapkan WHO (World Health Organization), yakni dibawah 20 persen",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.015,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 450.0,
                color: CustomColor.bgSecondary,
              ),
            ],
          ),
        );
      },
    );
  }
}
