import 'package:json_annotation/json_annotation.dart';
part 'defi.g.dart';

@JsonSerializable()
class Defi{
  @JsonKey(name:"defi_market_cap")
  String defiMarketCap;

  @JsonKey(name:"eth_market_cap")
  String ethMarketCap;

  @JsonKey(name:"defi_to_eth_ratio")
  String defiToEthRatio;

  @JsonKey(name:"trading_volume_24h")
  String tradingVolume24h;

  @JsonKey(name:"defi_dominance")
  String defiDominance;

  @JsonKey(name:"top_coin_name")
  String topCoinName;

 @JsonKey(name:"top_coin_defi_dominance")
  double topCoinDefiDomniance;

  Defi();
  factory Defi.fromJson(Map<String, dynamic> json) => _$DefiFromJson(json);
  Map<String, dynamic> toJson() => _$DefiToJson(this) ;
}