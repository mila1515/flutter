import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  const NavBar({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': 'Accueil', 'route': '/'},
      {'label': 'À propos', 'route': '/about'},
      {'label': 'Scanner', 'route': '/scanner'},
      {'label': 'Connexion', 'route': '/login'},
      {'label': 'Inscription', 'route': '/register'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // --- Logo + nom ---
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/'),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/beautyscan_logo.png',
                  height: 32,
                ),
                const SizedBox(width: 8),
                // const Text(
                //   "BeautyScan",
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //     color: Color(0xFF35796B),),
                //   ),
                // ),
              ],
            ),
          ),

          // --- Menu navigation ---
          Row(
            children: items.asMap().entries.map((entry) {
              final i = entry.key;
              final item = entry.value;
              final isSelected = i == selectedIndex;

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, item['route']!);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    item['label']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? const Color(0xFF35796B)
                          : Colors.black87,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
