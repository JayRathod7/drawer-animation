import 'package:flutter/material.dart';
import 'package:flutter_animation/model/list_model.dart';
import 'package:flutter_animation/screen/detail_screen.dart';
import 'package:flutter_animation/utils/app_string.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../main.dart';
final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  List<ListModel> dataList = [
    ListModel(
        title: "Spider man",
        description: AppString.des1,
        image: AppString.image2),
    ListModel(
        title: "Minions", description: AppString.des2, image: AppString.image3),
    ListModel(
        title: "zombies", description: AppString.des3, image: AppString.image4),
    ListModel(
        title: "drawing", description: AppString.des4, image: AppString.image5),
    ListModel(
        title: "Groot (Marvel)",
        description: AppString.des5,
        image: AppString.image6),
    ListModel(
        title: "Spider man",
        description: AppString.des6,
        image: AppString.image7),
    ListModel(
        title: "Deadpool",
        description: AppString.des7,
        image: AppString.image8),
    ListModel(
        title: "Iron and Spider",
        description: AppString.des8,
        image: AppString.image9),
    ListModel(
        title: "Minions",
        description: AppString.des9,
        image: AppString.image10),
    ListModel(
        title: "Minions",
        description: AppString.des10,
        image: AppString.image11),
    ListModel(
        title: "Minions",
        description: AppString.des10,
        image: AppString.image12),
    ListModel(
        title: "Minions",
        description: AppString.des10,
        image: AppString.image13),
    ListModel(
        title: "Minions",
        description: AppString.des10,
        image: AppString.image14),
    ListModel(
        title: "Minions",
        description: AppString.des10,
        image: AppString.image15),
    ListModel(
        title: "Minions",
        description: AppString.des10,
        image: AppString.image16),
    ListModel(
        title: "Minions",
        description: AppString.des10,
        image: AppString.image17),
    ListModel(
        title: "Minions",
        description: AppString.des10,
        image: AppString.image18),
    ListModel(
        title: "Minions",
        description: AppString.des10,
        image: AppString.image19),
    ListModel(
        title: "Minions",
        description: AppString.des10,
        image: AppString.image20)
  ];
  bool _clickIcon = false;

  late Animation _listAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    forListAnimation();
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  void forListAnimation() {
    _listAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.40, 0.75, curve: Curves.easeIn)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: appBar(),
        body: _clickIcon ? _buildListview() : _buildGridView());
  }

  Widget _buildListview() {
    return AnimationLimiter(
      child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
                duration: Duration(seconds: 1),
                position: index,
                child: SlideAnimation(
                    horizontalOffset: 50, child: _listViewBody(index)));
          }),
    );
  }

  Widget _listViewBody(index) {
    final item = dataList[index];
    return FadeInAnimation(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(listModel: item)));
          },
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(12))),
            child: Row(
              children: [
                Hero(
                  tag: item,
                  child: Container(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(12)),
                      child: Image.network(
                        item.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          item.description,
                          maxLines: 2,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return Opacity(
      opacity: _listAnimation.value,
      child: GridView.builder(
          itemCount: dataList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return _gridViewBody(index);
          }),
    );
  }

  Widget _gridViewBody(index) {
    final item = dataList[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(listModel: item)));
        },
        child: Stack(
          children: [
            Container(
              child: Hero(
                tag: item,
                child: Container(
                  height: 110,
                  width: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      item.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                height: 40,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                ),
                child: Center(
                  child: Text(
                    item.title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() => AppBar(
    automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
            ),
            SizedBox(width: 12),
            Text(
              "Movies",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  setState(() {
                    _clickIcon = !_clickIcon;
                  });
                },
                icon: _clickIcon ? Icon(Icons.view_list) : Icon(Icons.grid_on))
          ],
        ),
      );
}
