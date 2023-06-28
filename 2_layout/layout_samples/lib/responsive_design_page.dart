import 'package:flutter/material.dart';

class ResponsiveDesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        title: Text(
          'さまざまなデバイスに対応する',
          style: TextStyle(
            fontSize: 15 * (height + width) / (926 + 438),
          ),
        ),
      ),
      body: _Body(
        width: width,
        height: height,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final isPortrait = height > width;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 650),
        child: Column(children: <Widget>[
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Flutter is Google's UI tooklit for building beautiful, natively compiled",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15 * (height + width) / (926 + 438),
                  height: 1.85,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          isPortrait
              ? FlutterLogo(
                  size: this.height * 0.3,
                )
              : SizedBox(),
          isPortrait ? Spacer() : SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Fast Development Paint your app to life in milliseconds with Stateful Hot Reload. Use a rich set of ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15 * (height + width) / (926 + 438),
                height: 1.85,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                  primary: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'get started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15 * (height + width) / (926 + 438),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
        ]),
      ),
    );
  }
}
