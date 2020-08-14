import 'package:graphql/client.dart';

final GraphQLClient client = GraphQLClient(
  cache: InMemoryCache(),
  link: HttpLink(
      uri:
      'https://a73ic5hmabab5fwp6qfwwfxrua.appsync-api.ap-northeast-1.amazonaws.com/graphql',
      headers: <String, String>{
        'X-API-KEY': 'da2-zko3jdkdpzftnfpkyq4xwszj5i',
        'Content-Type': 'application/json'
      }),
);

const String GET_PROVIDERS = r"""
query GetProviders{
  getProviders{
    providers{
      id
      name
    }
  }
}
""";

