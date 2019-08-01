import 'package:flutter/material.dart';
import 'package:fruits_ui_design/fruits.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 15),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'All Fruits',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Avocado',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Grapes',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Apple',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Grapefruit',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 475,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                FruitsPage(),
                FruitsPage(),
                FruitsPage(),
                FruitsPage(),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Sales',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildFoodItem('assets/images/greenapple.png', '80', '\$13.88'),
                _buildFoodItem('assets/images/lemon.png', '75', '\$15.00'),
                _buildFoodItem('assets/images/orange.png', '89', '\$11.86'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String discount, String price) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          Container(
            height: 125,
            width: 125,
          ),
          Positioned(
            left: 15,
            child: Container(
              height: 20,
              width: 25,
              decoration: BoxDecoration(
                color: Color(0xFFD2691F),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
          Positioned(
            top: 7,
            child: Container(
              height: 110,
              width: 125,
              decoration: BoxDecoration(
                  color: Color(0xFFAAC2A5),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Image.asset(
                    imgPath,
                    fit: BoxFit.cover,
                    height: 70,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 15,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Color(0xFFD2691F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7.0),
                  bottomRight: Radius.circular(7.0),
                  bottomLeft: Radius.circular(7.0),
                ),
              ),
              child: Center(
                child: Text(
                  '$discount%',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 9,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
