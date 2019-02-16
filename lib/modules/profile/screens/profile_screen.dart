import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:onigiri_app/common/screens/login_screen.dart';
import 'package:onigiri_app/modules/profile/containers/logout_button.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.isAuthenticated) {
          return  Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network(
                          viewModel.avatar,
                        ),
                        Text(
                          viewModel.username,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          viewModel.email,
                        ),
                        LogoutButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return LoginScreen();
        }
      },
    );
  }
}

class _ViewModel {
  final bool isAuthenticated;
  final String username;
  final String email;
  final String avatar;


  _ViewModel({
    @required this.isAuthenticated,
    this.username,
    this.email,
    this.avatar,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isAuthenticated: store.state.authState.isAuthenticated,
      username: store.state.authState?.user?.username,
      email: store.state.authState?.user?.email,
      avatar: store.state.authState?.user?.avatar,
    );
  }
}