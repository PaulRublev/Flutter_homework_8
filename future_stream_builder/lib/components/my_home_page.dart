import 'package:flutter/material.dart';
import 'package:future_stream_builder/components/utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isRandonGenerated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future / Stream'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Future builder'),
                Center(
                  // TODO: FutureBuilder
                  child: FutureBuilder(
                    future: dataFuture(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text('none');
                        case ConnectionState.waiting:
                          return const Text('waiting');
                        case ConnectionState.done:
                          return snapshot.hasError == true
                              ? Text('${snapshot.error}')
                              : Text('${snapshot.data}');
                        default:
                          return const Text('default');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 20, thickness: 4),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Stream builder'),
                Center(
                  // TODO: StreamBuilder
                  child: StreamBuilder(
                    stream: dataStream(4),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text('none');
                        case ConnectionState.waiting:
                          return const Text('waiting');
                        case ConnectionState.active:
                          return Text('${snapshot.data}');
                        case ConnectionState.done:
                          return snapshot.hasError == true
                              ? Text('${snapshot.error}')
                              : Text('${snapshot.data}');
                        default:
                          return const Text('default');
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // rebuild widget
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
