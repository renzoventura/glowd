import 'package:flutter/material.dart';
import 'package:lyghts/light_controller/view_models/group_view_model.dart';
import 'package:provider/provider.dart';

class GroupsScreen extends StatelessWidget {
  static const id = "groups";

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupViewModel>(builder: (context, groupViewModel, child) {
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                Text("Groups Screen"),
                FlatButton(
                  onPressed: groupViewModel.getListOfGroups,
                  // onPressed: groupViewModel.getGroupById,

                  child: Text('GET GROUPS'),
                ),
                FlatButton(
                  // onPressed: groupViewModel.getListOfGroups,
                  onPressed: () {
                    groupViewModel.getGroupById(1);
                  },
                  child: Text('GET GROUP NUMBER 1'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
