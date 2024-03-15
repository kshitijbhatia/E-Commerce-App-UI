// ignore_for_file: sized_box_for_whitespace
import 'package:e_commerce_app/models/item.dart';
import 'package:e_commerce_app/ui/items.dart';
import 'package:flutter/material.dart';

class ItemSubType extends StatefulWidget {
  const ItemSubType({super.key, required this.item});

  final ItemCategory item;

  @override
  State<ItemSubType> createState() => _ItemSubTypeState();
}

class _ItemSubTypeState extends State<ItemSubType> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.item.getItemSubList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 40,
            child: TabBar(
              controller: _tabController,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black,
              indicatorColor: Colors.orange.shade800,
              tabs: widget.item.getItemSubList.map(
                (item) {
                  return Tab(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Text(
                            item.getName,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          radius: 10,
                          child: Text(
                            '${item.getNumberOfItems}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.item.getItemSubList.map((itemSub){
              return ItemDisplay(items: itemSub.getItemList,);
            }).toList(),),
          )
        ],
      ),
    );
  }
}