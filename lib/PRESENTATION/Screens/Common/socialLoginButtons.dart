import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginBtn extends StatelessWidget {
  final Color btnColor;
  final IconData icon;
  final Color iconColor;
  final Function onPressed;

  SocialLoginBtn({
    this.btnColor,
    @required this.icon,
    this.iconColor,
    @required this.onPressed,
    createSocialLoginBtn(),
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: FaIcon(
        icon,
        color: iconColor,
      ),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 42,
        height: 42,
      ),
      shape: CircleBorder(),
      fillColor: btnColor,
    );
  }
}
