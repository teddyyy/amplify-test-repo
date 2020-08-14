import 'package:cloud_energy/model/provider.dart';
import 'package:cloud_energy/widgets/detail_widget.dart';
import 'package:cloud_energy/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class TopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TopPage();
}

class _TopPage extends State<TopPage> {
  bool isLargeScreen = false;
  Provider _selectedValue = null;
  TextEditingController editingController = TextEditingController();

  Widget _searchTextField() {
    // TODO 検索機能は別途外だししたほうが良さそう
    return TextField(
      onChanged: (value) {
        // filterSearchResults(value);
      },
      controller: editingController,
      decoration: InputDecoration(
        labelText: "Search for provider...",
        hintText: "Search for provider...",
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  Widget _addProviderBtn() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.0),
          child: Text(
            '事業者追加',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          // centerTitle: true,

          title: Align(
              alignment: Alignment.centerLeft,
              child: Text('Cloud Energy', textAlign: TextAlign.left)),
          leading: new IconButton(
            icon: new Icon(Icons.cloud, color: Colors.grey[300]),
            onPressed: () {},
          ),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          isLargeScreen = MediaQuery.of(context).size.width > 600;
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _searchTextField(),
                    Flexible(
                        flex: 10,
                        child: Container(
                          child: ListWidget.create(
                            (value) {
                              if (isLargeScreen) {
                                _selectedValue = value;
                                setState(() {});
                              } else {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailWidget(value);
                                }));
                              }
                            },
                          ),
                        )),
                    _addProviderBtn()
                  ],
                ),
              ),
              isLargeScreen
                  ? Expanded(
                      flex: 7,
                      child: DetailWidget(_selectedValue),
                    )
                  : Container()
            ],
          );
        }));
  }
}
