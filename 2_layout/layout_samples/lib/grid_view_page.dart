import 'package:flutter/material.dart';
import 'dart:math' as math;

class GridViewPage extends StatefulWidget {
  const GridViewPage({
    Key? key,
  }) : super(key: key);
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  static const _minColumnsCount = 2;
  static const _maxColumnsCount = 8;
  int _columnsCount = 4;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${_scrollController.hasClients ? _scrollController.position.pixels.toInt().toString() : 0} pixels')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () {
                if (_columnsCount < _maxColumnsCount) {
                  setState(() {
                    _columnsCount++;
                  });
                }
              },
              child: const Icon(Icons.grid_on, color: Colors.white)),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
              onPressed: () {
                if (_columnsCount > _minColumnsCount) {
                  setState(() {
                    _columnsCount--;
                  });
                }
              },
              child: const Icon(Icons.grid_off, color: Colors.white)),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            onPressed: () {
              _scrollController.animateTo(
                  _scrollController.position.minScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInQuint);
            },
            child: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _columnsCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          final gridItemColor =
              Color((math.Random(index).nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0);
          final textColor = gridItemColor.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white;
          return Stack(
            children: [
              Container(
                  color: gridItemColor,
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: TextStyle(fontSize: 42, color: textColor),
                    ),
                  )),
              Positioned(
                  right: 10,
                  bottom: 10,
                  child: Text(
                    gridItemColor
                        .toString()
                        .toUpperCase()
                        .substring(6, 16)
                        .replaceAll('0X', '#'),
                    style: TextStyle(fontSize: 18, color: textColor),
                  ))
            ],
          );
        },
      ),
    );
  }
}
