library qms_device;

String tenantId = "";
String path = "";
List<String> qmsType = ["Single Tenant", "Multi Tenant"];
String filterTenant = "";

//String orderProxyHost = "10.200.200.50";
//String orderProxyHost = "192.168.0.223";
//int orderProxyPort = 50051;
String orderProxyHost = "";
int orderProxyPort;
int deviceConfigPort = 50053;
String orderProxyToken = "Ke4yu5b3snd3zBlY7GtX7MHrFclvh9qLDB0Q-j6EyXM";
String uuidResp = "";