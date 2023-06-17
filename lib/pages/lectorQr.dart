import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScanPage extends StatefulWidget {
  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  String scannedQr = 'Jisoo Scanea el codigo QR:';
  String QrText = "";

  Future<void> _scanQr() async {
    String Qr = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000',
      'Cancel',
      true,
      ScanMode.QR,
    );

    if (Qr != '-1') {
      setState(() {
        scannedQr = 'Código QR:';
        QrText = "$Qr";
      });
    } else {
      setState(() {
        scannedQr = 'Escaneo cancelado';
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
          'Jisoo quiere escanear Codigo QR',
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
              child: Image.asset("assets/jisoo2.jpg"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              scannedQr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "$QrText",
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
              onPressed: _scanQr,
              icon: Icon(Icons.qr_code_scanner),
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
