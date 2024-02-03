// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, constant_identifier_names

import 'package:flutter/material.dart';

import 'buddiespage.dart';
import 'classespage.dart';
import 'sportspage.dart';
import 'welcomepage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

enum SkillLevel { Beginner, Intermediate, Advanced }

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 220;
  final double profileHeight = 120;
  double _currentWeight = 130;
  double _currentHeight = 66;
  SkillLevel _currentSkillLevel = SkillLevel.Intermediate;
  bool _goal1Checked = false;
  bool _goal2Checked = false;
  bool _goal3Checked = false;
  // Define other variables for height, skill level, and goal checkboxes...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        )
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        width: double.infinity,
        height: coverHeight,
        child: Image.asset(
          'images/urec-facility-front.webp',
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey,
        backgroundImage: const AssetImage('images/PaigeProfilePic.png'),
      );

  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildWeightSliderSection(
          title: 'Weight:',
          value: _currentWeight,
          min: 50,
          max: 300,
          divisions: 250,
          onChanged: (double value) {
            setState(() {
              _currentWeight = value;
            });
          },
        ),
        buildHeightSliderSection(
          title: 'Height:',
          value: _currentHeight,
          min: 48,
          max: 84,
          divisions: 36,
          onChanged: (double value) {
            setState(() {
              _currentHeight = value;
            });
          },
        ),
        buildSkillSliderSection(
          title: 'Skill Level:',
          value: _currentSkillLevel.index.toDouble(),
          min: SkillLevel.Beginner.index.toDouble(),
          max: SkillLevel.Advanced.index.toDouble(),
          divisions: SkillLevel.values.length - 1,
          onChanged: (double value) {
            setState(() {
              _currentSkillLevel = SkillLevel.values[value.toInt()];
            });
          },
          displayValue: _getSkillLevelString(_currentSkillLevel),
        ),
        buildCheckboxSection(),
      ],
    );
  }

  Widget buildWeightSliderSection({
    required String title,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required ValueChanged<double> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '$value lbs',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
            activeColor: const Color(0xFFB29441),
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget buildHeightSliderSection({
    required String title,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required ValueChanged<double> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                _formatHeight(value),
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
            activeColor: const Color(0xFFB29441),
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  String _formatHeight(double heightInches) {
    int feet = (heightInches / 12).floor();
    int inches = (heightInches % 12).toInt();
    return '$feet\'$inches"';
  }

  String _getSkillLevelString(SkillLevel skillLevel) {
    switch (skillLevel) {
      case SkillLevel.Beginner:
        return 'Beginner';
      case SkillLevel.Intermediate:
        return 'Intermediate';
      case SkillLevel.Advanced:
        return 'Advanced';
      default:
        return 'Beginner';
    }
  }

  Widget buildSkillSliderSection({
    required String title,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required ValueChanged<double> onChanged,
    required String displayValue,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                displayValue,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
            activeColor: const Color(0xFFB29441),
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget buildCheckboxSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current Goal:',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCustomCheckbox(
                checked: _goal1Checked,
                onTap: () {
                  setState(() {
                    _goal1Checked = !_goal1Checked;
                  });
                },
                image: 'images/buildmuscle.png',
              ),
              buildCustomCheckbox(
                checked: _goal2Checked,
                onTap: () {
                  setState(() {
                    _goal2Checked = !_goal2Checked;
                  });
                },
                image: 'images/loseweight.png',
              ),
              buildCustomCheckbox(
                checked: _goal3Checked,
                onTap: () {
                  setState(() {
                    _goal3Checked = !_goal3Checked;
                  });
                },
                image: 'images/generalfitness.png',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCustomCheckbox({
    required bool checked,
    required VoidCallback onTap,
    required String image,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(
                color: checked ? const Color(0xFFB29441) : Colors.transparent,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              image,
              width: 50,
              height: 50,
              color: checked ? const Color(0xFFB29441) : Colors.white,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildBottomAppBar() {
    return BottomAppBar(
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
    );
  }

  Widget buildIconButton({
    required VoidCallback onPressed,
    required String iconImage,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(iconImage),
      iconSize: 80,
    );
  }
}
