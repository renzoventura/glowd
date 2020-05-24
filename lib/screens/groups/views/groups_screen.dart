import 'package:flutter/material.dart';
import 'package:lyghts/components/spin_widget.dart';
import 'package:lyghts/constants/constants_labels.dart';
import 'package:lyghts/constants/constants_styles.dart';
import 'package:lyghts/models/group/group.dart';
import 'package:lyghts/screens/groups/components/group_widget.dart';
import 'package:lyghts/screens/groups/components/home_bar_widget.dart';
import 'package:lyghts/screens/groups/view_model/group_view_model.dart';
import 'package:lyghts/screens/lights/view_model/light_view_model.dart';
import 'package:lyghts/screens/lights/views/lights_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GroupsScreen extends StatefulWidget {
  static const id = "groups";

  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  String replacementMessage = REFRESH_TO_LOAD;

  @override
  void initState() {
    super.initState();
    GroupViewModel().getListOfGroups();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    void _showDialog(String message) {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(ERROR),
            content: new Text(message),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text(CLOSE),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    updateReplacement() => replacementMessage = NO_ROOMS;
    onFailGetGroups() => _showDialog(CANNOT_CONNECT);
    onFailUpdateGroup() => _showDialog(CANNOT_UPDATE);

    updateScreen() {
      setState(() {});
    }

    navigateToLightsScreen() => Navigator.pushNamed(context, LightsScreen.id);

    return Consumer2<GroupViewModel, LightViewModel>(builder: (
      context,
      groupViewModel,
      lightViewModel,
      child,
    ) {
      void _onRefresh() async {
        await groupViewModel.getListOfGroups(
            onEmpty: updateReplacement, onFail: onFailGetGroups);
        _refreshController.refreshCompleted();
        _refreshController.loadComplete();
      }

      void navigateToLightsPage(List<dynamic> lightIds) {
        lightViewModel.getLightsByGroup(lightIds,
            onFail: onFailGetGroups, onSuccessNavigate: navigateToLightsScreen);
      }

      return SafeArea(
        child: Scaffold(
          body: SmartRefresher(
            enablePullUp: true,
            onRefresh: _onRefresh,
            child: ModalProgressHUD(
              inAsyncCall: groupViewModel.isBusy,
              progressIndicator: SpinWidget(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(smallPadding),
                  child: Column(
                    children: <Widget>[
                      HomeBarWidget(),
                      Visibility(
                        visible: groupViewModel.listOfGroups.isNotEmpty,
                        replacement: Padding(
                          padding: const EdgeInsets.all(smallPadding),
                          child: Text(
                            replacementMessage,
                          ),
                        ),
                        child: Expanded(
                          child: Container(
                            child: GridView.count(
                              crossAxisCount: 2,
                              children: List.generate(
                                  groupViewModel.listOfGroups.length, (index) {
                                Group group =
                                    groupViewModel.listOfGroups[index];
                                return GroupWidget(
                                    onTap: () {
                                      navigateToLightsPage(group.lights);
                                    },
                                    onToggle: () async {
                                      return await groupViewModel.updateGroup(
                                        group,
                                        group.state.anyOn,
                                        onSuccess: updateScreen,
                                        onFail: onFailUpdateGroup,
                                      );
                                    },
                                    group: groupViewModel.listOfGroups[index]);
                              }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            controller: _refreshController,
          ),
        ),
      );
    });
  }
}
