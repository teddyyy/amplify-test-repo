import 'package:json_annotation/json_annotation.dart';

part 'provider.g.dart';

@JsonSerializable()
class Provider {
  String id;
  String name;

  static const fromJson = _$ProviderFromJson;
  Map<String, dynamic> toJson() => _$ProviderToJson(this);
}