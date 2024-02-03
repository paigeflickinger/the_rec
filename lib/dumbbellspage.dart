// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'buddiespage.dart';
import 'classespage.dart';
import 'informationpage.dart';
import 'profilepage.dart';
import 'sportspage.dart';
import 'welcomepage.dart';

class DumbbellsPage extends StatelessWidget {
  const DumbbellsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 60.0, 25.0, 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(
                      'images/PaigeProfilePic.png',
                    ),
                  ),
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Paige Flickinger',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InformationPage(),
                      ),
                    );
                  },
                  icon: Image.asset('images/InfoButton.png'),
                  iconSize: 50,
                ),
              ],
            ),
          ),
          const ListTile(
            title: Text('Dumbbells'),
            contentPadding: EdgeInsets.only(
              top: 6.0,
              bottom: 6.0,
              left: 12.0,
              right: 12.0,
            ),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            height: 0,
            thickness: 3,
            color: Colors.white,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  _showImagePopup(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('images/map.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[400],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              },
              icon: Image.asset('images/HomeIcon.png'),
              iconSize: 80,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BuddiesPage()),
                );
              },
              icon: Image.asset('images/BuddiesIcon.png'),
              iconSize: 80,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ClassesPage()),
                );
              },
              icon: Image.asset('images/ClassesIcon.png'),
              iconSize: 80,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SportsPage()),
                );
              },
              icon: Image.asset('images/SportsIcon.png'),
              iconSize: 80,
            ),
          ],
        ),
      ),
    );
  }

  void _showImagePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: double.maxFinite,
            child: Image.asset('images/dbpic.png'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
