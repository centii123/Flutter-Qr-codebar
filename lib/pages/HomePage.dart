import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List options = [
    {
      'title': 'Jisoo quiere escanear Codigo QR',
      'route': '/qr_scan',
      'icon': Icons.qr_code_scanner,
    },
    {
      'title': 'Jisoo quiere escanear codigo de barras',
      'route': '/barcode_scan',
      'icon': Icons.document_scanner,
    },
    {
      'title': 'Jisoo quiere generar codigo QR',
      'route': '/qr_generator',
      'icon': Icons.qr_code,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'JISOO SCAN',
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
            Text(
              'BIENVENIDO/A',
              style: TextStyle(color: Colors.purple, fontSize: 24),
            ),
            SizedBox(height: 25),
            CircleAvatar(
              maxRadius: 100,
              backgroundImage: AssetImage("assets/jisoo.jpg"),
            ),
            SizedBox(height: 10),
            Text("¿Que ara Jisoo el dia de hoy?",
                style: TextStyle(color: Colors.purple, fontSize: 18)),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.purple,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, options[index]['route']);
                    },
                    leading: Icon(options[index]['icon'], color: Colors.white),
                    title: Text(
                      options[index]['title'],
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
