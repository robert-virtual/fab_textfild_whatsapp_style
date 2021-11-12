import 'package:flutter/material.dart'; 

class RecargasPage extends StatefulWidget {
  const RecargasPage({Key? key}) : super(key: key);

  @override
  _RecargasPageState createState() => _RecargasPageState();
}

class _RecargasPageState extends State<RecargasPage> {
  final phone = TextEditingController();
  final cantidad = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recargas"),
      ),
      body:  Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
          ),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(50),
          child:   TextField(
            controller: cantidad,
            maxLength: 3,
            keyboardType:TextInputType.number ,
            decoration:  InputDecoration(
              border: InputBorder.none,
              counterText: "",
              suffixIcon: IconButton(onPressed: cantidad.clear, icon: const Icon(Icons.close)),
              prefixIcon: const Icon(Icons.attach_money),
              label: const Text("cantidad"),
              hintText: "Catidad"
            ),
          ),
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
      )
    );
  }
}