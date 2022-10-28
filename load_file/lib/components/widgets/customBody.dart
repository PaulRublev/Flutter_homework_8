import 'package:async_future/components/fetch_file.dart';
import 'package:async_future/components/utils.dart';
import 'package:flutter/material.dart';

class CustomBody extends StatefulWidget {
  final editingController;
  const CustomBody({
    super.key,
    required this.editingController,
  });

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  String fileName = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                TextField(
                  controller: widget.editingController,
                  decoration: InputDecoration(
                    enabledBorder: makeCustomInputBorder(),
                    focusedBorder: makeCustomInputBorder(),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black,
                      ),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        fileName = '${widget.editingController.text}.txt';
                      });
                    },
                    child: const Text(
                      'Найти',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: fetchFileFromAssets(fileName),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Center(
                            child: Text('.....'),
                          );
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case ConnectionState.done:
                          return Text(snapshot.data);
                        default:
                          return const Text('...');
                      }
                    },
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
