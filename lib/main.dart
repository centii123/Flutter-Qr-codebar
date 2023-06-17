import 'package:flutter/material.dart';
import 'package:qrSebas/pages/LectorBareCore.dart';
import 'package:qrSebas/pages/HomePage.dart';
import 'package:qrSebas/pages/LectorQr.dart';
import 'package:qrSebas/pages/generadorQr.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR & Barcode',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue),
       debugShowCheckedModeBanner: false, // Agrega esta línea para desactivar el banner de depuración

      routes: {
        '/': (context) => HomePage(),
        '/barcode_scan': (context) => BarcodeScanPage(),
        '/qr_generator': (context) => QrGeneratorPage(),
        '/qr_scan': (context) => QrScanPage(),
      },
    );
  }
}
