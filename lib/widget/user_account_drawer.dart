import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyDrawerState();
  }
}

/// 显示用户账户的 Drawer
class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).backgroundColor,
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          children: <Widget>[
            ClipRect(
              child: ListTile(
                leading: CircleAvatar(child: Icon(Icons.settings)),
                title: Text('设置'),
                onTap: () {},
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
