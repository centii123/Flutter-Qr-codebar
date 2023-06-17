import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGeneratorPage extends StatefulWidget {
  @override
  _QrGeneratorPageState createState() => _QrGeneratorPageState();
}

class _QrGeneratorPageState extends State<QrGeneratorPage> {
  String qrText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Jisoo quiere generar codigo QR',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              
              style: TextStyle(color: Colors.purple),
              onChanged: (text) {
                setState(() {
                  qrText = text;
                });
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 160, 73, 175)
                ),
                labelText: 'Ingrese el texto',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.purple
                  )
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: qrText.isNotEmpty
                      ? QrImageView(
                        backgroundColor: Colors.white,
  data: qrText,
  version: QrVersions.auto,
  size: 200.0,
)
                      : Text(
                          'Ingrese el texto para generar el QR',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                            ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
