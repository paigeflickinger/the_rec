// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:the_rec/dumbbellspage.dart';
import 'buddiespage.dart';
import 'classespage.dart';
import 'informationpage.dart';
import 'profilepage.dart';
import 'sportspage.dart';
import 'welcomepage.dart';

class BackWorkoutsPage extends StatelessWidget {
  const BackWorkoutsPage({Key? key});

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
                    backgroundImage: AssetImage('images/PaigeProfilePic.png'),
                  ),
                ),
                const Text(
                  'Paige Flickinger',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InformationPage()),
                    );
                  },
                  icon: Image.asset('images/InfoButton.png'),
                  iconSize: 50,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Back Machines',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                buildWorkoutButton(
                  'Cable Column',
                  'images/cableColumn.png',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DumbbellsPage()),
                  ),
                ),
                buildWorkoutButton(
                  'dumbbells',
                  'images/dumbbells.png',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DumbbellsPage()),
                  ),
                ),
                buildWorkoutButton(
                  'Lat Pulldown',
                  'images/latPulldown.png',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DumbbellsPage()),
                  ),
                ),
                buildWorkoutButton(
                  'Pec Machine',
                  'images/pecMachine.png',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DumbbellsPage()),
                  ),
                ),
                buildWorkoutButton(
                  'Power Rack',
                  'images/powerRack.png',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DumbbellsPage()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[400],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarButton(
                context, 'Home', 'images/HomeIcon.png', const WelcomePage()),
            buildNavBarButton(context, 'Buddies', 'images/BuddiesIcon.png',
                const BuddiesPage()),
            buildNavBarButton(context, 'Classes', 'images/ClassesIcon.png',
                const ClassesPage()),
            buildNavBarButton(
                context, 'Sports', 'images/SportsIcon.png', const SportsPage()),
          ],
        ),
      ),
    );
  }

  Widget buildWorkoutButton(
      String label, String imagePath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 150,
              height: 150,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarButton(BuildContext context, String label, String imagePath,
      StatelessWidget page) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      icon: Image.asset(imagePath),
      iconSize: 80,
      tooltip: label,
    );
  }
}
