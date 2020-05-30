import 'package:flutter/material.dart';

import '../model/profile.dart';
import '../shared/format.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key key,
    @required this.profile,
  }) : super(key: key);

  final Profile profile;

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
            child: _buildStatSheet(),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      child: Image.asset('assets/images/avatar.png', width: 100),
      radius: 70,
    );
  }

  Widget _buildStatSheet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(profile.name, style: TextStyle(fontSize: 24.0)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text('🧡 ' + formatDateFromString(profile.birthDate),
              style: TextStyle(color: Colors.black87)),
        ),
        Text(formatAge(profile.birthDate),
            style: TextStyle(fontSize: 12.0, color: Colors.black87)),
      ],
    );
  }
}
