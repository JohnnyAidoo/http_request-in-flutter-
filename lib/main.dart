import 'package:flutter/material.dart';
import 'package:http_request/http_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Future<List<Map>> _futurePosts = HttpHelper().fetchItems();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('http'),
        ),
        body: FutureBuilder<List<Map>>(
            future: _futurePosts,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Text('error');
              }

              if (snapshot.hasData) {
                List<Map> posts = snapshot.data;
                return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      Map thisItem = posts[index];
                      return ListTile(
                        title: Text('${thisItem['title']}'),
                        subtitle: Text('${thisItem['body']}'),
                      );
                    });
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
