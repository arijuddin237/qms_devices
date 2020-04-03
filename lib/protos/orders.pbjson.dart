///
//  Generated code. Do not modify.
//  source: orders.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const DecimalValue$json = const {
  '1': 'DecimalValue',
  '2': const [
    const {'1': 'units', '3': 1, '4': 1, '5': 18, '10': 'units'},
    const {'1': 'nanos', '3': 2, '4': 1, '5': 17, '10': 'nanos'},
  ],
};

const Tag$json = const {
  '1': 'Tag',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'version', '3': 3, '4': 1, '5': 13, '10': 'version'},
  ],
};

const Tags$json = const {
  '1': 'Tags',
  '2': const [
    const {'1': 'tag', '3': 1, '4': 3, '5': 11, '6': '.orders.Tag', '10': 'tag'},
  ],
};

const Order$json = const {
  '1': 'Order',
  '2': const [
    const {'1': 'ordersId', '3': 1, '4': 1, '5': 3, '10': 'ordersId'},
    const {'1': 'tenantId', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    const {'1': 'sourceId', '3': 3, '4': 1, '5': 9, '10': 'sourceId'},
    const {'1': 'sourceTrackingId', '3': 4, '4': 1, '5': 9, '10': 'sourceTrackingId'},
    const {'1': 'sourceBatch', '3': 5, '4': 1, '5': 9, '10': 'sourceBatch'},
    const {'1': 'pluId', '3': 6, '4': 1, '5': 9, '10': 'pluId'},
    const {'1': 'pluText', '3': 7, '4': 1, '5': 9, '10': 'pluText'},
    const {'1': 'qty', '3': 8, '4': 1, '5': 11, '6': '.orders.DecimalValue', '10': 'qty'},
    const {'1': 'status', '3': 9, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'uuid', '3': 10, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'version', '3': 11, '4': 1, '5': 13, '10': 'version'},
    const {'1': 'orderType', '3': 12, '4': 1, '5': 9, '10': 'orderType'},
    const {'1': 'parentUuid', '3': 13, '4': 1, '5': 9, '10': 'parentUuid'},
    const {'1': 'tags', '3': 14, '4': 1, '5': 11, '6': '.orders.Tags', '10': 'tags'},
    const {'1': 'submodules', '3': 15, '4': 1, '5': 11, '6': '.orders.Submodules', '10': 'submodules'},
    const {'1': 'timestamp', '3': 16, '4': 1, '5': 9, '10': 'timestamp'},
  ],
};

const GetOrderRequest$json = const {
  '1': 'GetOrderRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

const CreateOrderResponse$json = const {
  '1': 'CreateOrderResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

const GetTagRequest$json = const {
  '1': 'GetTagRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'tagId', '3': 2, '4': 1, '5': 9, '10': 'tagId'},
  ],
};

const GetTagResponse$json = const {
  '1': 'GetTagResponse',
  '2': const [
    const {'1': 'tags', '3': 1, '4': 1, '5': 11, '6': '.orders.Tags', '10': 'tags'},
  ],
};

const GetSubmoduleRequest$json = const {
  '1': 'GetSubmoduleRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'submodule', '3': 2, '4': 1, '5': 9, '10': 'submodule'},
  ],
};

const GetSubmoduleResponse$json = const {
  '1': 'GetSubmoduleResponse',
  '2': const [
    const {'1': 'submodules', '3': 1, '4': 1, '5': 11, '6': '.orders.Submodules', '10': 'submodules'},
  ],
};

const GetOrderWithRequest$json = const {
  '1': 'GetOrderWithRequest',
  '2': const [
    const {'1': 'order', '3': 1, '4': 1, '5': 11, '6': '.orders.Order', '10': 'order'},
    const {'1': 'tags', '3': 2, '4': 1, '5': 11, '6': '.orders.Tags', '10': 'tags'},
    const {'1': 'submodules', '3': 3, '4': 1, '5': 11, '6': '.orders.Submodules', '10': 'submodules'},
  ],
};

const OrderHistory$json = const {
  '1': 'OrderHistory',
  '2': const [
    const {'1': 'eventsId', '3': 1, '4': 1, '5': 3, '10': 'eventsId'},
    const {'1': 'index', '3': 2, '4': 1, '5': 9, '10': 'index'},
    const {'1': 'uuid', '3': 3, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'json', '3': 4, '4': 1, '5': 9, '10': 'json'},
  ],
};

const CreateUuidRequest$json = const {
  '1': 'CreateUuidRequest',
  '2': const [
    const {'1': 'sourceId', '3': 1, '4': 1, '5': 9, '10': 'sourceId'},
  ],
};

const CreateUuidResponse$json = const {
  '1': 'CreateUuidResponse',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

const streamOrdersRequest$json = const {
  '1': 'streamOrdersRequest',
  '2': const [
    const {'1': 'subscriber', '3': 1, '4': 1, '5': 9, '10': 'subscriber'},
    const {'1': 'lastindex', '3': 2, '4': 1, '5': 9, '10': 'lastindex'},
  ],
};

const Submodule$json = const {
  '1': 'Submodule',
  '2': const [
    const {'1': 'modulename', '3': 1, '4': 1, '5': 9, '10': 'modulename'},
    const {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'version', '3': 3, '4': 1, '5': 13, '10': 'version'},
  ],
};

const Submodules$json = const {
  '1': 'Submodules',
  '2': const [
    const {'1': 'submodule', '3': 1, '4': 3, '5': 11, '6': '.orders.Submodule', '10': 'submodule'},
  ],
};

const StreamOrdersResponse$json = const {
  '1': 'StreamOrdersResponse',
  '2': const [
    const {'1': 'action', '3': 1, '4': 1, '5': 9, '10': 'action'},
    const {'1': 'order', '3': 2, '4': 1, '5': 11, '6': '.orders.Order', '10': 'order'},
    const {'1': 'tags', '3': 3, '4': 1, '5': 11, '6': '.orders.Tags', '10': 'tags'},
    const {'1': 'submodules', '3': 4, '4': 1, '5': 11, '6': '.orders.Submodules', '10': 'submodules'},
    const {'1': 'timestamp', '3': 5, '4': 1, '5': 9, '10': 'timestamp'},
  ],
};

const CreateTagRequest$json = const {
  '1': 'CreateTagRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'tag', '3': 2, '4': 1, '5': 11, '6': '.orders.Tag', '10': 'tag'},
  ],
};

const CreateTagResponse$json = const {
  '1': 'CreateTagResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

const UpdateTagRequest$json = const {
  '1': 'UpdateTagRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'tag', '3': 2, '4': 1, '5': 11, '6': '.orders.Tag', '10': 'tag'},
  ],
};

const UpdateTagResponse$json = const {
  '1': 'UpdateTagResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

const DeleteTagRequest$json = const {
  '1': 'DeleteTagRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'tag', '3': 2, '4': 1, '5': 11, '6': '.orders.Tag', '10': 'tag'},
  ],
};

const DeleteTagResponse$json = const {
  '1': 'DeleteTagResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

const CreateSubmoduleRequest$json = const {
  '1': 'CreateSubmoduleRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'submodule', '3': 2, '4': 1, '5': 11, '6': '.orders.Submodule', '10': 'submodule'},
  ],
};

const CreateSubmoduleResponse$json = const {
  '1': 'CreateSubmoduleResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

const UpdateSubmoduleRequest$json = const {
  '1': 'UpdateSubmoduleRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'submodule', '3': 2, '4': 1, '5': 11, '6': '.orders.Submodule', '10': 'submodule'},
  ],
};

const UpdateSubmoduleResponse$json = const {
  '1': 'UpdateSubmoduleResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

const DeleteSubmoduleRequest$json = const {
  '1': 'DeleteSubmoduleRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'submodule', '3': 2, '4': 1, '5': 11, '6': '.orders.Submodule', '10': 'submodule'},
  ],
};

const DeleteSubmoduleResponse$json = const {
  '1': 'DeleteSubmoduleResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

const UpdateOrderStatusRequest$json = const {
  '1': 'UpdateOrderStatusRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

const UpdateOrderStatusResponse$json = const {
  '1': 'UpdateOrderStatusResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

const UpdateOrderQtyRequest$json = const {
  '1': 'UpdateOrderQtyRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'qty', '3': 2, '4': 1, '5': 11, '6': '.orders.DecimalValue', '10': 'qty'},
  ],
};

const UpdateOrderQtyResponse$json = const {
  '1': 'UpdateOrderQtyResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

