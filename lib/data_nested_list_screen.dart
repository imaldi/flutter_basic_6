import 'package:flutter/cupertino.dart';
import 'package:flutter_basic_6/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class DataNestedListScreen extends StatefulWidget {
  @override
  _DataNestedListScreenState createState() => _DataNestedListScreenState();
}

class _DataNestedListScreenState extends State<DataNestedListScreen> {
  //Proses pengambilan data
  List<UserModel> listModel = [];
  var loading = false;

  Future<Null> getData() async{
    setState(() {
      loading = true;
    });

    final responseData = await http.get("https://jsonplaceholder.typicode.com/users");
    //cek status response
    if(responseData.statusCode == 200){
      final data = jsonDecode(responseData.body);
      setState(() {
        for(Map i in data){
          //menambahkan data json ke list
          listModel.add(UserModel.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Nested List Page'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: loading ? Center(
          child: CircularProgressIndicator(),)
            : ListView.builder(
            itemCount: listModel.length,
            itemBuilder: (context,i){
              final nList = listModel[i];
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nList.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.green),),
                    Text(nList.email),
                    Text(nList.phone),
                    Text(nList.website),
                    SizedBox(height: 5.0,),
                    Text("Address",style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    Text(nList.address.street),
                    Text(nList.address.city),
                    Text(nList.address.suite),
                    Text(nList.address.zipcode),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("Company",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                    Text(nList.company.name),
                  ],
                ),
              );
        }),
      ),
    );
  }
}
