import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Nine',
    'Eight'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(
        children: _createdItemsShort(),
      ),
    );
  }

  // List<Widget> _createdItems() {
  //   List<Widget> list = new List<Widget>();

  //   for (String opt in options) {
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );

  //     list..add(tempWidget)..add(Divider());
  //   }

  //   return list;
  // }

  List<Widget> _createdItemsShort() {
    return options.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + "!"),
            subtitle: Text('number english'),
            //widget al inicio
            leading: Icon(Icons.accessible_forward_sharp),
            //widget al final
            trailing: Icon(Icons.arrow_forward_ios_outlined),

            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
