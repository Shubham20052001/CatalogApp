import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl4.red800.make(),
              ElevatedButton(
                onPressed: () {},
                child: "Add to cart".text.make(),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
              ).wh(120, 50)
            ],
          ).p32(),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h32(context),
              Expanded(
                  child: VxArc(
                      height: 30,
                      edge: VxEdge.TOP,
                      arcType: VxArcType.CONVEY,
                      child: Container(
                        width: context.screenWidth,
                        color: Colors.white,
                        child: Column(
                          children: [
                            catalog.name.text.xl4.bold
                                .color(MyTheme.darkBluishColor)
                                .make(),
                            catalog.desc.text.xl
                                .textStyle(
                                    context.captionStyle ?? const TextStyle())
                                .make(),
                            10.heightBox,
                            "You have an interpreter — a virtual ambassador. In the same way, a Windows computer runs its own bytecode-interpreting software. That software is the Java Virtual Machine."
                                .text
                                .textStyle(
                                    context.captionStyle ?? const TextStyle())
                                .make()
                                .p16()
                          ],
                        ).py64(),
                      )))
            ],
          ),
        ));
  }
}
