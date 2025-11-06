import 'package:flutter/material.dart';
import 'scanner_page.dart';
import 'about_page.dart';
import 'login_page.dart';
import 'register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF9),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/beautyscan_logo.png',
          height: 32,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF35796B)),
      ),
      drawer: _buildDrawer(context, 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Analysez vos cosmétiques en un scan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF35796B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Pointez votre caméra vers le code-barres de vos produits cosmétiques et obtenez instantanément une analyse détaillée de leur composition.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScannerPage()),
                      );
                    },
                    icon: const Icon(Icons.qr_code_scanner),
                    label: const Text("Scanner maintenant"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD3BBA3),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 20,
                    spacing: 16,
                    children: const [
                      FeatureCard(
                        icon: Icons.flash_on,
                        title: "Analyse instantanée",
                        description:
                            "Scannez le code-barres de vos produits et obtenez une analyse complète en quelques secondes.",
                      ),
                      FeatureCard(
                        icon: Icons.person_outline,
                        title: "Recommandations personnalisées",
                        description:
                            "Recevez des conseils adaptés à votre type de peau, âge et allergies spécifiques.",
                      ),
                      FeatureCard(
                        icon: Icons.edit_note,
                        title: "Routines beauté adaptées",
                        description:
                            "Créez des routines personnalisées avec des produits sûrs et efficaces pour votre peau.",
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "© 2025 BeautyScan — Tous droits réservés",
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, int selectedIndex) {
    final items = [
      {'label': 'Accueil', 'route': '/', 'icon': Icons.home},
      {'label': 'À propos', 'route': '/about', 'icon': Icons.info_outline},
      {'label': 'Scanner', 'route': '/scanner', 'icon': Icons.qr_code_scanner},
      {'label': 'Connexion', 'route': '/login', 'icon': Icons.login},
      {'label': 'Inscription', 'route': '/register', 'icon': Icons.person_add},
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF35796B),
            ),
            child: Center(
              child: Text(
                'BeautyScan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ...items.map((item) {
            return ListTile(
              leading: Icon(item['icon'] as IconData, color: const Color(0xFF35796B)),
              title: Text(
                item['label'] as String,
                style: const TextStyle(fontSize: 16),
              ),
              selected: selectedIndex == items.indexOf(item),
              selectedTileColor: const Color(0xFFE8F5E9),
              onTap: () {
                Navigator.pop(context); // Ferme le drawer
                Navigator.pushNamed(context, item['route'] as String);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: isMobile ? double.infinity : 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.brown.shade300),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
