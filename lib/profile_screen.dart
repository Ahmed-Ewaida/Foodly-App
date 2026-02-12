import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileImgAndName(),
              DataWidget(),
              DescriptionWidget(),
              ViewProfileButton(),
            ],

        ),
      ),
    );
  }
}

class ViewProfileButton extends StatelessWidget {
  const ViewProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 320,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Center(
        child: Text("View Profile", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "A Flutter developer focused on building scalable, high-performance mobile applications with clean architecture and modern UI. Experienced in developing cross-platform solutions for Android and iOS with attention to usability and maintainable code.",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              'assets/behance-round-icon.svg',
              width: 24,
              height: 24,
            ),
            SvgPicture.asset(
              'assets/alphabet-g-icon.svg',
              width: 24,
              height: 24,
            ),
            SvgPicture.asset(
              'assets/facebook-round-color-icon.svg',
              width: 24,
              height: 24,
            ),
            SvgPicture.asset(
              'assets/twitter-color-icon.svg',
              width: 24,
              height: 24,
            ),
          ],
        ),
      ],
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Projects",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "17",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Following",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "159",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Followers",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "205",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileImgAndName extends StatelessWidget {
  const ProfileImgAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 60,
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xFF64C288),
                child: Icon(Icons.check, color: Colors.white, size: 15),
              ),
            ),
          ],
        ),

        SizedBox(height: 32),
        Text(
          "Ahmed Ewaida ",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 12),
        Text(
          "Flutter Developer",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}