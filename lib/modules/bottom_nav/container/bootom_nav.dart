import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:onigiri_app/modules/bottom_nav/store/actions.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return BottomNavigationBar(
            currentIndex: viewModel.selectedBottomNav,
            onTap: viewModel.onBottomNavSelected,
            items: _getItems(),
            type: BottomNavigationBarType.fixed);
      },
    );
  }

  List<BottomNavigationBarItem> _getItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Discovery'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.store),
        title: Text('Merchants'),
      ),
      BottomNavigationBarItem(
        icon: Text(''),
        title: Text(''),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.local_offer),
        title: Text('Deals'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile'),
      ),
    ];
  }
}

class _ViewModel {
  final int selectedBottomNav;
  final Function(int) onBottomNavSelected;

  _ViewModel({
    @required this.selectedBottomNav,
    @required this.onBottomNavSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      selectedBottomNav: store.state.navState.selectedBottomNav,
      onBottomNavSelected: (int index) =>
          store.dispatch(ChangeBottomNavAction(index: index)),
    );
  }
}
