import 'package:cloud_energy/bloc/provider_list_bloc.dart';
import 'package:flutter/material.dart';

class ProviderListBlocProvider extends InheritedWidget {
  ProviderListBlocProvider({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => false;

  final ProviderListBloc _bloc = ProviderListBloc();
  ProviderListBloc get bloc => _bloc;

  static ProviderListBlocProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProviderListBlocProvider>();
  }
}
