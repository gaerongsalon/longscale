import 'package:flutter/material.dart';

import '../model/profile.dart';

class SubProfileCard extends StatelessWidget {
  const SubProfileCard({
    Key key,
    @required this.profile,
    @required this.title,
  }) : super(key: key);

  final Profile profile;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 8.0, right: 8.0, top: 16.0 + 8.0, bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildProfileImage(),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(title, style: TextStyle(fontSize: 18.0)),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      child: ClipOval(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset('assets/images/avatar.png', width: 32),
      )),
      radius: 24,
    );
  }
}
