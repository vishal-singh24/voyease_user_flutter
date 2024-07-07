import 'package:flutter/material.dart';
import 'package:sheet/sheet.dart';

class ShopSheet extends StatelessWidget {
  const ShopSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Sheet(
      initialExtent: MediaQuery.of(context).size.height - 40,
      fit: SheetFit.expand,
      elevation: 20,
      minInteractionExtent: 100,
      resizable: true,
      minResizableExtent: 300,
      // physics: const SnapSheetPhysics(
      //   stops: <double>[0, 300, double.infinity],
      //   relative: false,
      // ),
      child: Scaffold(
        backgroundColor: Colors.red,
        body: const Center(
          child: Text('Hello'),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 4,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.access_alarm),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
