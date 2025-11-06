import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xFFE0F2F1),
            child: Icon(
              Icons.person,
              size: 60,
              color: Color(0xFF35796B),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Invité',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF35796B),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
              // Rafraîchir la page si l'utilisateur s'est connecté
              if (result == true && context.mounted) {
                // Mettre à jour l'interface si nécessaire
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Connexion réussie')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD3BBA3),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Se connecter',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
              // Rafraîchir la page si l'utilisateur s'est inscrit
              if (result == true && context.mounted) {
                // Mettre à jour l'interface si nécessaire
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Inscription réussie')),
                );
              }
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF35796B)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Créer un compte',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF35796B),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),
          _buildMenuItem(
            icon: Icons.info_outline,
            title: 'À propos de l\'application',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: 'Paramètres',
            onTap: () {
              // TODO: Naviguer vers les paramètres
            },
          ),
          _buildMenuItem(
            icon: Icons.help_outline,
            title: 'Aide & Support',
            onTap: () {
              // TODO: Naviguer vers l'aide
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF35796B)),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
