import 'dart:math';

import 'package:barongxtrade/screens/items_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  ItemList({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  // ignore: prefer_final_fields
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('transactions');

  //_reference.get()  ---> returns Future<QuerySnapshot>
  //_reference.snapshots()--> Stream<QuerySnapshot> -- realtime updates
  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 36, 81, 140),
        title: const Text('Transactions'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Check error
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          //Check if data arrived
          if (snapshot.hasData) {
            //get the data
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //Convert the documents to Maps
            List<Map> items = documents
                .map((e) => {
                      'id': e.id,
                      'name': e['accountName'],
                      'acountNumber': e['accountNumber'],
                      'timeId': e['time']
                    })
                .toList();

            // Display the list
            return Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    //Get the item at this index
                    Map thisItem = items[index];
                    //REturn the widget for the list items
                    return GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => TransD(
                                      docToEdit: snapshot.data.docs[index],
                                    )));
                      }),
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.arrow_forward_ios),
                          title: Text(
                            'Transcation ID:  ${thisItem['id']}',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          subtitle: Text(
                            ' ${thisItem['timeId']}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          trailing: Icon(Icons.wifi_protected_setup_sharp),
                        ),
                      ),
                    );
                  }),
            );
          }

          //Show loader
          return Center(child: CircularProgressIndicator());
        },
      ), //Display a list // Add a FutureBuilder
    );
  }
}
