import 'package:flutter/material.dart';

/// Page d'information sur l'application

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFDF8F2),  // Beige très clair
                Color(0xFFF5EDE4),  // Beige clair
                Color(0xFFEDE4D8),  // Beige légèrement plus foncé
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1A000000),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.spa,
                      size: 50,
                      color: Color(0xFF8B7355),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    'BeautyScan',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A3F35),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8B7355),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                _buildSectionTitle('À propos'),
                const SizedBox(height: 16),
                _buildInfoCard(
                  'Notre mission est de vous aider à faire des choix éclairés sur vos produits cosmétiques en vous fournissant des analyses détaillées et des recommandations personnalisées.',
                  Icons.stars,
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Nos fonctionnalités'),
                const SizedBox(height: 16),
                _buildFeatureItem(
                  'Analyse des ingrédients',
                  'Évaluation complète basée sur les dernières recherches scientifiques',
                  Icons.analytics_outlined,
                ),
                _buildFeatureItem(
                  'Scan de produits',
                  'Scannez les codes-barres pour des informations instantanées',
                  Icons.qr_code_scanner_outlined,
                ),
                _buildFeatureItem(
                  'Recommandations',
                  'Suggestions personnalisées selon votre profil',
                  Icons.thumb_up_outlined,
                ),
                const SizedBox(height: 40),
                _buildSectionTitle('Contact'),
                const SizedBox(height: 16),
                _buildContactItem('Email', 'contact@beautyscan.app', Icons.email_outlined),
                _buildContactItem('Site web', 'www.beautyscan.app', Icons.language),
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    '© 2025 BeautyScan. Tous droits réservés.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8B7355),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Construit un titre de section avec un style cohérent
  static Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4A3F35),
      ),
    );
  }

  /// Construit une carte d'information avec une icône et du texte
  static Widget _buildInfoCard(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF8B7355)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Color(0xFF4A3F35),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Construit un élément de fonctionnalité avec une icône, un titre et une description
  static Widget _buildFeatureItem(String title, String subtitle, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFF5EDE4),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Icon(icon, color: const Color(0xFF8B7355), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF4A3F35),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8B7355),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Construit un élément de contact avec une icône, un label et une valeur
  static Widget _buildContactItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF8B7355), size: 20),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8B7355),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4A3F35),
                  height: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
