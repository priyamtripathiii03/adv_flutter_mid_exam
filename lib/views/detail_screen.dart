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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 10,
        shadowColor: Colors.black,
        title: const Text(
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
            const SizedBox(
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
                          .modalListSave![homeProviderTrue.selectIndex]
                          .image),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                homeProviderTrue
                    .modalListSave![homeProviderTrue.selectIndex].title,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "\$ ${homeProviderTrue.modalListSave![homeProviderTrue.selectIndex].price}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 400,
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            homeProviderTrue.modalListSave![homeProviderTrue.selectIndex].description,
                            style: const TextStyle(
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
        padding: const EdgeInsets.only(right: 150),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.amber)),
          onPressed: () {
            if (!homeProviderFalse.checkList(
                    homeProviderTrue.selectIndex,
                    homeProviderTrue
                        .modalListSave![homeProviderTrue.selectIndex]
                        .price) ||
                homeProviderTrue.addList == []) {
              homeProviderFalse.addToCart(
                  homeProviderTrue.selectIndex,
                  homeProviderTrue
                      .modalListSave![homeProviderTrue.selectIndex].price);
            }
            homeProviderFalse.totalCart();
            Navigator.of(context).pushNamed('/cart');
          },
          child: const Text(
            "Add Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
