import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/model/Movie.dart';
import 'package:flutter_application/model/book.dart';
import 'package:flutter_application/network/network_request.dart';
import 'package:flutter_application/widget/shimmer_widget.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> books = [];
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 4), () {});

    NetworkRequest.fetchBooks().then((data) => {
          setState(() {
            books = data;
          })
        });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: _isLoading ? 5 : books.length,
              physics: const ScrollPhysics(parent: null),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _isLoading
                    ? createShimmer()
                    : createCardWithData(books[index], index);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget createShimmer() => ListTile(
        title: ShimmerWidget.reactangular(height: 16),
        subtitle: ShimmerWidget.reactangular(height: 14),
      );

  Widget createCardWithData(Book book, int index) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: (index) % 2 == 0 ? Colors.pinkAccent : Colors.blueAccent,
        elevation: 10,
        child: ListTile(
          onTap: () => {
            showDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text(book.name ?? "Name"),
                content: Text('Type: ${book.type ?? "Type"}'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('Ok'),
                    onPressed: () => {Navigator.pop(context)},
                  )
                ],
              ),
            )
          },
          title: Text(book.name ?? "name"),
          subtitle: Text(
              'Type: ${book.type ?? "type"} - available: ${book.available}'),
        ),
      );
}
