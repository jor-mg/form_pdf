import 'package:flutter/material.dart';
import 'package:form_pdf/model/usuario.dart';
import 'package:form_pdf/pdfexport/PDF/pdfreporteexport.dart';
import 'package:printing/printing.dart';

class PdfReportePage extends StatelessWidget {
  final Usuario usuario;

  const PdfReportePage({
    super.key,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reporte',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: PdfPreview(
        build: (context) => makePdfReporte(usuario: usuario),
      ),
    );
  }
}
