import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = '/categoryPage';

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Choose the category",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100,
            ),
            new CupertinoButton(
              onPressed: () => {},
              color: Colors.blue,
              borderRadius: new BorderRadius.circular(30.0),
              child: Container(
                height: 100,
                width: 300,
                child: Center(
                  child: new Text(
                    "Category 1",
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new CupertinoButton(
              onPressed: () => {},
              color: Colors.green,
              borderRadius: new BorderRadius.circular(30.0),
              child: Container(
                height: 100,
                width: 300,
                child: Center(
                  child: new Text(
                    "Category 2",
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new CupertinoButton(
              onPressed: () => {},
              color: Colors.orange,
              borderRadius: new BorderRadius.circular(30.0),
              child: Container(
                height: 100,
                width: 300,
                child: Center(
                  child: new Text(
                    "Category 3",
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
