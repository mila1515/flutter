import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../widgets/navbar.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String? barcodeValue;
  bool isScanning = true;

  void _onDetect(BarcodeCapture capture) {
    final Barcode? barcode = capture.barcodes.first;
    if (barcode == null || !isScanning) return;

    setState(() {
      barcodeValue = barcode.rawValue ?? "Code inconnu";
      isScanning = false;
    });

    // Affiche une popup avec le résultat
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Code-barres détecté"),
        content: Text(barcodeValue!),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => isScanning = true);
            },
            child: const Text("Scanner un autre"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF9),
      body: Column(
        children: [
          const NavBar(selectedIndex: 2),
          const SizedBox(height: 20),
          const Text(
            "Scanner un produit",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF35796B),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Placez le code-barres dans le cadre pour le lire automatiquement.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: MobileScanner(
                  fit: BoxFit.cover,
                  onDetect: _onDetect,
                ),
              ),
            ),
          ),
          if (barcodeValue != null)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Résultat : $barcodeValue",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.brown,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
