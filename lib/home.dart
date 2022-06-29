import 'package:flutter/material.dart';
import 'package:support_task/top.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  double height = 100;

  void changeHeight(double height) {
    setState(() {
      this.height = height;
    });
  }

  void handleTabSelection() {
    switch (tabController.index) {
      case 0:
        changeHeight(100);
        break;
      case 1:
        changeHeight(150);
        break;
      default:
        changeHeight(200);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(handleTabSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problem'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              for (int i = 0; i < 2; i++) ...{TopWidget()},
              Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.black,
                    child: TabBar(
                      controller: tabController,
                      onTap: (index) {
                        if (index == 0) {
                          changeHeight(100);
                          return;
                        }
                        if (index == 1) {
                          changeHeight(150);
                          return;
                        }
                        changeHeight(200);
                      },
                      tabs: [
                        Tab(
                          icon: Text('TAB 1'),
                        ),
                        Tab(
                          icon: Text('TAB 2'),
                        ),
                        Tab(
                          icon: Text('TAB 3'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Container(
                          child: Center(child: Text('tab 1  height: 100')),
                          color: Colors.red,
                        ),
                        Container(
                          child: Center(child: Text('tab 2  height: 150')),
                          color: Colors.orange,
                        ),
                        Container(
                          child: Center(child: Text('tab 3  height: 200')),
                          color: Colors.yellow,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              for (int i = 0; i < 4; i++) ...{TopWidget()},
            ],
          ),
        ),
      ),
    );
  }
}
