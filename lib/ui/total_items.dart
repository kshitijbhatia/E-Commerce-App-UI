// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class TotalItems extends StatelessWidget {
  const TotalItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const Text(
                  'Total Items',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange.shade700,
                  foregroundColor: Colors.white,
                  radius: 16,
                  child: const Text('70', style: TextStyle(fontSize: 14),),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  iconSize: 30,
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      elevation: MaterialStatePropertyAll(10),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      )),
                  child: const Text('Skip', style: TextStyle(fontSize: 16),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
