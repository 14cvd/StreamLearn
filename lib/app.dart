import 'package:flutter/material.dart';
import 'package:stream_learn/model/model.dart';

// ignore: must_be_immutable
class App extends StatelessWidget {
  App({super.key});
  ModelCounter modelView = ModelCounter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: modelView.streamCounter,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data! % 2 == 0
                  ? "Is Even: ${snapshot.data.toString()}"
                  : "Is Odd: ${snapshot.data}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      body: Center(
          child: StreamBuilder(
        stream: modelView.streamCounter,
        builder: (context, snapshot) {
          return Text(snapshot.hasData ? modelView.counter.toString() : "");
        },
      )),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              modelView.remove();
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            onPressed: () {
              modelView.add();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
