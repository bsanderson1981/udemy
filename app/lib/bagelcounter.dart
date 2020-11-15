import 'package:flutter/material.dart';

//FIXME  fix scroll deletes counts entered
//TODO Block all tuesdays from pickup dates
//TODO how to i track counts for 13 types of bagels and breads in window
//TODO  in SnackBar menu: need bagel count to show bakers dozen   1 bdoz + 7 bagels total

/* void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}
 */
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget>
    with AutomaticKeepAliveClientMixin {
//added mixin to allow scroll keep item count

  int _ecounter = 0;

  int bakerdoz = 0;

  int _totalbagels = 0;

  @override
  bool get wantKeepAlive => true; //needed for above mix in to work

  void _incrementCounter() {
    setState(() {
      //track increament   ~/ finds just total bager doz of 13
      // %  check total for multiple of 13 and return single
      // non bakers doz totals back
      // TB = 16     BDz = 1   and Bagels = 3 for example...

      _totalbagels++;
      bakerdoz = (_totalbagels ~/ 13);
      _ecounter = (_totalbagels % 13);

      if (bakerdoz > 0) {
        showBottomSheet<void>(
          context: context,
          //isDismissible: false,   make dismissible on click 
          
          
          builder: (BuildContext context) {
            return Container(
              height: 100,
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                     Text('Bakers Doz: $bakerdoz and each: $_ecounter '),
                    //ElevatedButton(
                      //child: const Text('Close BottomSheet'),
                      //onPressed: () => Navigator.pop(context),
                    //)
                  ],
                ),
              ),
            );
          },
        );
      }

      /*  showBottomSheet(
            context: context,
            builder: (context) => Container(
                  width: 200,
                  height: 100,
                  color: Colors.lightBlue,
                  child: Text('$bakerdoz'),
                )); */
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_totalbagels == 0) {
        // check if zero do not go into -1

      } else {
        _totalbagels--;
        bakerdoz = (_totalbagels ~/ 13);
        _ecounter = (_totalbagels % 13);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add_circle),
            color: Colors.black,
            iconSize: 25,
            onPressed: _incrementCounter,
          ),
          Text(
            '$_totalbagels',
            style: Theme.of(context).textTheme.headline4,
          ),
          IconButton(
            icon: Icon(Icons.remove_circle),
            color: Colors.black,
            iconSize: 25,
            onPressed: _decrementCounter,
          ),
          /* Row(
            children: [
              Text(
                'BDz:$_bakerdoz',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                ' TB=:$_totalbagels',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ), */
        ],
      ),
    );
  }
}
