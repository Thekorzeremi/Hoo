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
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
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
  DateTime? selectedDate;

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
                  TextButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                        initialDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    child: Text(
                      'Choisir date',
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text(
                    selectedDate?.toString() ?? 'Aucune date sélectionnée',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width) / 2,
              padding: EdgeInsets.fromLTRB(4.0, 14.0, 16.0, 4.0),

              child: Column(
                spacing: 10,
                children: [
                  Text('Nombre de chambres', style: TextStyle(fontSize: 10)),
                  Text('1 chambre - 2 adultes', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              width: (MediaQuery.of(context).size.width),
              height: 300,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 34,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Hotel 4* Bali',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.asset(
                            'assets/hotel1.jpg',
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 25,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Chambre - 2 adultes',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 25,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'A partir du 30/05/2025',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '1162€ pour 7 nuits',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              width: (MediaQuery.of(context).size.width),
              height: 300,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 34,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Hotel 4* Bali',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.asset(
                            'assets/hotel1.jpg',
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 25,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Chambre - 2 adultes',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 25,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'A partir du 30/05/2025',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '1162€ pour 7 nuits',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Text(
            'Mes réservations',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          width: (MediaQuery.of(context).size.width),
          height: 300,
          child: Card(
            child: Column(
              children: [
                SizedBox(
                  height: 34,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hotel 4* Bali',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        'assets/hotel1.jpg',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Chambre - 2 adultes',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 25,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Du 30/05/2025 au 06/06/2025',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Confirmé',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
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
    return const Text("Mon profil");
  }
}
