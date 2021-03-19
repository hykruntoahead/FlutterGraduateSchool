
import 'package:flutter/material.dart';
// dara table 排序
class User{
  User(this.name,this.age);

  final String name;
  final int age;
}

List<User> data = [
  User('lm', 18),
  User('lm1', 19),
  User('lm2', 20),
  User('lm3', 21),
  User('lm4', 22),
];

var _sortAscending = true;
var _sortColumnIndex =0;

class SortDataTableDemo extends StatefulWidget{
  @override
  SortDataTableState createState() =>SortDataTableState();
}

class SortDataTableState extends State<SortDataTableDemo>{
  @override
  Widget build(BuildContext context) {
    return _buildDataTable(context);
  }

  Widget _buildDataTable(BuildContext context) {
    return DataTable(
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,
        columns: [
          DataColumn(label: Text('姓名'),
              onSort: (int columnIndex, bool ascending){
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = ascending;
                  if(ascending){
                    data.sort((a,b) => a.name.compareTo(b.name));
                  }else{
                    data.sort((a,b) => b.name.compareTo(a.name));
                  }
                });
              }),
          DataColumn(label: Text('年龄'),
          onSort: (int columnIndex, bool ascending){
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if(ascending){
                data.sort((a,b) => a.age.compareTo(b.age));
              }else{
                data.sort((a,b) => b.age.compareTo(a.age));
              }
            });
          })
        ], rows: data.map((user){
          return DataRow(cells: [
            DataCell(Text('${user.name}')),
            DataCell(Text('${user.age}'))
          ]);
    }).toList()
    );
  }
}