import 'package:flutter/material.dart';
import 'package:listviewexample/services.dart';
import 'package:listviewexample/user_model.dart';

// https://jsonplaceholder.typicode.com/posts
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example List view builder"),
        backgroundColor: const Color(0xff453456),
      ),
      backgroundColor: const Color(0xff453456),
      body: FutureBuilder<List<UserModel>?>(
        future: Service().getPost(),
        builder: ((context, data) {
        return ListView.builder(
        itemCount: data.data?.length,
        itemBuilder: (BuildContext context, int index) {
          // return const Text("Hello");
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 248, 235),
              ),
              child: Center(
                  child: Column(
                    children: [
                      Text(
                data.data?[index].title ??"",
                style: const TextStyle(
                      fontSize: 20.0,
                ),
              ),
                    ],
                  )),
            ),
          );
        },
      );
      }))
    );
  }
}
