// ignore_for_file: avoid_unnecessary_containers

import 'package:e_commerce_app/models/item.dart';
import 'package:flutter/material.dart';

class ItemDisplay extends StatefulWidget {
  const ItemDisplay({super.key, required this.items});

  final List<Item> items;

  @override
  State<ItemDisplay> createState() => _ItemDisplayState();
}

class _ItemDisplayState extends State<ItemDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: widget.items.map((item) {
          String chosenSize = item.getSize;
          void changeSize(String selectedSize) {
            setState(() {
              item.setSize = selectedSize;
            });
          }

          int addedToCart = item.getAddedCount;
          return Card(
            color: Colors.white,
            elevation: 5,
            surfaceTintColor: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Icon(item.getIcon, size: 50),
                      ),
                      Container(
                        child: Text(
                          item.getName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                        size: 'S',
                        changeSize: changeSize,
                        chosenSize: chosenSize),
                    CustomButton(
                        size: 'M',
                        changeSize: changeSize,
                        chosenSize: chosenSize),
                    CustomButton(
                        size: 'L',
                        changeSize: changeSize,
                        chosenSize: chosenSize),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: addedToCart == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange.shade800,
                              ),
                              margin: const EdgeInsets.only(right: 10),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      item.increaseCount();
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Add Similar',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                              ),
                            )
                          ],
                        )
                      : Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    item.decreaseCount();
                                  });
                                },
                                icon: const Icon(Icons.horizontal_rule_rounded),
                              ),
                              Text(
                                '${item.getAddedCount}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    item.increaseCount();
                                  });
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.size,
      required this.changeSize,
      required this.chosenSize});

  final String size;
  final Function(String) changeSize;
  final String chosenSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (size) {
          case 'S':
            changeSize('S');
          case 'M':
            changeSize('M');
          case 'L':
            changeSize('L');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: chosenSize != size
              ? Border.all(
                  color: Colors.black,
                )
              : null,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: CircleAvatar(
          backgroundColor:
              chosenSize == size ? Colors.orange.shade800 : Colors.white,
          foregroundColor: chosenSize == size ? Colors.white : Colors.black,
          radius: 20,
          child: Text(
            size,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
