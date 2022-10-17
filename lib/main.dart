import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

//
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class Leading extends StatelessWidget {
  const Leading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(Icons.table_rows_rounded),
      iconSize: 20,
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
        // leading: const Leading(),//直接写成小组件可以解决从context查找父类引起的bug
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                //会从context的父类开始找组件context.findAncestorStateOfType
                //当前组件的context父组件是 MyApp 是没有 Scaffold，且没有drawer,因此无法打开
                //Builder是一个StatelessWidget基础组件，只不过返回了自己的context，因此没问题
                Scaffold.of(context).openDrawer();
                //Scaffold.of(context).closeDrawer(); //关闭侧边栏
                // Scaffold.of(context).openEndDrawer();//打开右侧侧边栏
              },
              icon: const Icon(Icons.table_rows_rounded),
              iconSize: 20,
            );
          },
        ),
      ),
      body: const Center(
        child: Text("我是首页内容"),
      ),
      //endDrawer: Container(), //是右边侧边栏不多说了
      //我们就在这里面直接写了
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: const <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("标题"),
              accountEmail: Text("副标题"),
              //头像
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
              ),
              //背景
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("标题"),
              subtitle: Text("副标题"),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("标题"),
              subtitle: Text("副标题"),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("标题"),
              subtitle: Text("副标题"),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
