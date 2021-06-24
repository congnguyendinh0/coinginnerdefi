// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefiResponse _$DefiResponseFromJson(Map<String, dynamic> json) {
  return DefiResponse()
    ..defi = json['data'] == null
        ? null
        : Defi.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DefiResponseToJson(DefiResponse instance) =>
    <String, dynamic>{
      'data': instance.defi,
    };
