import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> with AutomaticKeepAliveClientMixin {
  String? barcodeValue;
  bool isScanning = true;
  MobileScannerController controller = MobileScannerController();

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.firstOrNull;
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
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Placez le code-barres dans le cadre pour le lire automatiquement.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: MobileScanner(
                  controller: controller,
                  fit: BoxFit.cover,
                  onDetect: _onDetect,
                ),
              ),
            ),
          ),
          if (barcodeValue != null) ...[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Résultat : $barcodeValue",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.brown,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
