import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanPage extends StatefulWidget {
  @override
  _BarcodeScanPageState createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  String scannedBarcode = 'Jisoo Scanea el codigo de barras:';
  String bareText = "";

  Future<void> _scanBarcode() async {
    String barcode = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000',
      'Cancel',
      true,
      ScanMode.BARCODE,
    );

    if (barcode != '-1') {
      setState(() {
        scannedBarcode = 'Código de barras escaneado:';
        bareText = '$barcode';
      });
    } else {
      setState(() {
        scannedBarcode = 'Escaneo cancelado';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Jisoo quiere escanear codigo de barras',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: Image.asset("assets/jisoo3.jpg"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              scannedBarcode,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "$bareText",
              style: TextStyle(
                  color: Color.fromARGB(255, 128, 70, 204),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 60),
              ),
              onPressed: _scanBarcode,
              icon: Icon(Icons.document_scanner),
              label: Text(
                "Escanear",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
