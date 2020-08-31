import 'package:flutter/material.dart';

class TableTask extends StatefulWidget {
  TableTask({Key key}) : super(key: key);

  @override
  _TableTaskState createState() => _TableTaskState();
}

class _TableTaskState extends State<TableTask> {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Column(
              children: [
                Text(
                  'first-row-1',
                  style: TextStyle(
                    fontSize: 16
                  )
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'first-row-2',
                  style: TextStyle(
                    fontSize: 16
                  )
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'first-row-3',
                  style: TextStyle(
                    fontSize: 16
                  )
                )
              ],
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Column(
              children: [
                Text(
                  'second-row-1',
                  style: TextStyle(
                    fontSize: 16
                  )
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'second-row-2',
                  style: TextStyle(
                    fontSize: 16
                  )
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'second-row-3',
                  style: TextStyle(
                    fontSize: 16
                  )
                )
              ],
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Column(
              children: [
                Text(
                  'three-row-1',
                  style: TextStyle(
                    fontSize: 16
                  )
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'three-row-2',
                  style: TextStyle(
                    fontSize: 16
                  )
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'three-row-3',
                  style: TextStyle(
                    fontSize: 16
                  )
                )
              ],
            ),
          ],
        ),
      ],
      columnWidths: <int, TableColumnWidth>{
        0: FixedColumnWidth(100.0),
        1: FixedColumnWidth(60.0),
        2: FixedColumnWidth(100.0),
      },
      border: TableBorder.all(
        color: Color(0xffdddddd),
        width: 1.0,
        style: BorderStyle.solid
      ),
    );
  }
}