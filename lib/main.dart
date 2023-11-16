import 'package:flutter/material.dart';
import 'package:form_pdf/model/usuario.dart';
import 'package:form_pdf/pdfexport/pdf_reporte_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Form(),
    );
  }
}

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerApellido = TextEditingController();
  TextEditingController controllerCorreo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: controllerNombre,
              decoration: const InputDecoration(
                label: Text('Nombre'),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controllerApellido,
              decoration: const InputDecoration(
                label: Text('Apellido'),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controllerCorreo,
              decoration: const InputDecoration(
                label: Text('Correo'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final usuario = Usuario(
            nombre: controllerNombre.text,
            apellido: controllerApellido.text,
            correo: controllerCorreo.text,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PdfReportePage(
                usuario: usuario,
              ),
            ),
          );
        },
        label: const Text('Generar PDF'),
        icon: const Icon(Icons.file_copy),
      ),
    );
  }
}
