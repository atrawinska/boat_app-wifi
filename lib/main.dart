import 'package:flutter/material.dart';
import 'RequestHandler.dart';
import 'Chat.dart';
import 'Info.dart';
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boat control panel',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 144, 69, 114),
        ),
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

String baseUrl = 'http://192.168.246.241:5000';
RequestHandler rh = RequestHandler(baseUrl: baseUrl);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Info(),
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              
              decoration: BoxDecoration(),
              child: Center(
                child: Column(
                  children: [

                    Container(margin: EdgeInsets.fromLTRB(0, 5, 0, 5), child:
                    ElevatedButton(
                      onPressed: () {
                        rh.sendLedCommand('red', 'on');
                        print("Sent request from Red button");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 255, 154, 154),
                        ),
                      ),
                      child: const Icon(Icons.lightbulb_outline_rounded),
                    ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container( margin: EdgeInsets.fromLTRB(5, 0, 15, 0), child: 
                        ElevatedButton(
                          
                          onPressed: () {
                            rh.sendLedCommand('green', 'on');
                            print("Sent request from Green button");
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 169, 209, 182),
                            ),
                          ),
                          child: const Icon(Icons.lightbulb_outline_rounded),
                        ),
                        ),
       Container( margin: EdgeInsets.fromLTRB(15, 0, 5, 0), child: 
                        ElevatedButton(
                          
                          onPressed: () {
                            rh.sendLedCommand('yellow', 'on');
                            print("Sent request from yellow button");
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 243, 252, 185),
                            ),
                            
                          ),
                          child: const Icon(Icons.lightbulb_outline_rounded),
                        ),
       ),
                      ],
                    
                    ),
                
          Container( margin: EdgeInsets.fromLTRB(0, 5, 0, 5),  child: 
                    ElevatedButton(
                      onPressed: () {
                        rh.sendLedCommand('white', 'on');
                        print("Sent request from white button");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 231, 228, 228),
                        ),
                      ),
                      child: const Icon(Icons.lightbulb_outline_rounded),
                    ),
          ),
                  ],
                ),
              ),
            ),
            Container(
              
              margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Image.asset("assets/map_denmark.png")



            ),
            Container(
              
              margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: ElevatedButton(onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatOpen()),
    );},
    child: Text("Chat"))



            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
onPressed: () {
    _scaffoldKey.currentState?.openDrawer();
  },
        tooltip: 'Red LED',
        child: const Icon(Icons.question_mark, color: Color.fromARGB(255, 144, 69, 114),),  // i like this: Icons.question_answer),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
