import 'package:adv_flutter_mid_exam/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderFalse =
        Provider.of<HomeProvider>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          'Detail Page',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back,color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(homeProviderTrue
                          .apiModalListSave![homeProviderTrue.selectIndex]
                          .image),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                homeProviderTrue
                    .apiModalListSave![homeProviderTrue.selectIndex].title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$ ${homeProviderTrue.apiModalListSave![homeProviderTrue.selectIndex].price}",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: w / 1.1,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${homeProviderTrue.apiModalListSave![homeProviderTrue.selectIndex].description}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 130),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.amber)),
          onPressed: () {
            if (!homeProviderFalse.checkList(
                    homeProviderTrue.selectIndex,
                    homeProviderTrue
                        .apiModalListSave![homeProviderTrue.selectIndex]
                        .price) ||
                homeProviderTrue.addList == []) {
              homeProviderFalse.addToCart(
                  homeProviderTrue.selectIndex,
                  homeProviderTrue
                      .apiModalListSave![homeProviderTrue.selectIndex].price);
            }
            homeProviderFalse.totalCart();
            Navigator.of(context).pushNamed('/cart');
          },
          child: Text(
            "Add Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
