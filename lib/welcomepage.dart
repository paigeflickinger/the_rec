// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'backworkoutspage.dart';
import 'buddiespage.dart';
import 'classespage.dart';
import 'informationpage.dart';
import 'profilepage.dart';
import 'sportspage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

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
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'What would you like to work on today?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
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
                  'Back',
                  'images/back.png',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BackWorkoutsPage()),
                  ),
                ),
                buildWorkoutButton(
                  'Shoulders',
                  'images/shoulders.png',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BackWorkoutsPage()),
                  ),
                ),
                buildWorkoutButton(
                  'Arms',
                  'images/arms.png',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BackWorkoutsPage()),
                  ),
                ),
                buildWorkoutButton(
                  'Cardio',
                  'images/cardio.png',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BackWorkoutsPage()),
                  ),
                ),
                buildWorkoutButton(
                  'Chest',
                  'images/chest.png',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BackWorkoutsPage()),
                  ),
                ),
                buildWorkoutButton(
                  'Legs',
                  'images/legs.png',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BackWorkoutsPage()),
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
