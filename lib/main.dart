import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_6/data_nested_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Nested List View'),
    routes: <String,WidgetBuilder>{
      '/nested':(BuildContext context) => new DataNestedListScreen(),
    }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> agama = ["Islam","Kristen Katolik","Kristen Protestan","Hindu","Budha"];
  String _agama="Islam";

  String _jk="";

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerMoto = new TextEditingController();

  void _pilihJk(String value){
    setState(() {
      _jk = value;
    });
  }

  void pilihAgama(String value){
    setState(() {
      _agama = value;
    });
  }

  void kirimdata(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: [
            Text("Nama Lengkap : ${controllerNama.text}"),
            Text("Password : ${controllerPass.text}"),
            Text("Moto Hidup : ${controllerMoto.text}"),
            Text("Jenis Kelamin : $_jk}"),
            Text("Agama : $_agama"),
            RaisedButton(
              child: new Text("OK"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
    showDialog(context: context,child: alertDialog);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("WELCOME"),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Nested List View"),
              trailing: new Icon(Icons.info),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/nested');
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0),),
                TextField(
                  controller: controllerPass,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0),),
                TextField(
                  controller: controllerMoto,
                  maxLines: 3,
                  decoration: InputDecoration(
                      hintText: "Motto Hidup",
                      labelText: "Motto Hidup",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0),),
                RadioListTile(
                  value: "Laki-laki",
                  title: Text("Laki-laki"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.orange,
                  subtitle: Text("Pilih ini jika anda Laki-laki"),
                ),
                RadioListTile(
                  value: "Perempuan",
                  title: Text("Perempuan"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.orange,
                  subtitle: Text("Pilih ini jika anda Perempuan"),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0),),
                Row(
                  children: [
                    Text("Agama ",style: TextStyle(fontSize: 18.0,color: Colors.blue),),
                    DropdownButton(
                      onChanged: (String value){
                        pilihAgama(value);
                      },
                      value: _agama,
                      items:
                        agama.map((String value){
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    )
                  ],
                ),
                RaisedButton(
                  child: Text("OK"),
                  color: Colors.orange,
                  onPressed: (){
                    kirimdata();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
