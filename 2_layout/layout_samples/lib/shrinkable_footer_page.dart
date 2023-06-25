import 'package:flutter/material.dart';

class ShrinkableFooterPage extends StatefulWidget {
  const ShrinkableFooterPage({Key? key}) : super(key: key);
  @override
  _ShrinkableFooterPageState createState() => _ShrinkableFooterPageState();
}

class _ShrinkableFooterPageState extends State<ShrinkableFooterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 50),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: Color(0xFFFEEAE6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 70,
                ),
                Text(
                  'スクロールに応じて\nButtonNavigationBarが\n縮みます。',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF442C2E),
                      height: 1.2),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.network(
              'https://images.unsplash.com/photo-1528164344705-47542687000d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1369&q=80'),
          const SizedBox(height: 20.0),
          Image.network(
              'https://images.unsplash.com/photo-1532236204992-f5e85c024202?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1372&q=80'),
          const SizedBox(height: 20.0),
          Image.network(
              'https://images.unsplash.com/photo-1493479874819-4303c36fa0f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'),
          const SizedBox(height: 20.0),
          Image.network(
              'https://images.unsplash.com/photo-1463319611694-4bf9eb5a6e72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'),
          const SizedBox(height: 20.0),
          Image.network(
              'https://images.unsplash.com/photo-1469998265221-245c7148df5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80'),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
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
