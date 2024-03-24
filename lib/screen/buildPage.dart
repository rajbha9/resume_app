import 'package:flutter/material.dart';
import 'package:resume/util.dart';

class PageSecond extends StatefulWidget {
  const PageSecond({super.key});

  @override
  State<PageSecond> createState() => _PageSecondState();
}

class _PageSecondState extends State<PageSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          icon: Icon(Icons.chevron_left, size: 30),
        ),
        elevation: 0,
        title: Text(
          "Resume Workspace",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.green,
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.green,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                SizedBox(width: 130,),
                Text(
                  "Build Options",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('pdf');
                    },
                    icon: Icon(Icons.picture_as_pdf_outlined))
              ],
            ),
          ),
          Container(
            height: 655,
            child: SingleChildScrollView(
              child: Column(
                  children: resumelist.map((e) {
                String? image = e['img'];
                String? names = e['name'];
                String? page = e['page'];
                return Vivev(
                  name: names,
                  img: image,
                  page: page,
                );
              }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}

class Vivev extends StatefulWidget {
  String? name;
  String? img;
  String? page;

  Vivev({super.key, this.name, this.img, this.page});

  @override
  State<Vivev> createState() => _VivevState();
}

class _VivevState extends State<Vivev> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2, top: 2),
      child: Container(
        color: Colors.black12,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 65,
                  width: 50,
                  child: Image.asset("${widget.img}"),
                ),
                const SizedBox(width: 40),
                Text("${widget.name}", style: TextStyle(fontSize: 25)),
              ],
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('${widget.page}');
              },
              icon: const Icon(Icons.navigate_next, size: 40),
              splashRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
