import 'package:cloud_energy/api/graphql.dart';
import 'package:cloud_energy/model/provider.dart';
import 'package:graphql/client.dart';
import 'package:rxdart/rxdart.dart';

class ProviderListBloc {
  final _onListController = BehaviorSubject<List<Provider>>.seeded(List<Provider>());

  Stream<List<Provider>> get onList => _onListController.stream;

  void setProviderList() async {
    final QueryResult result = await client.query(QueryOptions(
        documentNode: gql(GET_PROVIDERS)
    ));
    _onListController.sink.add(List<Provider>.from(result.data['getProviders']['providers'].map((item)=> Provider.fromJson(item)).toList()));
  }
}