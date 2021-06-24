// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Defi _$DefiFromJson(Map<String, dynamic> json) {
  return Defi()
    ..defiMarketCap = json['defi_market_cap'] as String
    ..ethMarketCap = json['eth_market_cap'] as String
    ..defiToEthRatio = json['defi_to_eth_ratio'] as String
    ..tradingVolume24h = json['trading_volume_24h'] as String
    ..defiDominance = json['defi_dominance'] as String
    ..topCoinName = json['top_coin_name'] as String
    ..topCoinDefiDomniance =
        (json['top_coin_defi_dominance'] as num)?.toDouble();
}

Map<String, dynamic> _$DefiToJson(Defi instance) => <String, dynamic>{
      'defi_market_cap': instance.defiMarketCap,
      'eth_market_cap': instance.ethMarketCap,
      'defi_to_eth_ratio': instance.defiToEthRatio,
      'trading_volume_24h': instance.tradingVolume24h,
      'defi_dominance': instance.defiDominance,
      'top_coin_name': instance.topCoinName,
      'top_coin_defi_dominance': instance.topCoinDefiDomniance,
    };
