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
        itemBuilder: (context, index) => Container(
            color: Color((math.Random(index).)),
            child: Center(
              child: Text(
                index.toString(),
                style: const TextStyle(fontSize: 42, color: Colors.white),
              ),
            )),
      ),
    );
  }
}
