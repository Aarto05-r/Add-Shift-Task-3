import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  List shift = [0];

  void _incrementCounter() {
    setState(() {
      _counter++;
      shift.add(_counter);
    });
  }

  void _dcrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // ignore: annotate_overrides
  Days(day) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.3,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 4),
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(
          // color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Text(day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Set your Availability",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              " Availability",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                  onPressed: () {
                    _incrementCounter();
                    setState(() {});
                  },
                  // ignore: prefer_const_constructors
                  child: Text(
                    " + Add Shift",
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("shift-${_counter}"),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: shift.length,
                itemBuilder: (context, index) {
                  print("Shift $index");
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'From',
                            ),
                            Text(
                              'To',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              onPressed: () async {},
                              child: Row(
                                children: [
                                  Text(
                                    "00:00..",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.watch_later_outlined)
                                ],
                              ),
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "00:00..",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.watch_later_outlined)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text("Select days"),
                        Wrap(
                          spacing: 20,
                          children: [
                            Days("Monday"),
                            Days("Tuesday"),
                            Days("Wednesday"),
                            Days("Thursday"),
                            Days("Friday"),
                            Days("Saturday"),
                            Days("Sunday"),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
