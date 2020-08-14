import 'package:cloud_energy/model/provider.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {
  final Provider data;

  DetailWidget(this.data);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  Widget _akkContracted() {
    return Container(
        margin: EdgeInsets.fromLTRB(64.0, 20, 64, 0),
        child: Container(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12)),
                ),
                child: Column(children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 300.0,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: Text('かんたん決済',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black38,
                          ),
                          onPressed: () async {
                            var result = await showDialog<int>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return akkDialog();
                              },
                            );
                            print('dialog result: $result');
                            // --
                          },
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text('未加入',
                      style: Theme.of(context).textTheme.bodyText1)),
            ],
          ),
        ));
  }

  Widget _loogiaContracted() {
    return Container(
        margin: EdgeInsets.fromLTRB(64.0, 20, 64, 0),
        child: Container(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12)),
                ),
                child: Column(children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 300.0,
                        child: Text('Loogia',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black38,
                          ),
                          onPressed: () async {
                            var result = await showDialog<int>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return loogiaDialog();
                              },
                            );
                            print('dialog result: $result');
                            // --
                          },
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                          child: Text('有効',
                              style: Theme.of(context).textTheme.bodyText1)),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                          child: Text('APP ID: xxxxxxxxxxxxx',
                              style: Theme.of(context).textTheme.bodyText1)),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                          child: Text('API KEY: xxxxxxxxxxxxx',
                              style: Theme.of(context).textTheme.bodyText1)),
                    ]),
              ),
            ],
          ),
        ));
  }

  Widget _plusMessageContracted() {
    return Container(
        margin: EdgeInsets.fromLTRB(64.0, 20, 64, 0),
        child: Container(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12)),
                ),
                child: Column(children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 300.0,
                        child: Text('プラスメッセージ',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black38,
                          ),
                          onPressed: () async {
                            var result = await showDialog<int>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return plusMessageDialog();
                              },
                            );
                            print('dialog result: $result');
                            // --
                          },
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text('無効', style: Theme.of(context).textTheme.bodyText1),
              ),
            ],
          ),
        ));
  }

  AlertDialog deleteDialog() {
    return AlertDialog(
      title: Text('確認'),
      content: Container(
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('事業者を削除します。'),
            Text('削除された事業者は復帰できませんがよろしいでしょうか？'),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(0),
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: () => Navigator.of(context).pop(1),
        ),
      ],
    );
  }

  AlertDialog akkDialog() {
    return AlertDialog(
      title: Text('かんたん決済設定'),
      content: Container(
        height: 200,
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'かんたん決済用加盟店ID',
                labelText: 'かんたん決済用加盟店ID *',
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'かんたん決済用サービスID	',
                labelText: 'かんたん決済用サービスID *',
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'かんたん決済用セキュアキー	',
                labelText: 'かんたん決済用セキュアキー *',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('キャンセル'),
          onPressed: () => Navigator.of(context).pop(0),
        ),
        FlatButton(
          child: Text('更新'),
          onPressed: () => Navigator.of(context).pop(1),
        ),
      ],
    );
  }

  AlertDialog loogiaDialog() {
    return AlertDialog(
      title: Text('Loogia'),
      content: Container(
        height: 200,
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Loogia App Id',
                labelText: 'Loogia App Id *',
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Loogia Api Key	',
                labelText: 'Loogia Api Key *',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('キャンセル'),
          onPressed: () => Navigator.of(context).pop(0),
        ),
        FlatButton(
          child: Text('更新'),
          onPressed: () => Navigator.of(context).pop(1),
        ),
      ],
    );
  }

  AlertDialog plusMessageDialog() {
    return AlertDialog(
      title: Text('Loogia'),
      content: Container(
        height: 200,
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'APIトークン',
                labelText: 'APIトークン *',
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'プラスメッセージ用事業者コード	',
                labelText: 'プラスメッセージ用事業者コード *',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('キャンセル'),
          onPressed: () => Navigator.of(context).pop(0),
        ),
        FlatButton(
          child: Text('更新'),
          onPressed: () => Navigator.of(context).pop(1),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double sideMargin = MediaQuery.of(context).size.width < 600 ? 16 : 24;
    return Container(
      constraints: BoxConstraints.expand(),
      // color: Color(0xFF707070),
      color: Colors.grey[300],
      child: Card(
        margin: EdgeInsets.all(sideMargin),
        child: widget.data == null
            ? Align(
                alignment: Alignment.center,
                child: Container(
                    child: Text('表示したい事業者を選択してください。',
                        style: Theme.of(context).textTheme.bodyText1)))
            : Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(28.0, 20, 64, 0),
                        child: Row(children: [
                          Image.asset(
                            'images/labit.png',
                            width: 56,
                          ),
                          Text(
                            widget.data.name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ]),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.all(26),
                        child: IconButton(
                          icon: Icon(Icons.delete, color: Colors.black38),
                          onPressed: () async {
                            // ダイア��グを表示------------------------------------
                            var result = await showDialog<int>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return deleteDialog();
                              },
                            );
                            print('dialog result: $result');
                            // --
                          },
                        ),
                      ),
                    ],
                  ),
                  Align(alignment: Alignment.topLeft, child: _akkContracted()),
                  Align(
                      alignment: Alignment.topLeft, child: _loogiaContracted()),
                  Align(
                      alignment: Alignment.topLeft,
                      child: _plusMessageContracted()),
                ],
              ),
      ),
    );
  }
}
