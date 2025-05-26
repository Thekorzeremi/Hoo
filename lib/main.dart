import 'package:flutter/material.dart';

void main() => runApp(const HooApp());

class HooApp extends StatelessWidget {
  const HooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationBar(),
    );
  }
}

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),

      child: SearchBar(
        hintText: 'Rechercher...',
        leading: const Icon(Icons.search),
      ),
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ExploreTab(),
    BookingTab(),
    ProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explorer'),
          BottomNavigationBarItem(
            icon: Icon(Icons.hotel),
            label: 'Mes réservations',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Mon profil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan[400],
        onTap: _onItemTapped,
      ),
    );
  }
}

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Expanded(child: SearchBarApp())],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width) / 2,
              padding: EdgeInsets.fromLTRB(16.0, 4.0, 4.0, 4.0),
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.grey)),
              ),
              child: Column(
                children: [
                  Text(
                    'Choisir date',
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '26/05/2025',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width) / 2,
              padding: EdgeInsets.fromLTRB(4.0, 4.0, 16.0, 4.0),
              child: Column(
                children: [
                  Text('Nombre de chambres', style: TextStyle(fontSize: 10)),
                  Text('1 chambre - 2 adultes', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BookingTab extends StatefulWidget {
  const BookingTab({super.key});

  @override
  State<BookingTab> createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab> {
  @override
  Widget build(BuildContext context) {
    return const Text("Mes réservations");
  }
}

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          // Profile picture and name
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.cyan[400],
            child: const Icon(Icons.person, size: 56, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const Text(
            "Mon profil",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Nom d'utilisateur",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          // Profile info card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Statut: Voyageur", style: TextStyle(fontSize: 16)),
                    Icon(Icons.verified, color: Colors.cyan),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Action buttons card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _ProfileActionButton(
                    icon: Icons.settings,
                    label: 'Paramètres du compte',
                    onTap: () {},
                  ),
                  _ProfileActionButton(
                    icon: Icons.help,
                    label: 'Obtenir de l\'aide',
                    onTap: () {},
                  ),
                  _ProfileActionButton(
                    icon: Icons.face,
                    label: 'Voir lf profil',
                    onTap: () {},
                  ),
                  _ProfileActionButton(
                    icon: Icons.privacy_tip,
                    label: 'Confidentialité',
                    onTap: () {},
                  ),
                  const Divider(),
                  _ProfileActionButton(
                    icon: Icons.handshake,
                    label: 'Parrainer un hôte',
                    onTap: () {},
                  ),
                  _ProfileActionButton(
                    icon: Icons.people_alt,
                    label: 'Trouver un co-hôte',
                    onTap: () {},
                  ),
                  _ProfileActionButton(
                    icon: Icons.policy,
                    label: 'Juridique',
                    onTap: () {},
                  ),
                  _ProfileActionButton(
                    icon: Icons.logout,
                    label: 'Déconnexion',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _ProfileActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ProfileActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label, style: TextStyle(color: Colors.black)),
      onTap: onTap,
      dense: true,
      horizontalTitleGap: 8,
    );
  }
}
