///
//  Generated code. Do not modify.
//  source: devices.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const OrderC$json = const {
  '1': 'OrderC',
  '2': const [
    const {'1': 'ordersId', '3': 1, '4': 3, '5': 3, '10': 'ordersId'},
    const {'1': 'tenantId', '3': 2, '4': 3, '5': 9, '10': 'tenantId'},
    const {'1': 'sourceId', '3': 3, '4': 3, '5': 9, '10': 'sourceId'},
    const {'1': 'sourceTrackingId', '3': 4, '4': 3, '5': 9, '10': 'sourceTrackingId'},
    const {'1': 'sourceBatch', '3': 5, '4': 3, '5': 9, '10': 'sourceBatch'},
    const {'1': 'pluId', '3': 6, '4': 3, '5': 9, '10': 'pluId'},
    const {'1': 'pluText', '3': 7, '4': 3, '5': 9, '10': 'pluText'},
    const {'1': 'qty', '3': 8, '4': 3, '5': 2, '10': 'qty'},
    const {'1': 'status', '3': 9, '4': 3, '5': 9, '10': 'status'},
    const {'1': 'uuid', '3': 10, '4': 3, '5': 9, '10': 'uuid'},
    const {'1': 'version', '3': 11, '4': 3, '5': 13, '10': 'version'},
    const {'1': 'orderType', '3': 12, '4': 3, '5': 9, '10': 'orderType'},
    const {'1': 'parentUuid', '3': 13, '4': 3, '5': 9, '10': 'parentUuid'},
    const {'1': 'timestamp', '3': 16, '4': 3, '5': 9, '10': 'timestamp'},
  ],
};

const TagC$json = const {
  '1': 'TagC',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'version', '3': 3, '4': 1, '5': 13, '10': 'version'},
  ],
};

const SubmoduleC$json = const {
  '1': 'SubmoduleC',
  '2': const [
    const {'1': 'modulename', '3': 1, '4': 1, '5': 9, '10': 'modulename'},
    const {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'version', '3': 3, '4': 1, '5': 13, '10': 'version'},
  ],
};

const DeviceConfig$json = const {
  '1': 'DeviceConfig',
  '2': const [
    const {'1': 'action', '3': 1, '4': 1, '5': 9, '10': 'action'},
    const {'1': 'order', '3': 2, '4': 1, '5': 11, '6': '.devices.OrderC', '10': 'order'},
    const {'1': 'tag', '3': 3, '4': 3, '5': 11, '6': '.devices.TagC', '10': 'tag'},
    const {'1': 'submodule', '3': 4, '4': 3, '5': 11, '6': '.devices.SubmoduleC', '10': 'submodule'},
    const {'1': 'subscript', '3': 5, '4': 3, '5': 13, '10': 'subscript'},
    const {'1': 'fifo', '3': 6, '4': 1, '5': 8, '10': 'fifo'},
    const {'1': 'timestamp', '3': 7, '4': 1, '5': 9, '10': 'timestamp'},
  ],
};

const DeviceConfigResponse$json = const {
  '1': 'DeviceConfigResponse',
  '2': const [
    const {'1': 'config', '3': 1, '4': 1, '5': 11, '6': '.devices.DeviceConfig', '10': 'config'},
  ],
};

const CreateDeviceConfigRequest$json = const {
  '1': 'CreateDeviceConfigRequest',
  '2': const [
    const {'1': 'deviceUuid', '3': 1, '4': 1, '5': 9, '10': 'deviceUuid'},
    const {'1': 'config', '3': 2, '4': 1, '5': 11, '6': '.devices.DeviceConfig', '10': 'config'},
  ],
};

const GetDeviceConfigRequest$json = const {
  '1': 'GetDeviceConfigRequest',
  '2': const [
    const {'1': 'deviceUuid', '3': 1, '4': 1, '5': 9, '10': 'deviceUuid'},
  ],
};

const StreamDeviceConfigRequest$json = const {
  '1': 'StreamDeviceConfigRequest',
  '2': const [
    const {'1': 'deviceUuid', '3': 1, '4': 1, '5': 9, '10': 'deviceUuid'},
    const {'1': 'lastindex', '3': 2, '4': 1, '5': 9, '10': 'lastindex'},
  ],
};

