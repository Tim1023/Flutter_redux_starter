import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';

class AuthLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        }
    );
  }
}

class _ViewModel {
  final bool isLoading;

  _ViewModel({this.isLoading});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.authState.isLoading,
    );
  }
}