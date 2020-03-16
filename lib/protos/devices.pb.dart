///
//  Generated code. Do not modify.
//  source: devices.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class OrderC extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OrderC', package: const $pb.PackageName('devices'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, 'ordersId', $pb.PbFieldType.P6, protoName: 'ordersId')
    ..pPS(2, 'tenantId', protoName: 'tenantId')
    ..pPS(3, 'sourceId', protoName: 'sourceId')
    ..pPS(4, 'sourceTrackingId', protoName: 'sourceTrackingId')
    ..pPS(5, 'sourceBatch', protoName: 'sourceBatch')
    ..pPS(6, 'pluId', protoName: 'pluId')
    ..pPS(7, 'pluText', protoName: 'pluText')
    ..p<$core.double>(8, 'qty', $pb.PbFieldType.PF)
    ..pPS(9, 'status')
    ..pPS(10, 'uuid')
    ..p<$core.int>(11, 'version', $pb.PbFieldType.PU3)
    ..pPS(12, 'orderType', protoName: 'orderType')
    ..pPS(13, 'parentUuid', protoName: 'parentUuid')
    ..pPS(16, 'timestamp')
    ..hasRequiredFields = false
  ;

  OrderC._() : super();
  factory OrderC() => create();
  factory OrderC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrderC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OrderC clone() => OrderC()..mergeFromMessage(this);
  OrderC copyWith(void Function(OrderC) updates) => super.copyWith((message) => updates(message as OrderC));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrderC create() => OrderC._();
  OrderC createEmptyInstance() => create();
  static $pb.PbList<OrderC> createRepeated() => $pb.PbList<OrderC>();
  @$core.pragma('dart2js:noInline')
  static OrderC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrderC>(create);
  static OrderC _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get ordersId => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get tenantId => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get sourceId => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get sourceTrackingId => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.String> get sourceBatch => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get pluId => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get pluText => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.double> get qty => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$core.String> get status => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$core.String> get uuid => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<$core.int> get version => $_getList(10);

  @$pb.TagNumber(12)
  $core.List<$core.String> get orderType => $_getList(11);

  @$pb.TagNumber(13)
  $core.List<$core.String> get parentUuid => $_getList(12);

  @$pb.TagNumber(16)
  $core.List<$core.String> get timestamp => $_getList(13);
}

class TagC extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TagC', package: const $pb.PackageName('devices'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'value')
    ..a<$core.int>(3, 'version', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  TagC._() : super();
  factory TagC() => create();
  factory TagC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TagC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TagC clone() => TagC()..mergeFromMessage(this);
  TagC copyWith(void Function(TagC) updates) => super.copyWith((message) => updates(message as TagC));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TagC create() => TagC._();
  TagC createEmptyInstance() => create();
  static $pb.PbList<TagC> createRepeated() => $pb.PbList<TagC>();
  @$core.pragma('dart2js:noInline')
  static TagC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TagC>(create);
  static TagC _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);
}

class SubmoduleC extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SubmoduleC', package: const $pb.PackageName('devices'), createEmptyInstance: create)
    ..aOS(1, 'modulename')
    ..aOS(2, 'status')
    ..a<$core.int>(3, 'version', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  SubmoduleC._() : super();
  factory SubmoduleC() => create();
  factory SubmoduleC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmoduleC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SubmoduleC clone() => SubmoduleC()..mergeFromMessage(this);
  SubmoduleC copyWith(void Function(SubmoduleC) updates) => super.copyWith((message) => updates(message as SubmoduleC));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubmoduleC create() => SubmoduleC._();
  SubmoduleC createEmptyInstance() => create();
  static $pb.PbList<SubmoduleC> createRepeated() => $pb.PbList<SubmoduleC>();
  @$core.pragma('dart2js:noInline')
  static SubmoduleC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmoduleC>(create);
  static SubmoduleC _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get modulename => $_getSZ(0);
  @$pb.TagNumber(1)
  set modulename($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasModulename() => $_has(0);
  @$pb.TagNumber(1)
  void clearModulename() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);
}

class DeviceConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeviceConfig', package: const $pb.PackageName('devices'), createEmptyInstance: create)
    ..aOS(1, 'action')
    ..aOM<OrderC>(2, 'order', subBuilder: OrderC.create)
    ..pc<TagC>(3, 'tag', $pb.PbFieldType.PM, subBuilder: TagC.create)
    ..pc<SubmoduleC>(4, 'submodule', $pb.PbFieldType.PM, subBuilder: SubmoduleC.create)
    ..p<$core.int>(5, 'subscript', $pb.PbFieldType.PU3)
    ..aOB(6, 'fifo')
    ..aOS(7, 'timestamp')
    ..hasRequiredFields = false
  ;

  DeviceConfig._() : super();
  factory DeviceConfig() => create();
  factory DeviceConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeviceConfig clone() => DeviceConfig()..mergeFromMessage(this);
  DeviceConfig copyWith(void Function(DeviceConfig) updates) => super.copyWith((message) => updates(message as DeviceConfig));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeviceConfig create() => DeviceConfig._();
  DeviceConfig createEmptyInstance() => create();
  static $pb.PbList<DeviceConfig> createRepeated() => $pb.PbList<DeviceConfig>();
  @$core.pragma('dart2js:noInline')
  static DeviceConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceConfig>(create);
  static DeviceConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get action => $_getSZ(0);
  @$pb.TagNumber(1)
  set action($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  @$pb.TagNumber(2)
  OrderC get order => $_getN(1);
  @$pb.TagNumber(2)
  set order(OrderC v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrder() => clearField(2);
  @$pb.TagNumber(2)
  OrderC ensureOrder() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<TagC> get tag => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<SubmoduleC> get submodule => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get subscript => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get fifo => $_getBF(5);
  @$pb.TagNumber(6)
  set fifo($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFifo() => $_has(5);
  @$pb.TagNumber(6)
  void clearFifo() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get timestamp => $_getSZ(6);
  @$pb.TagNumber(7)
  set timestamp($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTimestamp() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimestamp() => clearField(7);
}

class DeviceConfigResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeviceConfigResponse', package: const $pb.PackageName('devices'), createEmptyInstance: create)
    ..aOM<DeviceConfig>(1, 'config', subBuilder: DeviceConfig.create)
    ..hasRequiredFields = false
  ;

  DeviceConfigResponse._() : super();
  factory DeviceConfigResponse() => create();
  factory DeviceConfigResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceConfigResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeviceConfigResponse clone() => DeviceConfigResponse()..mergeFromMessage(this);
  DeviceConfigResponse copyWith(void Function(DeviceConfigResponse) updates) => super.copyWith((message) => updates(message as DeviceConfigResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeviceConfigResponse create() => DeviceConfigResponse._();
  DeviceConfigResponse createEmptyInstance() => create();
  static $pb.PbList<DeviceConfigResponse> createRepeated() => $pb.PbList<DeviceConfigResponse>();
  @$core.pragma('dart2js:noInline')
  static DeviceConfigResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceConfigResponse>(create);
  static DeviceConfigResponse _defaultInstance;

  @$pb.TagNumber(1)
  DeviceConfig get config => $_getN(0);
  @$pb.TagNumber(1)
  set config(DeviceConfig v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfig() => clearField(1);
  @$pb.TagNumber(1)
  DeviceConfig ensureConfig() => $_ensure(0);
}

class CreateDeviceConfigRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateDeviceConfigRequest', package: const $pb.PackageName('devices'), createEmptyInstance: create)
    ..aOS(1, 'deviceUuid', protoName: 'deviceUuid')
    ..aOM<DeviceConfig>(2, 'config', subBuilder: DeviceConfig.create)
    ..hasRequiredFields = false
  ;

  CreateDeviceConfigRequest._() : super();
  factory CreateDeviceConfigRequest() => create();
  factory CreateDeviceConfigRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDeviceConfigRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateDeviceConfigRequest clone() => CreateDeviceConfigRequest()..mergeFromMessage(this);
  CreateDeviceConfigRequest copyWith(void Function(CreateDeviceConfigRequest) updates) => super.copyWith((message) => updates(message as CreateDeviceConfigRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDeviceConfigRequest create() => CreateDeviceConfigRequest._();
  CreateDeviceConfigRequest createEmptyInstance() => create();
  static $pb.PbList<CreateDeviceConfigRequest> createRepeated() => $pb.PbList<CreateDeviceConfigRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateDeviceConfigRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDeviceConfigRequest>(create);
  static CreateDeviceConfigRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceUuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceUuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceUuid() => clearField(1);

  @$pb.TagNumber(2)
  DeviceConfig get config => $_getN(1);
  @$pb.TagNumber(2)
  set config(DeviceConfig v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfig() => clearField(2);
  @$pb.TagNumber(2)
  DeviceConfig ensureConfig() => $_ensure(1);
}

class GetDeviceConfigRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetDeviceConfigRequest', package: const $pb.PackageName('devices'), createEmptyInstance: create)
    ..aOS(1, 'deviceUuid', protoName: 'deviceUuid')
    ..hasRequiredFields = false
  ;

  GetDeviceConfigRequest._() : super();
  factory GetDeviceConfigRequest() => create();
  factory GetDeviceConfigRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDeviceConfigRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetDeviceConfigRequest clone() => GetDeviceConfigRequest()..mergeFromMessage(this);
  GetDeviceConfigRequest copyWith(void Function(GetDeviceConfigRequest) updates) => super.copyWith((message) => updates(message as GetDeviceConfigRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDeviceConfigRequest create() => GetDeviceConfigRequest._();
  GetDeviceConfigRequest createEmptyInstance() => create();
  static $pb.PbList<GetDeviceConfigRequest> createRepeated() => $pb.PbList<GetDeviceConfigRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDeviceConfigRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDeviceConfigRequest>(create);
  static GetDeviceConfigRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceUuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceUuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceUuid() => clearField(1);
}

class StreamDeviceConfigRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StreamDeviceConfigRequest', package: const $pb.PackageName('devices'), createEmptyInstance: create)
    ..aOS(1, 'deviceUuid', protoName: 'deviceUuid')
    ..aOS(2, 'lastindex')
    ..hasRequiredFields = false
  ;

  StreamDeviceConfigRequest._() : super();
  factory StreamDeviceConfigRequest() => create();
  factory StreamDeviceConfigRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamDeviceConfigRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  StreamDeviceConfigRequest clone() => StreamDeviceConfigRequest()..mergeFromMessage(this);
  StreamDeviceConfigRequest copyWith(void Function(StreamDeviceConfigRequest) updates) => super.copyWith((message) => updates(message as StreamDeviceConfigRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamDeviceConfigRequest create() => StreamDeviceConfigRequest._();
  StreamDeviceConfigRequest createEmptyInstance() => create();
  static $pb.PbList<StreamDeviceConfigRequest> createRepeated() => $pb.PbList<StreamDeviceConfigRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamDeviceConfigRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamDeviceConfigRequest>(create);
  static StreamDeviceConfigRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceUuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceUuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastindex => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastindex($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastindex() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastindex() => clearField(2);
}

