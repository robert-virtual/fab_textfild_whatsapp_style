import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tests_app/models/contact.dart';
import 'package:tests_app/pages/favorite_page.dart';

class MultiSelectionPage extends StatefulWidget {
  const MultiSelectionPage({Key? key}) : super(key: key);

  @override
  _MultiSelectionPageState createState() => _MultiSelectionPageState();
}

class _MultiSelectionPageState extends State<MultiSelectionPage> {
  int current = 0;
  List<Contact> contacts = List.generate(
      25,
      (i) => Contact(
          name: "Nombre $i",
          phoneNumber: "${Random().nextInt(98989898) + 30000000}"));
  Contact? seletedContact;
  final phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FavoritePage()));
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
        title: const Text("Multi selection"),
      ),
      body: SafeArea(
        child: seletedContact != null
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(seletedContact!.name),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  contacts[current].isSelected = false;
                                  seletedContact = null;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, i) => contactItem(contacts[i], i),
              ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white
            ),
            width: (MediaQuery.of(context).size.width)*0.80,
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: phone,
              maxLength: 8,
              textAlign:TextAlign .center ,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: "Numero de telefono",
                suffixIcon: IconButton(
                  onPressed: phone.clear, 
                  icon: const Icon(Icons.close),
                )
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  Widget contactItem(Contact contact, int i) {
    return ListTile(
      onTap: () {
        setState(() {
          contacts[current].isSelected = false;
          contacts[i].isSelected = true;
          current = i;
          seletedContact = contact;
        });
      },
      leading: const CircleAvatar(
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.person_outline_outlined, color: Colors.white),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phoneNumber),
    );
  }
}
