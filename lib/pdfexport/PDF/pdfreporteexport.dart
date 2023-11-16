import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:form_pdf/model/usuario.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

//Solicitud solicitud

Future<Uint8List> makePdfReporte({
  required Usuario usuario,
}) async {
  final pdf = Document();
  //const String pathLogo = '...';
  // final imageLogo =
  //     MemoryImage((await rootBundle.load(pathLogo)).buffer.asUint8List()); //Para imagen de background
  pdf.addPage(
    MultiPage(
      build: (context) => [
        Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.2,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: FlutterLogo(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'FORMULARIO',
                    style: TextStyle(
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "REPORTE DE USUARIO",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 40,
                    //   width: 140,
                    //   child: Image(imageLogo, width: 40),
                    // ),
                    Text(
                      '${DateTime.now()}'
                          .substring(0, ('${DateTime.now()}').length - 8),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Table(
                  border: TableBorder.all(color: PdfColors.black),
                  children: [
                    TableRow(
                      children: [
                        PaddedText1('Nombre'),
                        PaddedText1('Apellido'),
                        PaddedText1('Correo')
                      ],
                    ),
                    TableRow(
                      children: [
                        PaddedText2(usuario.nombre!),
                        PaddedText2(usuario.apellido!),
                        PaddedText2(usuario.correo!),
                      ],
                    ),
                    // ...publicaciones.map(
                    //   (e) => TableRow(
                    //     children: [
                    //       PaddedText2(e.id.toString()),
                    //       PaddedText2(
                    //           '${e.namePet[0].toUpperCase()}${e.namePet.substring(1)}'),
                    //       PaddedText2(e.agePet),
                    //       PaddedText2(e.genderPet),
                    //       PaddedText2(e.speciePet),
                    //       PaddedText2(e.breedPet),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
  return pdf.save();
}

Widget PaddedText1(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text(text,
          textAlign: align, style: TextStyle(fontWeight: FontWeight.bold)),
    );

Widget PaddedText2(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
