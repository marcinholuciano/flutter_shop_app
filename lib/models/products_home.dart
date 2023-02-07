class Item {
  final int id;
  final String name;
  final double price;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.price,
      required this.image}
  );
}

class Products {
  static final products = [
    Item(
        id: 1,
        name: "iPhone 12",
        price: 999,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCuD0HI4Zr81UKzwBeMLltkhaEMgxHJDvPvQ&usqp=CAU"),
    Item(
        id: 2,
        name: "iPhone 13 pro",
        price: 1199,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPJLt3XnBWTa1uVf47m7IW87Dckj7uwabq5w&usqp=CAU"),
    Item(
        id: 3,
        name: "IPhone 13",
        price: 1299,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfOxwodBL81UDhB4syHn3gYZOhD3EqjD_LDMyvmBaOt8JUxrcEVgA85FbJT4IJGyqhJfU&usqp=CAU"),
    Item(
        id: 4,
        name: "iPhone 11",
        price: 899,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2YWQPNddTCfot6bCPOcq5wuc2D_LothyquLDIwTyxG6GVguUeSmUNHuVIT2v-arNIV-E&usqp=CAU"),
    Item(
        id: 5,
        name: "iPhone 10",
        price: 799,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRhY6iL2pCbRPISqvSqzCxPc1bEjOj-tOyww&usqp=CAU"),
    Item(
        id: 6,
        name: "iPhone 9",
        price: 999,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCuD0HI4Zr81UKzwBeMLltkhaEMgxHJDvPvQ&usqp=CAU"),
    Item(
        id: 7,
        name: "iPhone 8",
        price: 1199,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPJLt3XnBWTa1uVf47m7IW87Dckj7uwabq5w&usqp=CAU"),
    Item(
        id: 8,
        name: "IPhone 7",
        price: 1299,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfOxwodBL81UDhB4syHn3gYZOhD3EqjD_LDMyvmBaOt8JUxrcEVgA85FbJT4IJGyqhJfU&usqp=CAU"),
    Item(
        id: 9,
        name: "iPhone 6",
        price: 899,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2YWQPNddTCfot6bCPOcq5wuc2D_LothyquLDIwTyxG6GVguUeSmUNHuVIT2v-arNIV-E&usqp=CAU"),
    Item(
        id: 10,
        name: "iPhone 5",
        price: 799,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRhY6iL2pCbRPISqvSqzCxPc1bEjOj-tOyww&usqp=CAU"),        
  ];
}
