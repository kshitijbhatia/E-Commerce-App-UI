// ignore_for_file: sized_box_for_whitespace
import 'package:e_commerce_app/ui/home_page_header.dart';
import 'package:e_commerce_app/ui/item_sub_category.dart';
import 'package:e_commerce_app/ui/item_category.dart';
import 'package:e_commerce_app/models/item.dart';
import 'package:e_commerce_app/ui/order_status.dart';
import 'package:e_commerce_app/ui/total_items.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemCategory> items = [];
  late ItemCategory chosenItem;

  void changeItem(ItemCategory item) {
    setState(() {
      chosenItem = item;
    });
  }

  @override
  void initState() {
    super.initState();
    items = getData();
    chosenItem = items[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const HomePageHeader(),
            const StatusBar(),
            const TotalItems(),
            ItemTypeList(
              items: items,
              chosenItem: chosenItem,
              changeItem: changeItem,
            ),
            if (chosenItem.getItemSubList.isNotEmpty)
              ItemSubType(
                item: chosenItem,
              )
          ],
        ),
      ),
    );
  }
}
