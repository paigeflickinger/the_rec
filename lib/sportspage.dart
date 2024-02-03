// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'buddiespage.dart';
import 'classespage.dart';
import 'informationpage.dart';
import 'profilepage.dart';
import 'welcomepage.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({Key? key});

  void _showTextDialog(
      BuildContext context, String buttonText, String textToShow) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(buttonText),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: textToShow.split('\n').map((text) {
              if (text.toLowerCase().contains('registration:')) {
                return RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: 'Registration: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: text.split('Registration:')[1]),
                    ],
                  ),
                );
              } else if (text.toLowerCase().contains('gameplay:')) {
                return RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: 'GamePlay: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: text.split('GamePlay:')[1]),
                    ],
                  ),
                );
              } else if (text.toLowerCase().contains('location:')) {
                return RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: 'Location: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: text.split('Location:')[1]),
                    ],
                  ),
                );
              } else {
                return Text(
                  text,
                  style: const TextStyle(fontSize: 16.0),
                );
              }
            }).toList(),
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
      body: SingleChildScrollView(
        child: Column(
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
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Sports',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              height: 0,
              thickness: 3,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  _buildSportsItem(
                    context,
                    'Esports',
                    'images/esports.png',
                    'Registration: Sept 18 - Oct 12\nGamePlay: Oct 19\nLocation: E Sports Room',
                  ),
                  const SizedBox(height: 25),
                  _buildSportsItem(
                    context,
                    'Football',
                    'images/football.png',
                    'Registration: Sept 22 - Oct 15\nGamePlay: Oct 25\nLocation: Stadium',
                  ),
                  const SizedBox(height: 25),
                  _buildSportsItem(
                    context,
                    'Baseball',
                    'images/baseball.png',
                    'Registration: Sept 22 - Oct 15\nGamePlay: Oct 25\nLocation: Stadium',
                  ),
                  const SizedBox(height: 25),
                  _buildSportsItem(
                    context,
                    'Basketball',
                    'images/basketball.png',
                    'Registration: Sept 22 - Oct 15\nGamePlay: Oct 25\nLocation: Stadium',
                  ),
                  const SizedBox(height: 25),
                  _buildSportsItem(
                    context,
                    'PickleBall',
                    'images/pickleball.png',
                    'Registration: Sept 22 - Oct 15\nGamePlay: Oct 25\nLocation: Stadium',
                  ),
                  const SizedBox(height: 25),
                  _buildSportsItem(
                    context,
                    'Soccer',
                    'images/soccer.png',
                    'Registration: Sept 22 - Oct 15\nGamePlay: Oct 25\nLocation: Stadium',
                  ),
                  const SizedBox(height: 25),
                  // Add more sports items here
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[400],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIconButton('images/HomeIcon.png', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WelcomePage()),
              );
            }),
            _buildIconButton('images/BuddiesIcon.png', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BuddiesPage()),
              );
            }),
            _buildIconButton('images/ClassesIcon.png', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClassesPage()),
              );
            }),
            _buildIconButton('images/SportsIcon.png', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SportsPage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSportsItem(BuildContext context, String title, String imagePath,
      String description) {
    return GestureDetector(
      onTap: () {
        _showTextDialog(context, title, description);
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFB29441),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
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
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(String imagePath, Function() onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(imagePath),
      iconSize: 80,
    );
  }
}
