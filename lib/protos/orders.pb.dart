///
//  Generated code. Do not modify.
//  source: orders.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class DecimalValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DecimalValue', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'units', $pb.PbFieldType.OS6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, 'nanos', $pb.PbFieldType.OS3)
    ..hasRequiredFields = false
  ;

  DecimalValue._() : super();
  factory DecimalValue() => create();
  factory DecimalValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DecimalValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DecimalValue clone() => DecimalValue()..mergeFromMessage(this);
  DecimalValue copyWith(void Function(DecimalValue) updates) => super.copyWith((message) => updates(message as DecimalValue));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DecimalValue create() => DecimalValue._();
  DecimalValue createEmptyInstance() => create();
  static $pb.PbList<DecimalValue> createRepeated() => $pb.PbList<DecimalValue>();
  @$core.pragma('dart2js:noInline')
  static DecimalValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DecimalValue>(create);
  static DecimalValue _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get units => $_getI64(0);
  @$pb.TagNumber(1)
  set units($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnits() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnits() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get nanos => $_getIZ(1);
  @$pb.TagNumber(2)
  set nanos($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNanos() => $_has(1);
  @$pb.TagNumber(2)
  void clearNanos() => clearField(2);
}

class Tag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tag', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'value')
    ..a<$core.int>(3, 'version', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Tag._() : super();
  factory Tag() => create();
  factory Tag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Tag clone() => Tag()..mergeFromMessage(this);
  Tag copyWith(void Function(Tag) updates) => super.copyWith((message) => updates(message as Tag));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tag create() => Tag._();
  Tag createEmptyInstance() => create();
  static $pb.PbList<Tag> createRepeated() => $pb.PbList<Tag>();
  @$core.pragma('dart2js:noInline')
  static Tag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tag>(create);
  static Tag _defaultInstance;

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

class Tags extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tags', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..pc<Tag>(1, 'tag', $pb.PbFieldType.PM, subBuilder: Tag.create)
    ..hasRequiredFields = false
  ;

  Tags._() : super();
  factory Tags() => create();
  factory Tags.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tags.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Tags clone() => Tags()..mergeFromMessage(this);
  Tags copyWith(void Function(Tags) updates) => super.copyWith((message) => updates(message as Tags));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tags create() => Tags._();
  Tags createEmptyInstance() => create();
  static $pb.PbList<Tags> createRepeated() => $pb.PbList<Tags>();
  @$core.pragma('dart2js:noInline')
  static Tags getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tags>(create);
  static Tags _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Tag> get tag => $_getList(0);
}

class Order extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Order', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aInt64(1, 'ordersId', protoName: 'ordersId')
    ..aOS(2, 'tenantId', protoName: 'tenantId')
    ..aOS(3, 'sourceId', protoName: 'sourceId')
    ..aOS(4, 'sourceTrackingId', protoName: 'sourceTrackingId')
    ..aOS(5, 'sourceBatch', protoName: 'sourceBatch')
    ..aOS(6, 'pluId', protoName: 'pluId')
    ..aOS(7, 'pluText', protoName: 'pluText')
    ..aOM<DecimalValue>(8, 'qty', subBuilder: DecimalValue.create)
    ..aOS(9, 'status')
    ..aOS(10, 'uuid')
    ..a<$core.int>(11, 'version', $pb.PbFieldType.OU3)
    ..aOS(12, 'orderType', protoName: 'orderType')
    ..aOS(13, 'parentUuid', protoName: 'parentUuid')
    ..aOM<Tags>(14, 'tags', subBuilder: Tags.create)
    ..aOM<Submodules>(15, 'submodules', subBuilder: Submodules.create)
    ..aOS(16, 'timestamp')
    ..hasRequiredFields = false
  ;

  Order._() : super();
  factory Order() => create();
  factory Order.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Order.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Order clone() => Order()..mergeFromMessage(this);
  Order copyWith(void Function(Order) updates) => super.copyWith((message) => updates(message as Order));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Order create() => Order._();
  Order createEmptyInstance() => create();
  static $pb.PbList<Order> createRepeated() => $pb.PbList<Order>();
  @$core.pragma('dart2js:noInline')
  static Order getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Order>(create);
  static Order _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get ordersId => $_getI64(0);
  @$pb.TagNumber(1)
  set ordersId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrdersId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrdersId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sourceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sourceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSourceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSourceId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sourceTrackingId => $_getSZ(3);
  @$pb.TagNumber(4)
  set sourceTrackingId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSourceTrackingId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSourceTrackingId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get sourceBatch => $_getSZ(4);
  @$pb.TagNumber(5)
  set sourceBatch($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSourceBatch() => $_has(4);
  @$pb.TagNumber(5)
  void clearSourceBatch() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get pluId => $_getSZ(5);
  @$pb.TagNumber(6)
  set pluId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPluId() => $_has(5);
  @$pb.TagNumber(6)
  void clearPluId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get pluText => $_getSZ(6);
  @$pb.TagNumber(7)
  set pluText($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPluText() => $_has(6);
  @$pb.TagNumber(7)
  void clearPluText() => clearField(7);

  @$pb.TagNumber(8)
  DecimalValue get qty => $_getN(7);
  @$pb.TagNumber(8)
  set qty(DecimalValue v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasQty() => $_has(7);
  @$pb.TagNumber(8)
  void clearQty() => clearField(8);
  @$pb.TagNumber(8)
  DecimalValue ensureQty() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get status => $_getSZ(8);
  @$pb.TagNumber(9)
  set status($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatus() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get uuid => $_getSZ(9);
  @$pb.TagNumber(10)
  set uuid($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUuid() => $_has(9);
  @$pb.TagNumber(10)
  void clearUuid() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get version => $_getIZ(10);
  @$pb.TagNumber(11)
  set version($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasVersion() => $_has(10);
  @$pb.TagNumber(11)
  void clearVersion() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get orderType => $_getSZ(11);
  @$pb.TagNumber(12)
  set orderType($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasOrderType() => $_has(11);
  @$pb.TagNumber(12)
  void clearOrderType() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get parentUuid => $_getSZ(12);
  @$pb.TagNumber(13)
  set parentUuid($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasParentUuid() => $_has(12);
  @$pb.TagNumber(13)
  void clearParentUuid() => clearField(13);

  @$pb.TagNumber(14)
  Tags get tags => $_getN(13);
  @$pb.TagNumber(14)
  set tags(Tags v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasTags() => $_has(13);
  @$pb.TagNumber(14)
  void clearTags() => clearField(14);
  @$pb.TagNumber(14)
  Tags ensureTags() => $_ensure(13);

  @$pb.TagNumber(15)
  Submodules get submodules => $_getN(14);
  @$pb.TagNumber(15)
  set submodules(Submodules v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasSubmodules() => $_has(14);
  @$pb.TagNumber(15)
  void clearSubmodules() => clearField(15);
  @$pb.TagNumber(15)
  Submodules ensureSubmodules() => $_ensure(14);

  @$pb.TagNumber(16)
  $core.String get timestamp => $_getSZ(15);
  @$pb.TagNumber(16)
  set timestamp($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasTimestamp() => $_has(15);
  @$pb.TagNumber(16)
  void clearTimestamp() => clearField(16);
}

class GetOrderRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetOrderRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..hasRequiredFields = false
  ;

  GetOrderRequest._() : super();
  factory GetOrderRequest() => create();
  factory GetOrderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOrderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetOrderRequest clone() => GetOrderRequest()..mergeFromMessage(this);
  GetOrderRequest copyWith(void Function(GetOrderRequest) updates) => super.copyWith((message) => updates(message as GetOrderRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetOrderRequest create() => GetOrderRequest._();
  GetOrderRequest createEmptyInstance() => create();
  static $pb.PbList<GetOrderRequest> createRepeated() => $pb.PbList<GetOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static GetOrderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOrderRequest>(create);
  static GetOrderRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);
}

class CreateOrderResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateOrderResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  CreateOrderResponse._() : super();
  factory CreateOrderResponse() => create();
  factory CreateOrderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateOrderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateOrderResponse clone() => CreateOrderResponse()..mergeFromMessage(this);
  CreateOrderResponse copyWith(void Function(CreateOrderResponse) updates) => super.copyWith((message) => updates(message as CreateOrderResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateOrderResponse create() => CreateOrderResponse._();
  CreateOrderResponse createEmptyInstance() => create();
  static $pb.PbList<CreateOrderResponse> createRepeated() => $pb.PbList<CreateOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateOrderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateOrderResponse>(create);
  static CreateOrderResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class GetTagRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTagRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOS(2, 'tagId', protoName: 'tagId')
    ..hasRequiredFields = false
  ;

  GetTagRequest._() : super();
  factory GetTagRequest() => create();
  factory GetTagRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTagRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTagRequest clone() => GetTagRequest()..mergeFromMessage(this);
  GetTagRequest copyWith(void Function(GetTagRequest) updates) => super.copyWith((message) => updates(message as GetTagRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTagRequest create() => GetTagRequest._();
  GetTagRequest createEmptyInstance() => create();
  static $pb.PbList<GetTagRequest> createRepeated() => $pb.PbList<GetTagRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTagRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTagRequest>(create);
  static GetTagRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tagId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tagId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTagId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagId() => clearField(2);
}

class GetTagResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTagResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOM<Tags>(1, 'tags', subBuilder: Tags.create)
    ..hasRequiredFields = false
  ;

  GetTagResponse._() : super();
  factory GetTagResponse() => create();
  factory GetTagResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTagResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTagResponse clone() => GetTagResponse()..mergeFromMessage(this);
  GetTagResponse copyWith(void Function(GetTagResponse) updates) => super.copyWith((message) => updates(message as GetTagResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTagResponse create() => GetTagResponse._();
  GetTagResponse createEmptyInstance() => create();
  static $pb.PbList<GetTagResponse> createRepeated() => $pb.PbList<GetTagResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTagResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTagResponse>(create);
  static GetTagResponse _defaultInstance;

  @$pb.TagNumber(1)
  Tags get tags => $_getN(0);
  @$pb.TagNumber(1)
  set tags(Tags v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTags() => $_has(0);
  @$pb.TagNumber(1)
  void clearTags() => clearField(1);
  @$pb.TagNumber(1)
  Tags ensureTags() => $_ensure(0);
}

class GetSubmoduleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetSubmoduleRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOS(2, 'submodule')
    ..hasRequiredFields = false
  ;

  GetSubmoduleRequest._() : super();
  factory GetSubmoduleRequest() => create();
  factory GetSubmoduleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSubmoduleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetSubmoduleRequest clone() => GetSubmoduleRequest()..mergeFromMessage(this);
  GetSubmoduleRequest copyWith(void Function(GetSubmoduleRequest) updates) => super.copyWith((message) => updates(message as GetSubmoduleRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSubmoduleRequest create() => GetSubmoduleRequest._();
  GetSubmoduleRequest createEmptyInstance() => create();
  static $pb.PbList<GetSubmoduleRequest> createRepeated() => $pb.PbList<GetSubmoduleRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSubmoduleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSubmoduleRequest>(create);
  static GetSubmoduleRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get submodule => $_getSZ(1);
  @$pb.TagNumber(2)
  set submodule($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubmodule() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubmodule() => clearField(2);
}

class GetSubmoduleResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetSubmoduleResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOM<Submodules>(1, 'submodules', subBuilder: Submodules.create)
    ..hasRequiredFields = false
  ;

  GetSubmoduleResponse._() : super();
  factory GetSubmoduleResponse() => create();
  factory GetSubmoduleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSubmoduleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetSubmoduleResponse clone() => GetSubmoduleResponse()..mergeFromMessage(this);
  GetSubmoduleResponse copyWith(void Function(GetSubmoduleResponse) updates) => super.copyWith((message) => updates(message as GetSubmoduleResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSubmoduleResponse create() => GetSubmoduleResponse._();
  GetSubmoduleResponse createEmptyInstance() => create();
  static $pb.PbList<GetSubmoduleResponse> createRepeated() => $pb.PbList<GetSubmoduleResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSubmoduleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSubmoduleResponse>(create);
  static GetSubmoduleResponse _defaultInstance;

  @$pb.TagNumber(1)
  Submodules get submodules => $_getN(0);
  @$pb.TagNumber(1)
  set submodules(Submodules v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubmodules() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubmodules() => clearField(1);
  @$pb.TagNumber(1)
  Submodules ensureSubmodules() => $_ensure(0);
}

class GetOrderWithRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetOrderWithRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOM<Order>(1, 'order', subBuilder: Order.create)
    ..aOM<Tags>(2, 'tags', subBuilder: Tags.create)
    ..aOM<Submodules>(3, 'submodules', subBuilder: Submodules.create)
    ..hasRequiredFields = false
  ;

  GetOrderWithRequest._() : super();
  factory GetOrderWithRequest() => create();
  factory GetOrderWithRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOrderWithRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetOrderWithRequest clone() => GetOrderWithRequest()..mergeFromMessage(this);
  GetOrderWithRequest copyWith(void Function(GetOrderWithRequest) updates) => super.copyWith((message) => updates(message as GetOrderWithRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetOrderWithRequest create() => GetOrderWithRequest._();
  GetOrderWithRequest createEmptyInstance() => create();
  static $pb.PbList<GetOrderWithRequest> createRepeated() => $pb.PbList<GetOrderWithRequest>();
  @$core.pragma('dart2js:noInline')
  static GetOrderWithRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOrderWithRequest>(create);
  static GetOrderWithRequest _defaultInstance;

  @$pb.TagNumber(1)
  Order get order => $_getN(0);
  @$pb.TagNumber(1)
  set order(Order v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrder() => clearField(1);
  @$pb.TagNumber(1)
  Order ensureOrder() => $_ensure(0);

  @$pb.TagNumber(2)
  Tags get tags => $_getN(1);
  @$pb.TagNumber(2)
  set tags(Tags v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTags() => $_has(1);
  @$pb.TagNumber(2)
  void clearTags() => clearField(2);
  @$pb.TagNumber(2)
  Tags ensureTags() => $_ensure(1);

  @$pb.TagNumber(3)
  Submodules get submodules => $_getN(2);
  @$pb.TagNumber(3)
  set submodules(Submodules v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSubmodules() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubmodules() => clearField(3);
  @$pb.TagNumber(3)
  Submodules ensureSubmodules() => $_ensure(2);
}

class OrderHistory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OrderHistory', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aInt64(1, 'eventsId', protoName: 'eventsId')
    ..aOS(2, 'index')
    ..aOS(3, 'uuid')
    ..aOS(4, 'json')
    ..hasRequiredFields = false
  ;

  OrderHistory._() : super();
  factory OrderHistory() => create();
  factory OrderHistory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrderHistory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OrderHistory clone() => OrderHistory()..mergeFromMessage(this);
  OrderHistory copyWith(void Function(OrderHistory) updates) => super.copyWith((message) => updates(message as OrderHistory));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrderHistory create() => OrderHistory._();
  OrderHistory createEmptyInstance() => create();
  static $pb.PbList<OrderHistory> createRepeated() => $pb.PbList<OrderHistory>();
  @$core.pragma('dart2js:noInline')
  static OrderHistory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrderHistory>(create);
  static OrderHistory _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get eventsId => $_getI64(0);
  @$pb.TagNumber(1)
  set eventsId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventsId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get index => $_getSZ(1);
  @$pb.TagNumber(2)
  set index($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uuid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUuid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get json => $_getSZ(3);
  @$pb.TagNumber(4)
  set json($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasJson() => $_has(3);
  @$pb.TagNumber(4)
  void clearJson() => clearField(4);
}

class CreateUuidRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateUuidRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'sourceId', protoName: 'sourceId')
    ..hasRequiredFields = false
  ;

  CreateUuidRequest._() : super();
  factory CreateUuidRequest() => create();
  factory CreateUuidRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUuidRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateUuidRequest clone() => CreateUuidRequest()..mergeFromMessage(this);
  CreateUuidRequest copyWith(void Function(CreateUuidRequest) updates) => super.copyWith((message) => updates(message as CreateUuidRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateUuidRequest create() => CreateUuidRequest._();
  CreateUuidRequest createEmptyInstance() => create();
  static $pb.PbList<CreateUuidRequest> createRepeated() => $pb.PbList<CreateUuidRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateUuidRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUuidRequest>(create);
  static CreateUuidRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sourceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sourceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSourceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSourceId() => clearField(1);
}

class CreateUuidResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateUuidResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..hasRequiredFields = false
  ;

  CreateUuidResponse._() : super();
  factory CreateUuidResponse() => create();
  factory CreateUuidResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUuidResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateUuidResponse clone() => CreateUuidResponse()..mergeFromMessage(this);
  CreateUuidResponse copyWith(void Function(CreateUuidResponse) updates) => super.copyWith((message) => updates(message as CreateUuidResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateUuidResponse create() => CreateUuidResponse._();
  CreateUuidResponse createEmptyInstance() => create();
  static $pb.PbList<CreateUuidResponse> createRepeated() => $pb.PbList<CreateUuidResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateUuidResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUuidResponse>(create);
  static CreateUuidResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);
}

class StreamOrdersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StreamOrdersRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'subscriber')
    ..aOS(2, 'lastindex')
    ..hasRequiredFields = false
  ;

  StreamOrdersRequest._() : super();
  factory StreamOrdersRequest() => create();
  factory StreamOrdersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamOrdersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  StreamOrdersRequest clone() => StreamOrdersRequest()..mergeFromMessage(this);
  StreamOrdersRequest copyWith(void Function(StreamOrdersRequest) updates) => super.copyWith((message) => updates(message as StreamOrdersRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamOrdersRequest create() => StreamOrdersRequest._();
  StreamOrdersRequest createEmptyInstance() => create();
  static $pb.PbList<StreamOrdersRequest> createRepeated() => $pb.PbList<StreamOrdersRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamOrdersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamOrdersRequest>(create);
  static StreamOrdersRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get subscriber => $_getSZ(0);
  @$pb.TagNumber(1)
  set subscriber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubscriber() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscriber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastindex => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastindex($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastindex() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastindex() => clearField(2);
}

class Submodule extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Submodule', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'modulename')
    ..aOS(2, 'status')
    ..a<$core.int>(3, 'version', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Submodule._() : super();
  factory Submodule() => create();
  factory Submodule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Submodule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Submodule clone() => Submodule()..mergeFromMessage(this);
  Submodule copyWith(void Function(Submodule) updates) => super.copyWith((message) => updates(message as Submodule));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Submodule create() => Submodule._();
  Submodule createEmptyInstance() => create();
  static $pb.PbList<Submodule> createRepeated() => $pb.PbList<Submodule>();
  @$core.pragma('dart2js:noInline')
  static Submodule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Submodule>(create);
  static Submodule _defaultInstance;

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

class Submodules extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Submodules', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..pc<Submodule>(1, 'submodule', $pb.PbFieldType.PM, subBuilder: Submodule.create)
    ..hasRequiredFields = false
  ;

  Submodules._() : super();
  factory Submodules() => create();
  factory Submodules.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Submodules.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Submodules clone() => Submodules()..mergeFromMessage(this);
  Submodules copyWith(void Function(Submodules) updates) => super.copyWith((message) => updates(message as Submodules));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Submodules create() => Submodules._();
  Submodules createEmptyInstance() => create();
  static $pb.PbList<Submodules> createRepeated() => $pb.PbList<Submodules>();
  @$core.pragma('dart2js:noInline')
  static Submodules getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Submodules>(create);
  static Submodules _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Submodule> get submodule => $_getList(0);
}

class StreamOrdersResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StreamOrdersResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'action')
    ..aOM<Order>(2, 'order', subBuilder: Order.create)
    ..aOM<Tags>(3, 'tags', subBuilder: Tags.create)
    ..aOM<Submodules>(4, 'submodules', subBuilder: Submodules.create)
    ..aOS(5, 'timestamp')
    ..hasRequiredFields = false
  ;

  StreamOrdersResponse._() : super();
  factory StreamOrdersResponse() => create();
  factory StreamOrdersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamOrdersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  StreamOrdersResponse clone() => StreamOrdersResponse()..mergeFromMessage(this);
  StreamOrdersResponse copyWith(void Function(StreamOrdersResponse) updates) => super.copyWith((message) => updates(message as StreamOrdersResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamOrdersResponse create() => StreamOrdersResponse._();
  StreamOrdersResponse createEmptyInstance() => create();
  static $pb.PbList<StreamOrdersResponse> createRepeated() => $pb.PbList<StreamOrdersResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamOrdersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamOrdersResponse>(create);
  static StreamOrdersResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get action => $_getSZ(0);
  @$pb.TagNumber(1)
  set action($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  @$pb.TagNumber(2)
  Order get order => $_getN(1);
  @$pb.TagNumber(2)
  set order(Order v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrder() => clearField(2);
  @$pb.TagNumber(2)
  Order ensureOrder() => $_ensure(1);

  @$pb.TagNumber(3)
  Tags get tags => $_getN(2);
  @$pb.TagNumber(3)
  set tags(Tags v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTags() => $_has(2);
  @$pb.TagNumber(3)
  void clearTags() => clearField(3);
  @$pb.TagNumber(3)
  Tags ensureTags() => $_ensure(2);

  @$pb.TagNumber(4)
  Submodules get submodules => $_getN(3);
  @$pb.TagNumber(4)
  set submodules(Submodules v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSubmodules() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubmodules() => clearField(4);
  @$pb.TagNumber(4)
  Submodules ensureSubmodules() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get timestamp => $_getSZ(4);
  @$pb.TagNumber(5)
  set timestamp($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestamp() => clearField(5);
}

class CreateTagRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateTagRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOM<Tag>(2, 'tag', subBuilder: Tag.create)
    ..hasRequiredFields = false
  ;

  CreateTagRequest._() : super();
  factory CreateTagRequest() => create();
  factory CreateTagRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTagRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateTagRequest clone() => CreateTagRequest()..mergeFromMessage(this);
  CreateTagRequest copyWith(void Function(CreateTagRequest) updates) => super.copyWith((message) => updates(message as CreateTagRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateTagRequest create() => CreateTagRequest._();
  CreateTagRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTagRequest> createRepeated() => $pb.PbList<CreateTagRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTagRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTagRequest>(create);
  static CreateTagRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  Tag get tag => $_getN(1);
  @$pb.TagNumber(2)
  set tag(Tag v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearTag() => clearField(2);
  @$pb.TagNumber(2)
  Tag ensureTag() => $_ensure(1);
}

class CreateTagResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateTagResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  CreateTagResponse._() : super();
  factory CreateTagResponse() => create();
  factory CreateTagResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTagResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateTagResponse clone() => CreateTagResponse()..mergeFromMessage(this);
  CreateTagResponse copyWith(void Function(CreateTagResponse) updates) => super.copyWith((message) => updates(message as CreateTagResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateTagResponse create() => CreateTagResponse._();
  CreateTagResponse createEmptyInstance() => create();
  static $pb.PbList<CreateTagResponse> createRepeated() => $pb.PbList<CreateTagResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateTagResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTagResponse>(create);
  static CreateTagResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class UpdateTagRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateTagRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOM<Tag>(2, 'tag', subBuilder: Tag.create)
    ..hasRequiredFields = false
  ;

  UpdateTagRequest._() : super();
  factory UpdateTagRequest() => create();
  factory UpdateTagRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTagRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateTagRequest clone() => UpdateTagRequest()..mergeFromMessage(this);
  UpdateTagRequest copyWith(void Function(UpdateTagRequest) updates) => super.copyWith((message) => updates(message as UpdateTagRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateTagRequest create() => UpdateTagRequest._();
  UpdateTagRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTagRequest> createRepeated() => $pb.PbList<UpdateTagRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTagRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTagRequest>(create);
  static UpdateTagRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  Tag get tag => $_getN(1);
  @$pb.TagNumber(2)
  set tag(Tag v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearTag() => clearField(2);
  @$pb.TagNumber(2)
  Tag ensureTag() => $_ensure(1);
}

class UpdateTagResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateTagResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  UpdateTagResponse._() : super();
  factory UpdateTagResponse() => create();
  factory UpdateTagResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTagResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateTagResponse clone() => UpdateTagResponse()..mergeFromMessage(this);
  UpdateTagResponse copyWith(void Function(UpdateTagResponse) updates) => super.copyWith((message) => updates(message as UpdateTagResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateTagResponse create() => UpdateTagResponse._();
  UpdateTagResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateTagResponse> createRepeated() => $pb.PbList<UpdateTagResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateTagResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTagResponse>(create);
  static UpdateTagResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class DeleteTagRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteTagRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOM<Tag>(2, 'tag', subBuilder: Tag.create)
    ..hasRequiredFields = false
  ;

  DeleteTagRequest._() : super();
  factory DeleteTagRequest() => create();
  factory DeleteTagRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTagRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeleteTagRequest clone() => DeleteTagRequest()..mergeFromMessage(this);
  DeleteTagRequest copyWith(void Function(DeleteTagRequest) updates) => super.copyWith((message) => updates(message as DeleteTagRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteTagRequest create() => DeleteTagRequest._();
  DeleteTagRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteTagRequest> createRepeated() => $pb.PbList<DeleteTagRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteTagRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTagRequest>(create);
  static DeleteTagRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  Tag get tag => $_getN(1);
  @$pb.TagNumber(2)
  set tag(Tag v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearTag() => clearField(2);
  @$pb.TagNumber(2)
  Tag ensureTag() => $_ensure(1);
}

class DeleteTagResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteTagResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  DeleteTagResponse._() : super();
  factory DeleteTagResponse() => create();
  factory DeleteTagResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTagResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeleteTagResponse clone() => DeleteTagResponse()..mergeFromMessage(this);
  DeleteTagResponse copyWith(void Function(DeleteTagResponse) updates) => super.copyWith((message) => updates(message as DeleteTagResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteTagResponse create() => DeleteTagResponse._();
  DeleteTagResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteTagResponse> createRepeated() => $pb.PbList<DeleteTagResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteTagResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTagResponse>(create);
  static DeleteTagResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class CreateSubmoduleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateSubmoduleRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOM<Submodule>(2, 'submodule', subBuilder: Submodule.create)
    ..hasRequiredFields = false
  ;

  CreateSubmoduleRequest._() : super();
  factory CreateSubmoduleRequest() => create();
  factory CreateSubmoduleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSubmoduleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateSubmoduleRequest clone() => CreateSubmoduleRequest()..mergeFromMessage(this);
  CreateSubmoduleRequest copyWith(void Function(CreateSubmoduleRequest) updates) => super.copyWith((message) => updates(message as CreateSubmoduleRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateSubmoduleRequest create() => CreateSubmoduleRequest._();
  CreateSubmoduleRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSubmoduleRequest> createRepeated() => $pb.PbList<CreateSubmoduleRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSubmoduleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSubmoduleRequest>(create);
  static CreateSubmoduleRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  Submodule get submodule => $_getN(1);
  @$pb.TagNumber(2)
  set submodule(Submodule v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubmodule() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubmodule() => clearField(2);
  @$pb.TagNumber(2)
  Submodule ensureSubmodule() => $_ensure(1);
}

class CreateSubmoduleResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateSubmoduleResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  CreateSubmoduleResponse._() : super();
  factory CreateSubmoduleResponse() => create();
  factory CreateSubmoduleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSubmoduleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateSubmoduleResponse clone() => CreateSubmoduleResponse()..mergeFromMessage(this);
  CreateSubmoduleResponse copyWith(void Function(CreateSubmoduleResponse) updates) => super.copyWith((message) => updates(message as CreateSubmoduleResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateSubmoduleResponse create() => CreateSubmoduleResponse._();
  CreateSubmoduleResponse createEmptyInstance() => create();
  static $pb.PbList<CreateSubmoduleResponse> createRepeated() => $pb.PbList<CreateSubmoduleResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateSubmoduleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSubmoduleResponse>(create);
  static CreateSubmoduleResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class UpdateSubmoduleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateSubmoduleRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOM<Submodule>(2, 'submodule', subBuilder: Submodule.create)
    ..hasRequiredFields = false
  ;

  UpdateSubmoduleRequest._() : super();
  factory UpdateSubmoduleRequest() => create();
  factory UpdateSubmoduleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSubmoduleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateSubmoduleRequest clone() => UpdateSubmoduleRequest()..mergeFromMessage(this);
  UpdateSubmoduleRequest copyWith(void Function(UpdateSubmoduleRequest) updates) => super.copyWith((message) => updates(message as UpdateSubmoduleRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSubmoduleRequest create() => UpdateSubmoduleRequest._();
  UpdateSubmoduleRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSubmoduleRequest> createRepeated() => $pb.PbList<UpdateSubmoduleRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSubmoduleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSubmoduleRequest>(create);
  static UpdateSubmoduleRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  Submodule get submodule => $_getN(1);
  @$pb.TagNumber(2)
  set submodule(Submodule v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubmodule() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubmodule() => clearField(2);
  @$pb.TagNumber(2)
  Submodule ensureSubmodule() => $_ensure(1);
}

class UpdateSubmoduleResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateSubmoduleResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  UpdateSubmoduleResponse._() : super();
  factory UpdateSubmoduleResponse() => create();
  factory UpdateSubmoduleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSubmoduleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateSubmoduleResponse clone() => UpdateSubmoduleResponse()..mergeFromMessage(this);
  UpdateSubmoduleResponse copyWith(void Function(UpdateSubmoduleResponse) updates) => super.copyWith((message) => updates(message as UpdateSubmoduleResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSubmoduleResponse create() => UpdateSubmoduleResponse._();
  UpdateSubmoduleResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSubmoduleResponse> createRepeated() => $pb.PbList<UpdateSubmoduleResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSubmoduleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSubmoduleResponse>(create);
  static UpdateSubmoduleResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class DeleteSubmoduleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteSubmoduleRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOM<Submodule>(2, 'submodule', subBuilder: Submodule.create)
    ..hasRequiredFields = false
  ;

  DeleteSubmoduleRequest._() : super();
  factory DeleteSubmoduleRequest() => create();
  factory DeleteSubmoduleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSubmoduleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeleteSubmoduleRequest clone() => DeleteSubmoduleRequest()..mergeFromMessage(this);
  DeleteSubmoduleRequest copyWith(void Function(DeleteSubmoduleRequest) updates) => super.copyWith((message) => updates(message as DeleteSubmoduleRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteSubmoduleRequest create() => DeleteSubmoduleRequest._();
  DeleteSubmoduleRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSubmoduleRequest> createRepeated() => $pb.PbList<DeleteSubmoduleRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSubmoduleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSubmoduleRequest>(create);
  static DeleteSubmoduleRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  Submodule get submodule => $_getN(1);
  @$pb.TagNumber(2)
  set submodule(Submodule v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubmodule() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubmodule() => clearField(2);
  @$pb.TagNumber(2)
  Submodule ensureSubmodule() => $_ensure(1);
}

class DeleteSubmoduleResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteSubmoduleResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  DeleteSubmoduleResponse._() : super();
  factory DeleteSubmoduleResponse() => create();
  factory DeleteSubmoduleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSubmoduleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeleteSubmoduleResponse clone() => DeleteSubmoduleResponse()..mergeFromMessage(this);
  DeleteSubmoduleResponse copyWith(void Function(DeleteSubmoduleResponse) updates) => super.copyWith((message) => updates(message as DeleteSubmoduleResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteSubmoduleResponse create() => DeleteSubmoduleResponse._();
  DeleteSubmoduleResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteSubmoduleResponse> createRepeated() => $pb.PbList<DeleteSubmoduleResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteSubmoduleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSubmoduleResponse>(create);
  static DeleteSubmoduleResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class UpdateOrderStatusRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateOrderStatusRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOS(2, 'status')
    ..hasRequiredFields = false
  ;

  UpdateOrderStatusRequest._() : super();
  factory UpdateOrderStatusRequest() => create();
  factory UpdateOrderStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateOrderStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateOrderStatusRequest clone() => UpdateOrderStatusRequest()..mergeFromMessage(this);
  UpdateOrderStatusRequest copyWith(void Function(UpdateOrderStatusRequest) updates) => super.copyWith((message) => updates(message as UpdateOrderStatusRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateOrderStatusRequest create() => UpdateOrderStatusRequest._();
  UpdateOrderStatusRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateOrderStatusRequest> createRepeated() => $pb.PbList<UpdateOrderStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateOrderStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateOrderStatusRequest>(create);
  static UpdateOrderStatusRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class UpdateOrderStatusResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateOrderStatusResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  UpdateOrderStatusResponse._() : super();
  factory UpdateOrderStatusResponse() => create();
  factory UpdateOrderStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateOrderStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateOrderStatusResponse clone() => UpdateOrderStatusResponse()..mergeFromMessage(this);
  UpdateOrderStatusResponse copyWith(void Function(UpdateOrderStatusResponse) updates) => super.copyWith((message) => updates(message as UpdateOrderStatusResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateOrderStatusResponse create() => UpdateOrderStatusResponse._();
  UpdateOrderStatusResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateOrderStatusResponse> createRepeated() => $pb.PbList<UpdateOrderStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateOrderStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateOrderStatusResponse>(create);
  static UpdateOrderStatusResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class UpdateOrderQtyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateOrderQtyRequest', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOM<DecimalValue>(2, 'qty', subBuilder: DecimalValue.create)
    ..hasRequiredFields = false
  ;

  UpdateOrderQtyRequest._() : super();
  factory UpdateOrderQtyRequest() => create();
  factory UpdateOrderQtyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateOrderQtyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateOrderQtyRequest clone() => UpdateOrderQtyRequest()..mergeFromMessage(this);
  UpdateOrderQtyRequest copyWith(void Function(UpdateOrderQtyRequest) updates) => super.copyWith((message) => updates(message as UpdateOrderQtyRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateOrderQtyRequest create() => UpdateOrderQtyRequest._();
  UpdateOrderQtyRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateOrderQtyRequest> createRepeated() => $pb.PbList<UpdateOrderQtyRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateOrderQtyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateOrderQtyRequest>(create);
  static UpdateOrderQtyRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  DecimalValue get qty => $_getN(1);
  @$pb.TagNumber(2)
  set qty(DecimalValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasQty() => $_has(1);
  @$pb.TagNumber(2)
  void clearQty() => clearField(2);
  @$pb.TagNumber(2)
  DecimalValue ensureQty() => $_ensure(1);
}

class UpdateOrderQtyResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateOrderQtyResponse', package: const $pb.PackageName('orders'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  UpdateOrderQtyResponse._() : super();
  factory UpdateOrderQtyResponse() => create();
  factory UpdateOrderQtyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateOrderQtyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateOrderQtyResponse clone() => UpdateOrderQtyResponse()..mergeFromMessage(this);
  UpdateOrderQtyResponse copyWith(void Function(UpdateOrderQtyResponse) updates) => super.copyWith((message) => updates(message as UpdateOrderQtyResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateOrderQtyResponse create() => UpdateOrderQtyResponse._();
  UpdateOrderQtyResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateOrderQtyResponse> createRepeated() => $pb.PbList<UpdateOrderQtyResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateOrderQtyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateOrderQtyResponse>(create);
  static UpdateOrderQtyResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

