import 'package:flutter/material.dart';

class ShrinkableFooterPage extends StatefulWidget {
  const ShrinkableFooterPage({Key? key}) : super(key: key);
  @override
  _ShrinkableFooterPageState createState() => _ShrinkableFooterPageState();
}

class _ShrinkableFooterPageState extends State<ShrinkableFooterPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        height: 60,
        color: Color(0xFFFEEAE6),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _IconTextItem(
                  deviceWidth: width,
                  icon: Icons.home,
                  title: "Home",
                ),
                _IconTextItem(
                  deviceWidth: width,
                  icon: Icons.star,
                  title: "Favorite",
                ),
                _IconTextItem(
                  deviceWidth: width,
                  icon: Icons.favorite,
                  title: "Like",
                ),
                _IconTextItem(
                  deviceWidth: width,
                  icon: Icons.settings,
                  title: "Menu",
                ),
              ],
            )));
  }
}

class _IconTextItem extends StatelessWidget {
  const _IconTextItem({
    Key? key,
    required this.deviceWidth,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final double deviceWidth;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.25 * (deviceWidth - 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xFF442C2E),
            size: 24,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
