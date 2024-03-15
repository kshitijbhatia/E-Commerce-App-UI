// ignore_for_file: prefer_final_fields, unused_field, sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/item.dart';
import 'package:flutter/material.dart';

class ItemTypeList extends StatefulWidget {
  const ItemTypeList(
      {super.key,
      required this.items,
      required this.chosenItem,
      required this.changeItem});

  final List<ItemCategory> items;
  final ItemCategory chosenItem;
  final void Function(ItemCategory) changeItem;

  @override
  State<ItemTypeList> createState() => _ItemTypeListState();
}

class _ItemTypeListState extends State<ItemTypeList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.items.map(
            (item) {
              String image = item.getImage;
              return GestureDetector(
                onTap: () {
                  widget.changeItem(item);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 3, right: 3),
                  width: 100,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 70,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: widget.chosenItem == item
                                      ? Colors.orange.shade700
                                      : Colors.black),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: image,
                              color: widget.chosenItem == item
                                  ? Colors.orange.shade800
                                  : Colors.black,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: CircleAvatar(
                              backgroundColor: widget.chosenItem == item
                                  ? Colors.orange.shade700
                                  : Colors.black,
                              foregroundColor: Colors.white,
                              radius: 16,
                              child: Text('${item.getNumberOfItems}'),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 110,
                        height: 50,
                        margin: const EdgeInsets.only(right: 10),
                        child: Center(
                          child: Text(
                            item.getName,
                            style: TextStyle(
                              fontSize: 16,
                              color: widget.chosenItem == item
                                  ? Colors.orange.shade700
                                  : Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
