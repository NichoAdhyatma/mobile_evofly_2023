import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home_card_list.dart';
import '../controllers/home_controller.dart';
import '../widgets/evo_searchbar.dart';
import '../widgets/umkm_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                EvoSearchBar(),

                SizedBox(
                  height: 30,
                ),
                //card
                HomeCardList(),

                SizedBox(
                  height: 30,
                ),

                UmkmCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
