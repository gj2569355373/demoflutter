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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class User {
  final String name;
  final String? id;
  final int sex;
  int age;

  User(this.name, this.sex, this.age, {this.id});
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;
  var list = [
    User('Jack', 1, 18),
    User('Rick', 1, 18),
    User('Jake', 1, 18),
    User('Alan', 0, 18),
    User('Nick', 1, 81)
  ];

  @override
  void initState() {
    super.initState();
    list.length;
    list.isEmpty;
    var listNew = list.where((element) => element.sex == 1).map((e) {
      e.age = 10;
      return e;
    });
    for (var item in listNew) {
      print('${item.name} + ${item.age}');
    }
    testCast(listNew);
    WidgetsBinding.instance.addObserver(this);
  }
  void testCast(Iterable<User> objects) {
    var bar1 = objects.cast<User>();
    // var bar2 = List.castFrom<User,User>(objects);
    var bar3 = List.from(objects);
    print('object');
  }
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPersistentFrameCallback(
      (_) {
        if (MediaQuery.of(context).viewInsets.bottom == 0) {
          // 关闭键盘
          print("关闭键盘");
        } else {
          // 打开键盘
          print("打开键盘");
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  TextEditingController editController = new TextEditingController();

  Widget _searchBar(BuildContext context) {
    print("刷新输入框");
    return Row(
      children: <Widget>[
        SizedBox(width: 16),
        Expanded(
            child: ConstrainedBox(
                //通过ConstrainedBox修改TextField的高度
                constraints: BoxConstraints(maxHeight: 30),
                child: TextField(
                  autofocus: false,
                  controller: editController,
                  // onChanged: (value) =>
                  //     context.read<SearchModel>().changSearch(value),
                  // onSubmitted: (value) =>
                  //     context.read<SearchModel>().search(value),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 0),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black26,
                      ),
                      fillColor: Color(0x0D000000),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
                      hintText: "搜索你感兴趣的内容11122",
                      hintStyle: TextStyle(fontSize: 13)),
                ))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _searchBar(context),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
