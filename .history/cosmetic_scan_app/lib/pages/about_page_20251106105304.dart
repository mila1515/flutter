import 'package:flutter/material.dart';
import '../widgets/navbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(
              selectedIndex: 1,
              onItemTapped: (index) {
                if (index != 1) {
                  Navigator.pushNamed(context, index == 0 ? '/' : '/profile');
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: const [
                  Text(
                    "À propos de nous",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF35796B),
                    ),
                  ),
                  SizedBox(height: 30),
                  FeatureCard(
                    icon: Icons.brightness_high,
                    title: "Notre Mission",
                    description:
                        "Révolutionner l'industrie cosmétique en donnant aux consommateurs le pouvoir de faire des choix éclairés grâce à l’intelligence artificielle et la transparence des ingrédients.",
                  ),
                  SizedBox(height: 20),
                  FeatureCard(
                    icon: Icons.shield,
                    title: "Analyse de Sécurité",
                    // description:
                    //     "Évaluation complète des ingrédients cosmétiques basée sur les H-codes et données toxicologiques.",
                  ),
                  FeatureCard(
                    icon: Icons.smart_toy,
                    title: "Assistant IA",
                    // description:
                    //     "Conseils personnalisés et recommandations adaptées à votre profil et vos besoins.",
                  ),
                  FeatureCard(
                    icon: Icons.qr_code_2,
                    title: "Scan Facile",
                    // description:
                    //     "Analysez vos produits en un scan ou une saisie manuelle.",
                  ),
                ],
              ),
            ),
          ],
        ),
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
