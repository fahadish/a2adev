import 'package:flutter/material.dart';
import '../../const/image_or_icon_path.dart';

class BackgroundColored extends StatelessWidget {
  final Widget? child;
  const BackgroundColored({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("$imagePath/background1.png"), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}

class BackgroundWhite extends StatelessWidget {
  final Widget child;
  const BackgroundWhite({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("$imagePath/background2.png"), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
