import 'package:cloud_energy/api/graphql.dart' as graphql;
import 'package:cloud_energy/model/provider.dart';
import 'package:cloud_energy/bloc/provider_list_bloc_provider.dart';
import 'package:flutter/material.dart';

typedef Null ItemSelectedCallback(Provider provider);

class ListWidget extends StatefulWidget {
  final ItemSelectedCallback onItemSelected;

  ListWidget._(
    this.onItemSelected,
  );

  static ProviderListBlocProvider create(ItemSelectedCallback onItemSelected) {
    return ProviderListBlocProvider(child: ListWidget._(onItemSelected));
  }

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  ProviderListBlocProvider _provider;

  @override
  Widget build(BuildContext context) {
    _provider = ProviderListBlocProvider.of(context);
    _provider.bloc.setProviderList();
    return StreamBuilder<List<Provider>>(
        stream: _provider.bloc.onList,
        builder: (context, snapshot) {
          return ListView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),

              itemCount: snapshot.data.length,
              itemBuilder: (context, position) {
                return Container(
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                          leading: Image.asset(
                            'images/labit.png',
                            width: 56,
                          ),
                          title: Text(
                            snapshot.data[position].name,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          subtitle: Text('&list'),
                          onTap: () {
                            widget.onItemSelected(snapshot.data[position]);
                          },
                        )));
              });
        });
  }
}
