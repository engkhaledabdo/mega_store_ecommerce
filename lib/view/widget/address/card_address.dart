import 'package:flutter/material.dart';

import '../../../data/model/address.dart';



class CardAddress extends StatelessWidget {
  const CardAddress(
      {super.key, required this.addressModel, required this.onDelete});
  final AddressModel addressModel;
  final void Function() onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: ListTile(
          title: Text(addressModel.addressName!),
          subtitle: Text(
              "${addressModel.addressCity!} - ${addressModel.addressStreet!}"),
          trailing: IconButton(
              onPressed: onDelete, icon: const Icon(Icons.delete_outline)),
        ),
      ),
    );
  }
}
