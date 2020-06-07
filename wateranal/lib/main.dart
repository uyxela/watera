// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.snackbar),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          title: const Text('Next page'),
        ),
        body: const Center(
          child: Text(
            'This is the next page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.youtube_searched_for),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: Column (
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
//                  leading: Icon(Icons.album),
                  title: Text('Water Quality Information'),
                  subtitle: Text('Sensor #1'),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.bookmark),
                        tooltip: 'Save',
                        onPressed: () {
                          scaffoldKey.currentState.showSnackBar(snackBar);
                        },
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Temperature", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('txt')
                        ],
                        )
                    ),

                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.bookmark),
                        tooltip: 'Save',
                        onPressed: () {
                          scaffoldKey.currentState.showSnackBar(snackBar);
                        },
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Humidity", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('txt')
                          ],
                        )
                    ),

                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.bookmark),
                        tooltip: 'Save',
                        onPressed: () {
                          scaffoldKey.currentState.showSnackBar(snackBar);
                        },
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Water Contamination", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('txt')
                          ],
                        )
                    ),

                  ],
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('See More'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
class CardWid extends StatelessWidget {
  CardWid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
