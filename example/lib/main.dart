import 'package:flutter/material.dart';
import 'package:reorderableitemsview/reorderableitemsview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final List<StaggeredTileExtended> _listStaggeredTileExtended = [];

  @override
  void initState() {
    super.initState();
    _listStaggeredTileExtended.add(const StaggeredTileExtended.fit(2));
  }

  List<Widget> _tiles = <Widget>[
    _Example01Tile(Key("a"), Colors.green, Icons.widgets),
    _Example01Tile(Key("b"), Colors.lightBlue, Icons.wifi),
    _Example01Tile(Key("c"), Colors.amber, Icons.panorama_wide_angle),
    _Example01Tile(Key("d"), Colors.brown, Icons.map),
    _Example01Tile(Key("e"), Colors.deepOrange, Icons.send),
    _Example01Tile(Key("f"), Colors.indigo, Icons.airline_seat_flat),
    _Example01Tile(Key("g"), Colors.red, Icons.bluetooth),
    _Example01Tile(Key("h"), Colors.pink, Icons.battery_alert),
    _Example01Tile(Key("i"), Colors.purple, Icons.desktop_windows),
    _Example01Tile(Key("j"), Colors.blue, Icons.radio),
  ];

  @override
  Widget build(BuildContext context) {
    return ReorderableItemsView(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          _tiles.insert(newIndex, _tiles.removeAt(oldIndex));
        });
      },
      isGrid: true,
      staggeredTiles: _listStaggeredTileExtended,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      crossAxisCount: 4,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: _tiles,
    );
  }
}

class _Example01Tile extends StatelessWidget {
  _Example01Tile(Key key, this.backgroundColor, this.iconData)
      : super(key: key);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
