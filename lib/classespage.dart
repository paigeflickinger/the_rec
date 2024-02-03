// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'buddiespage.dart';
import 'informationpage.dart';
import 'profilepage.dart';
import 'sportspage.dart';
import 'welcomepage.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({Key? key});

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
            title: Text('Classes'),
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
            indent: 0,
            endIndent: 0,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          // Classes page content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildClassItem(
                  image: 'images/yoga.jpg',
                  title: 'Yoga',
                  time: '7:00 am',
                  instructor: 'Tammy',
                ),
                const SizedBox(height: 20),
                _buildClassItem(
                  image: 'images/cycle.webp',
                  title: 'Cycle',
                  time: '8:30 am',
                  instructor: 'Alex',
                ),
              ],
            ),
          ),
        ],
      ),
      //Bottom App Bar
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

  Widget _buildClassItem({
    required String image,
    required String title,
    required String time,
    required String instructor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Time: $time',
                        style: const TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Instructor: $instructor',
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
