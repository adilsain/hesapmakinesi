import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesapmakinesi/widgets/buttontasarimi.dart';

void main() {
  runApp(HesapMakinesi());
}

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({super.key});

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
//Tutucular

  late int sayi1;
  late int sayi2;
  String gosterilecekSayi = "";
  String islemGecmisi = "";
  late String sonuc;
  late String islemTutucu;

//Button tıklama

  void btnTiklama(String buttonDegeriTutucu) {
    print(buttonDegeriTutucu);

    if (buttonDegeriTutucu == "AC") {
      //hepsini sil

      gosterilecekSayi = "";
      sonuc = "";
      sayi1 = 0;
      sayi2 = 0;
      islemGecmisi = "";
      islemTutucu = "";
    } else if (buttonDegeriTutucu == "+/-") {
      // pozitifse negatif yap negatif ise pozitif yap
      if (gosterilecekSayi[0] != "-") {
        //başında - yoksa ekle
        sonuc = "-" + gosterilecekSayi;
      } else {
        sonuc = gosterilecekSayi.substring(1);
      }
    } else if (buttonDegeriTutucu == "%") {
      sayi1 = int.parse(gosterilecekSayi);
      islemTutucu = (sayi1 / 100).toString();
      sonuc = islemTutucu;
    } else if (buttonDegeriTutucu == "÷") {
//Gösterilen sayiyi sayi 1 'e aktar, sonucu temizle
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    } else if (buttonDegeriTutucu == "x") {
      //Gösterilen sayiyi sayi 1 'e aktar, sonucu temizle
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    } else if (buttonDegeriTutucu == "-") {
      //Gösterilen sayiyi sayi 1 'e aktar, sonucu temizle
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    } else if (buttonDegeriTutucu == "+") {
      //Gösterilen sayiyi sayi 1 'e aktar, sonucu temizle

      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    } else if (buttonDegeriTutucu == "=") {
      sayi2 = int.parse(gosterilecekSayi);

      if (islemTutucu == "+") {
        //toplama yaptır
        sonuc = (sayi1 + sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      } else if (islemTutucu == "-") {
        //çıkartma yaptır
        sonuc = (sayi1 - sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      } else if (islemTutucu == "x") {
        //çarpma yaptır
        sonuc = (sayi1 * sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      } else if (islemTutucu == "÷") {
        //bölme yaptır
        sonuc = (sayi1 / sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      }
    } else if (buttonDegeriTutucu == "C") {
      //islem gecmisi haric yerleri sil
      gosterilecekSayi = "";
      sonuc = "";
      sayi1 = 0;
      sayi2 = 0;
    } else if (buttonDegeriTutucu == ",") {
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = gosterilecekSayi + ",";
    }
    //rakamlara tıklandıgındaaaa
    else {
      sonuc = int.parse(gosterilecekSayi + buttonDegeriTutucu).toString();
    }

    //Durum yenileme
    setState(() {
      gosterilecekSayi = sonuc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hesap Makinesi"),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 12, 8),
                  child: Text(
                    islemGecmisi,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 12, 8),
                  child: Text(
                    gosterilecekSayi,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapMakinesiButtonu(
                    metin: "AC",
                    dolguRengi: 0xFFB5B5B5,
                    metinRengi: 0xff000000,
                    metinBoyutu: 24.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "+/-",
                    dolguRengi: 0xFFB5B5B5,
                    metinRengi: 0xff000000,
                    metinBoyutu: 30.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "%",
                    dolguRengi: 0xFFB5B5B5,
                    metinRengi: 0xff000000,
                    metinBoyutu: 30.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "÷",
                    dolguRengi: 0xFFFF9626,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 50.0,
                    tiklama: btnTiklama,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapMakinesiButtonu(
                    metin: "7",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 24.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "8",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 30.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "9",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 30.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "x",
                    dolguRengi: 0xFFFF9626,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 40.0,
                    tiklama: btnTiklama,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapMakinesiButtonu(
                    metin: "4",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 24.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "5",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 30.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "6",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 30.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "-",
                    dolguRengi: 0xFFFF9626,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 50.0,
                    tiklama: btnTiklama,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapMakinesiButtonu(
                    metin: "1",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 24.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "2",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 30.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "3",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 30.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "+",
                    dolguRengi: 0xFFFF9626,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 44.0,
                    tiklama: btnTiklama,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapMakinesiButtonu(
                    metin: "0",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 24.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: ",",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 30.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "C",
                    dolguRengi: 0xFF646363,
                    metinRengi: 0xff000000,
                    metinBoyutu: 30.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "=",
                    dolguRengi: 0xFFFF9626,
                    metinRengi: 0xFFFFFFFF,
                    metinBoyutu: 44.0,
                    tiklama: btnTiklama,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
