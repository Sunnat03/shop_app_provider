List<Map<String, dynamic>> categoriesMock = [
  {
    "id": "01",
    "name": "Fruit",
    "icon": "🍇",
    "products": [
      "01",
      "02",
      "03",
      "04",
      "05",
    ],
  },
  {
    "id": "02",
    "name": "Drinks",
    "icon": "🍹",
    "products": [
      "06",
      "07",
      "08",
      "09",
      "10",
    ],
  },
  {
    "id": "03",
    "name": "Dairy",
    "icon": "🥛",
    "products": [
      "11",
      "12",
      "13",
    ],
  },
];

List<Map<String, dynamic>> productsMock = [
  // fruit
  {
    'id': "01",
    'title': "Apple",
    'price': 12000,
    'categoryId': "01",
    'images': [
      "https://i.pinimg.com/736x/20/c9/e0/20c9e0a5110642b2c3bb88d7546c13f3.jpg",
      "https://klike.net/uploads/posts/2019-06/1561279319_22.jpg",
      "https://www.pngall.com/wp-content/uploads/2016/04/Apple-Fruit-PNG.png",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Uz Garden",
    'discount': 0.15
  },
  {
    'id': "02",
    'title': "Pear",
    'price': 11000,
    'categoryId': "01",
    'images': [
      "https://i.pinimg.com/736x/ed/6f/a0/ed6fa04a80df2819f05451895b9d6f39--art-images-pears.jpg",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Uz Garden",
  },
  {
    'id': "03",
    'title': "Peach",
    'price': 11000,
    'categoryId': "01",
    'images': [
      "https://www.clipartmax.com/png/full/59-594424_peach-png-transparent-photo-image-peach-png.png",
      "https://media.istockphoto.com/photos/peach-fruits-with-leaves-isolated-on-white-background-picture-id472095722?k=20&m=472095722&s=612x612&w=0&h=5EXGPiYt5XluLLiE5pYUSyZ0NxzcH1Wm3dYA-bfVvCk=",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Uz Garden",
  },
  {
    'id': "04",
    'title': "Grape",
    'price': 11000,
    'categoryId': "01",
    'images': [
      "https://avatars.mds.yandex.net/i?id=70f061c195f3e16b453b22203840efa1-5227334-images-thumbs&n=13",
      "https://www.pngitem.com/pimgs/m/4-44826_green-grapes-png-image-golden-grapes-transparent-background.png",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Uz Garden",
  },
  {
    'id': "05",
    'title': "Watermelon",
    'price': 11000,
    'categoryId': "01",
    'images': [
      "https://1.bp.blogspot.com/-JWK3uhwkMys/VQk_-FH1SKI/AAAAAAAAS4Q/6j8clSRg_-0/s1600/3hcKz5qy4gRkQECAnSu5GcxRAZ8.png",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Uz Garden",
  },

  // drinks
  {
    'id': "06",
    'title': "Nestle Water",
    'price': 2000,
    'description': "",
    'categoryId': "02",
    'images': [
      "https://129d5gnposv45pipg3fffi67-wpengine.netdna-ssl.com/wp-content/uploads/2017/08/pure-life-water.jpg",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Nestle",
  },
  {
    'id': "07",
    'title': "Coca Cola Water",
    'price': 2000,
    'description': "",
    'categoryId': "02",
    'images': [
      "https://www.worldblaze.in/wp-content/uploads/2016/10/Coca-Cola.jpg",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Coca Cola",
    'discount': 0.10,
  },
  {
    'id': "08",
    'title': "Fanta Water",
    'price': 2000,
    'description': "",
    'categoryId': "02",
    'images': [
      "https://static.tildacdn.com/tild3133-3961-4962-b234-383665313462/fanta_PNG49_1.png",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Coca Cola",
  },
  {
    'id': "09",
    'title': "Seven Up",
    'price': 2000,
    'description': "",
    'categoryId': "02",
    'images': [
      "https://www.crempcoop.com/wp-content/uploads/2019/07/50B304-768x768.jpg",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Coca Cola",
  },
  {
    'id': "10",
    'title': "Pepsi",
    'price': 2000,
    'description': "",
    'categoryId': "02",
    'images': [
      "https://www.pngplay.com/wp-content/uploads/1/Pepsi-PNG-Photo-Image.png",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Pepsi",
  },

  // dairy
  {
    'id': "11",
    'title': "Pure Butter",
    'price': 2000,
    'description': "",
    'categoryId': "03",
    'images': [
      "https://www.pngitem.com/pimgs/m/137-1375816_butter-png-image-background-butter-images-png-transparent.png",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Dromona",
  },
  {
    'id': "12",
    'title': "Nestle Loctel",
    'price': 2000,
    'description': "",
    'categoryId': "03",
    'images': [
      "https://www.enviedebienmanger.fr/sites/default/files/lactel_6x1l_bd.png",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Nestle",
  },
  {
    'id': "13",
    'title': "Ice cream",
    'price': 2000,
    'description': "",
    'categoryId': "03",
    'images': [
      "https://www.kindpng.com/picc/m/194-1944849_cup-cup-ice-cream-png-transparent-png.png",
    ],
    'createdDate': DateTime(2022, 8, 21, 14).toString(),
    'size': "1",
    'companyName': "Imkon",
    'discount': 0.20,
  },
];