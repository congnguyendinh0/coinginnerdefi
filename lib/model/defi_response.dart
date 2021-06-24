import 'package:json_annotation/json_annotation.dart';
import 'defi.dart';
part 'defi_response.g.dart';


@JsonSerializable()
class DefiResponse{
  DefiResponse();
  @JsonKey(name : "data")
  Defi defi;
  factory DefiResponse.fromJson(Map<String, dynamic> json) => _$DefiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DefiResponseToJson(this) ;
}