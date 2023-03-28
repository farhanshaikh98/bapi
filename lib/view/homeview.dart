import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/homeview_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  HomeViewController homeViewController = Get.put(HomeViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => homeViewController.isDataLoading.value
          ? const Center(child: CircularProgressIndicator())
          : _builScreen()),
    );
  }

  Widget _builScreen() {
    return ListView.builder(
        itemCount: homeViewController.result?.data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.only(left: 20),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            homeViewController.result!.data[index].avatar),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            homeViewController.result!.data[index].firstName
                                .toUpperCase(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                          Text(homeViewController.result!.data[index].lastName,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                          Text(homeViewController.result!.data[index].email,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              )
            ],
          );
        });
  }
}
