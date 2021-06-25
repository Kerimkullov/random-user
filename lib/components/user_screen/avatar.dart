import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: CircleAvatar(
        child: Image.network("https://img.icons8.com/bubbles/2x/user-male.png"),
      ),
    );
  }
}
