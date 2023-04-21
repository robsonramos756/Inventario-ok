import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inventario_ok/SegundaPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventário Ok',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _feedList = [];
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadFeedData();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadFeedData() async {
    String jsonData =
        await DefaultAssetBundle.of(context).loadString('assets/link.json');
    setState(() {
      _feedList = json.decode(jsonData);
    });
  }

  void _handleScroll() {
    if (_scrollController.position.extentAfter == 0 && !_isLoading) {
      setState(() {
        _isLoading = true;
      });
      _loadFeedData().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Você chegou a última categoria'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventário Ok'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _feedList.length + (_isLoading ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          if (index >= _feedList.length) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SegundaPage(
                      image: AssetImage(_feedList[index]['image']),
                      message: _feedList[index]['message'],
                    ),
                  ),
                );
              },
              child: Card(
                child: Image.asset(
                  _feedList[index]['image'],
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
