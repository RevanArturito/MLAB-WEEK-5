// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:deep_dive_get_cli/app/data/model/post_model.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/image_story.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/post_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/story_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: Row(
              children: [
        
                Image.asset('assets/images/IG_logo.png', scale: 2),
                SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_down_rounded, size: 28)
              ]),

            actions: [
              Icon(Icons.favorite_outline_rounded, size: 28),
              SizedBox(width: 24.5),
              Image.asset('assets/images/sms.png', scale : 2),
              SizedBox(width: 24.5),
              Image.asset('assets/images/add.png', scale : 2),
              SizedBox(width: 16),

            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label : ""),
              BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.black,), label : ""),
              BottomNavigationBarItem(icon: Image.asset('assets/images/reels.png', scale: 2.2), label : ""),
              BottomNavigationBarItem(icon: Image.asset('assets/images/shopping.png', scale: 2.2), label : ""),
              BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: AssetImage('assets/images/febry.png')), label : ""),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: 97.75,
                  child: ListView.builder(
                    itemCount: controller.storyModel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      StoryModel data = controller.storyModel[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 12,
                        ),
                        child: ImageStory(
                          
                          story: data,
                          onTap: () {
                            controller.toStoryPageView(data.storyItems );
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Post(
                  postModel: controller.postModel,
                  onPressed: controller.changeIconLike,
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
