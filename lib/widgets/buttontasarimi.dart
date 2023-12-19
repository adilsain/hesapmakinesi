import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HesapMakinesiButtonu extends StatelessWidget {
  final String? metin;
  final int? dolguRengi;
  final int? metinRengi;
  final double? metinBoyutu;
  final Function? tiklama;

  const HesapMakinesiButtonu(
      {this.metin,
      this.dolguRengi,
      this.metinRengi,
      this.metinBoyutu,
      this.tiklama});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          backgroundColor: dolguRengi != null ? Color(dolguRengi!) : null,
          child: Text(
            metin ?? "",
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: metinBoyutu,
                color: metinRengi != null ? Color(metinRengi!) : null,
              ),
            ),
          ),
          onPressed: () {
            tiklama?.call(metin ?? "");
          },
        ),
      ),
    );
  }
}
