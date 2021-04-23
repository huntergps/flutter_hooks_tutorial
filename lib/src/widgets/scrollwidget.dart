import 'package:flutter/material.dart';

final _red = new GlobalKey();
final _blue = new GlobalKey();
final _yellow = new GlobalKey();
final _green = new GlobalKey();
final _orange = new GlobalKey();

class ScrollWidget extends StatefulWidget {
  static Widget create(BuildContext context) => ScrollWidget();

  @override
  _ScrollWidgetState createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void scrollTo(GlobalKey key) => Scrollable.ensureVisible(key.currentContext!, duration: Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height * .80;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create account'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () => scrollTo(_red),
                child: Text('Red'),
              ),
              OutlinedButton(
                onPressed: () => scrollTo(_blue),
                child: Text('Blue'),
              ),
              OutlinedButton(
                onPressed: () => scrollTo(_yellow),
                child: Text('Yellow'),
              ),
              OutlinedButton(
                onPressed: () => scrollTo(_green),
                child: Text('Green'),
              ),
              OutlinedButton(
                onPressed: () => scrollTo(_orange),
                child: Text('Orange'),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  Container(
                    key: _red,
                    height: containerHeight,
                    color: Colors.red,
                  ),
                  Container(
                    key: _blue,
                    height: containerHeight,
                    color: Colors.blue,
                  ),
                  Container(
                    key: _yellow,
                    height: containerHeight,
                    color: Colors.yellow,
                  ),
                  Container(
                    key: _green,
                    height: containerHeight,
                    color: Colors.green,
                  ),
                  Container(
                    key: _orange,
                    height: containerHeight,
                    color: Colors.orange,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
