// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:timelines/timelines.dart';

enum StatusEnum {
  planningMove(color: Colors.orange, text: 'Plan your move'),
  addingInventory(color: Colors.orange, text: 'Add your Inventory'),
  enterInfo(color: Colors.white, text: 'Enter your floor Info'),
  moveSummary(color: Colors.white, text: 'Your move Summary');

  final String text;
  final Color color;

  const StatusEnum({required this.text, required this.color});
}

class StatusBar extends StatefulWidget {
  const StatusBar({super.key});

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  int currentIndex = 1;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 40,
            margin: EdgeInsets.only(left: currentIndex == 0 ? 25 : currentIndex == 1 ? 125 : currentIndex == 2 ? 225 : 325),
            child: const Image(
              image: AssetImage('assets/truck.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          Timeline.tileBuilder(
            theme: TimelineThemeData(
              direction: Axis.horizontal,
              connectorTheme: const ConnectorThemeData(space: 30, thickness: 5),
              indicatorTheme: const IndicatorThemeData(size: 20),
            ),
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.before,
              itemCount: 4,
              itemExtentBuilder: (context, index) => 100,
              indicatorBuilder: (context, index) {
                return DotIndicator(
                  color: index <= currentIndex
                      ? Colors.orange.shade800
                      : Colors.white,
                  border: Border.all(
                      color: Colors.black,
                      width: index<=currentIndex ? 0 : 1),
                  child: Icon(
                    Icons.circle,
                    color: Colors.orange.shade800,
                    size: 10,
                  ),
                );
              },
              connectorBuilder: (context, index, type) {
                return Container(
                  height: 5,
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                          color: Colors.black,
                          width: index <= currentIndex ? 0 : 1),
                    ),
                  ),
                  child: SolidLineConnector(
                    color: index <= currentIndex
                        ? Colors.orange.shade800
                        : Colors.white,
                  ),
                );
              },
              contentsBuilder: (context, index) {
                var text = '';
                if (index == 0) {
                  text = 'Plan your move';
                } else if (index == 1) {
                  text = 'Add your Inventory';
                } else if (index == 2) {
                  text = 'Enter your floor Info';
                } else if (index == 3) {
                  text = 'Your move Summary';
                }
                return Container(
                  width: 80,
                  height: 50,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class TimeLine extends StatelessWidget {
//   const TimeLine(
//       {super.key,
//       required this.isFirst,
//       required this.isLast,
//       required this.isPast,
//       required this.text});

//   final bool isFirst;
//   final bool isLast;
//   final bool isPast;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return TimelineTile(
//       axis: TimelineAxis.horizontal,
//       isFirst: isFirst,
//       isLast: isLast,
//       afterLineStyle: LineStyle(color: Colors.white,),
//       beforeLineStyle: LineStyle(color: Colors.white),
//       indicatorStyle: IndicatorStyle(color: Colors.white, ),
//       alignment: TimelineAlign.center,
//       endChild: Container(
//         height: 20,
//         width: 70,
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }



// const Row(
//         children: [
//           TimeLine(
//               isFirst: true,
//               isLast: false,
//               isPast: true,
//               text: 'Plan your move'),
//           TimeLine(
//               isFirst: false,
//               isLast: false,
//               isPast: true,
//               text: 'Add your Inventory'),
//           TimeLine(
//               isFirst: false,
//               isLast: false,
//               isPast: false,
//               text: 'Enter your floor Info'),
//           TimeLine(
//               isFirst: false,
//               isLast: true,
//               isPast: false,
//               text: 'Your move Summary'),
//         ],
//       ),