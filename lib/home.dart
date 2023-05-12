import 'package:app/calendar.dart';
import 'package:app/carousel.dart';
import 'package:app/shimmer_test.dart';
import 'package:flutter/material.dart';

class ScrollControllerWidget extends StatefulWidget {
  ScrollControllerWidget({super.key});

  @override
  State<ScrollControllerWidget> createState() => _ScrollControllerWidgetState();
}

class _ScrollControllerWidgetState extends State<ScrollControllerWidget> {
  final ScrollController _controller = ScrollController();

  double _height = 300;

  String _imagepath =
      'https://upload.wikimedia.org/wikipedia/commons/a/ad/Football_in_Bloomington%2C_Indiana%2C_1996.jpg';
  BoxFit _boxFit = BoxFit.cover;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_controllerListener);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.green, actions: []),
          body: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EventCalendar()));
                    },
                    child: const Text('Calendar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShimmerAnimation()));
                    },
                    child: const Text('Shimmer'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const carouselSlide()));
                    },
                    child: const Text('Carousel'),
                  ),
                ],
              ),
              Container(
                  height: _height,
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_imagepath),
                        fit: _boxFit,
                      ),
                    ),
                  )),
              Expanded(
                child: ListView.builder(
                  controller: _controller,
                  itemCount: 11,
                  itemBuilder: (context, index) {
                    return _buildListItem(index);
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: _buildFAB(),
        ),
      ),
    );
  }

  _buildFAB() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          heroTag: Null,
          onPressed: () {
            double startpos = 0;
            _controller.position.animateTo(startpos,
                duration: Duration(seconds: 2), curve: Curves.easeInCirc);
          },
          child: const Icon(Icons.arrow_upward),
        ),
        FloatingActionButton(
          heroTag: Null,
          onPressed: () {
            double endpos = _controller.position.maxScrollExtent;
            _controller.position.animateTo(endpos,
                duration: Duration(seconds: 2), curve: Curves.easeInCirc);
          },
          child: const Icon(Icons.arrow_downward),
        ),
      ],
    );
  }

  void _controllerListener() {
    bool isatTop = _controller.offset <= 0;
    bool isatMiddle =
        _controller.position.pixels >= _controller.position.maxScrollExtent / 2;
    isatTop
        ? setState(() {
            _height = 300;
            _imagepath =
                "https://upload.wikimedia.org/wikipedia/commons/a/ad/Football_in_Bloomington%2C_Indiana%2C_1996.jpg";
          })
        : isatMiddle
            ? setState(() {
                _height = 100;
                _imagepath =
                    "https://upload.wikimedia.org/wikipedia/commons/d/da/Shunsuke1_20080622.jpg";
              })
            : setState(() {
                _height = 200;

                _imagepath =
                    "https://upload.wikimedia.org/wikipedia/commons/a/ad/Football_in_Bloomington%2C_Indiana%2C_1996.jpg";
              });
  }
}

// Widget _buildListItem(int index) {
//   return Column(
//     children: [
//       Container(
//         color: Colors.red,
//         height: 300,
//       ),
//       Container(
//         color: Colors.blue,
//         height: 300,
//       ),
//       Container(
//         color: Colors.green,
//         height: 300,
//       ),
//       Container(
//         color: Colors.amber,
//         height: 300,
//       ),
//     ],
//   );
// }

Widget _buildListItem(int index) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(color: Colors.lightGreen),
    height: 100,
    child: Center(
      child: Text(
        'Item $index',
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
