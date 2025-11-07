import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'scanner_page.dart';
import 'about_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'profile_page.dart';
import '../widgets/navbar.dart';

/// Page d'accueil principale de l'application

class HomePage extends StatefulWidget {
  /// Crée une instance de la page d'accueil
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Contrôleur pour la navigation entre les pages
  final PageController _pageController = PageController();
  
  /// Index de l'onglet actif
  int _selectedIndex = 0;

  /// Gère le changement d'onglet
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('BeautyScan', style: TextStyle(color: Color(0xFF4A3F35), fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          // Page Accueil
          SingleChildScrollView(
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
                      const SizedBox(height: 40),
                      const SizedBox(height: 40),
                      Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 20,
                        spacing: 16,
                        children: const [
                          FeatureCard(
                            icon: Icons.flash_on,
                            title: "Analyse instantanée",
                            description: "Analyse complète en quelques secondes",
                          ),
                          FeatureCard(
                            icon: Icons.person_outline,
                            title: "Recommandations personnalisées",
                            description: "Conseils personnalisés",
                          ),
                          FeatureCard(
                            icon: Icons.edit_note,
                            title: "Routines beauté adaptées",
                            description: "Routines personnalisées",
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "© 2025 BeautyScan — Tous droits réservés",
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Page Scanner
          const ScannerPage(),
          // Page Profil
          const ProfilePage(),
        ],
      ),
        bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: NavBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        ),
      ),
    ));
  }
}

/// Carte représentant une fonctionnalité de l'application
class FeatureCard extends StatelessWidget {
  /// Icône représentative de la fonctionnalité
  final IconData icon;
  
  /// Titre de la fonctionnalité
  final String title;
  
  /// Description de la fonctionnalité
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
              color: Color(0xFF4A3F35),
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
