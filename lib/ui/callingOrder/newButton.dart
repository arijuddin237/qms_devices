import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocSetting.dart';
import 'package:fixnum/fixnum.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/model/fontSize.dart';
import 'package:qms_device/model/setting.dart';
import 'package:qms_device/model/sourceBatch.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/service/orderService.dart';


class NewButton extends StatelessWidget {
  @required final FontSize fontSize;

  const NewButton({Key key, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Setting>(
      stream: blocSetting.subject.stream,
      builder: (context, snapshotSetting){
        if(!snapshotSetting.hasData){
          return Container();
        }
        blocSetting.getSourceBatch(
          snapshotSetting.data.tenantId
        );
        return StreamBuilder<SourceBatch>(
          stream: blocSetting.sourceBatch.stream,
          builder: (context, snapSource){
            return RaisedButton(
              color: Colors.white,
              elevation: 0.0,
              child: Container(
                height: SizeConfig.safeBlockVertical * 28,
                width: SizeConfig.safeBlockHorizontal * 12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add, size: fontSize.fontSize6),
                    Text('New', style: TextStyle(
                      fontSize: fontSize.fontSize8,
                      fontWeight: FontWeight.bold
                    ))
                  ],
                ),
              ),
              onPressed: (){
                OrderService().createOrder(
                  tenantId: snapshotSetting.data.tenantId,
                  sourceId: 'POS01',
                  sourceBatch: (!snapSource.hasData)
                    ? '1'
                    : '${snapSource.data.sourceBatch+1}',
                    sourceTrackingId: 'QMS',
                    pluId: 'QMS',
                    pluText: 'QMS',
                    qty: DecimalValue()
                      ..units = Int64(0)
                      ..nanos = 0,
                    status: 'new',
                    tags: Tags(),
                    submodules: Submodules()
                ).then((data){
                  print(data.status);
                }).catchError((e){
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text(e.message.message.toString()),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Close'),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    }
                  );
                });
              },
            );
          },
        );
      },
    );
  }
}