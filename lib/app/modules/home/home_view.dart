import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // this.controller.todos.map((element) => print('asdasd'));

    // print('LENGT');
    // print(this.controller.todos);

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(() => Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        title:
                            Text('Todo Item ${controller.todos[index].name}'),
                      );
                    },
                    itemCount: controller.todos.length,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
