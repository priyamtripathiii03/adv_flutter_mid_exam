import 'package:adv_flutter_mid_exam/modal/modal.dart';
import 'package:adv_flutter_mid_exam/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 10,
        shadowColor: Colors.black,
        title: const Text(
          "Home Page",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          size: 30,
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.save,color: Colors.white,size: 30,),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<HomeProvider>(context).apiComes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Modal>? apiModal = snapshot.data;
            homeProviderTrue.modalListSave = snapshot.data;
            return GridView.builder(
              itemCount: apiModal!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    homeProviderTrue.selectIndex = index;
                    Navigator.of(context).pushNamed('/detail');
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(),
                              image: DecorationImage(
                                image: NetworkImage(apiModal[index].image),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: 280,
                          color: Colors.blue.withOpacity(0),
                          child: Column(
                            children: [
                              Text(
                                apiModal[index]
                                    .title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                "\$ ${apiModal[index].price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rating ${apiModal[index].rating.rate}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
