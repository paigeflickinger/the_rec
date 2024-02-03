// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'buddiespage.dart';
import 'classespage.dart';
import 'profilepage.dart';
import 'sportspage.dart';
import 'welcomepage.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key});

  void _showTextDialog(
      BuildContext context, String buttonText, String textToShow) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(buttonText),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: textToShow.split('\n').map((text) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

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
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
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
            title: Text('Information'),
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
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                _buildInfoItem(
                  context,
                  'Address',
                  'images/address.png',
                  '102 Student Recreation Center, Baton Rouge, LA 70803',
                ),
                const SizedBox(height: 60),
                _buildInfoItem(
                  context,
                  'Hours of Operation',
                  'images/hours.png',
                  'Monday - Thursday: 5:45am - 12:00am\nFriday: 5:45am - 10:00pm\nSaturday: 9:00am - 9:00pm\nSunday: 9:00am - 12:00am',
                ),
                const SizedBox(height: 60),
                _buildInfoItem(
                  context,
                  'Help Desks',
                  'images/phone.png',
                  'Operations: (225)578-8601\nEquipment: (225)578-8364',
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

  Widget _buildInfoItem(BuildContext context, String title, String imagePath,
      String description) {
    return GestureDetector(
      onTap: () {
        _showTextDialog(
          context,
          title,
          description,
        );
      },
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
