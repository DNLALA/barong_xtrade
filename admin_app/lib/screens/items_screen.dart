import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransD extends StatefulWidget {
  DocumentSnapshot docToEdit;
  TransD({required this.docToEdit});

  @override
  State<TransD> createState() => _TransDState();
}

class _TransDState extends State<TransD> {
  //

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 36, 81, 140),
        title: const Text('Transaction Details'),
      ),
      body: Card(
        elevation: 10,
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: SizedBox(
            height: 270,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 2,
                ),
                Text(
                  widget.docToEdit.id,
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                // Image.network(
                //   widget.docToEdit.,
                //   height: 220,
                //   fit: BoxFit.cover,
                // ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.docToEdit.data.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // body: ListTile(
      //   leading: Icon(Icons.arrow_forward_ios),
      //   title: Text(
      //     widget.docToEdit.id,
      //     style: TextStyle(
      //       fontSize: 10,
      //     ),
      //   ),
      //   trailing: Icon(Icons.wifi_protected_setup_sharp),
      // ),
    );
  }
}
