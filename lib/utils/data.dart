var profile = {
  "name": "Arjun",
  "image":
      "https://static.vecteezy.com/system/resources/thumbnails/017/208/923/small/luxury-letter-a-logo-a-logotype-for-elegant-and-stylish-fashion-symbol-vector.jpg",
  "email": "arjunkukadiya606@gmail.com"
};

List categories = [
  {"name": "All", "icon": "assets/icons/home.svg"},
  {"name": "Single Room", "icon": "assets/icons/home.svg"},
  {"name": "Double Room", "icon": "assets/icons/home.svg"},
  {"name": "Family Room", "icon": "assets/icons/home.svg"},
  {"name": "Queen Room", "icon": "assets/icons/home.svg"},
  {"name": "King Room", "icon": "assets/icons/home.svg"},
  {"name": "Bungalow", "icon": "assets/icons/home.svg"},
  {"name": "Single Villa", "icon": "assets/icons/home.svg"},
  {"name": "Apartment", "icon": "assets/icons/home.svg"},
  {"name": "Mall", "icon": "assets/icons/home.svg"},
  {"name": "Super Market", "icon": "assets/icons/home.svg"},
  {"name": "Zoo", "icon": "assets/icons/home.svg"},
  {"name": "Historic Place", "icon": "assets/icons/home.svg"},
  {"name": "Art place", "icon": "assets/icons/home.svg"},
  {"name": "Fun", "icon": "assets/icons/home.svg"},
];

List cities = [
  {"name": "Phnom Penh", "icon": "assets/icons/home.svg"},
  {"name": "Siem Reap", "icon": "assets/icons/home.svg"},
  {"name": "Sihanoukville", "icon": "assets/icons/home.svg"},
  {"name": "Battambang", "icon": "assets/icons/home.svg"},
  {"name": "Mondulkiri", "icon": "assets/icons/home.svg"},
  {"name": "Kampot", "icon": "assets/icons/home.svg"},
  {"name": "Pursat", "icon": "assets/icons/home.svg"},
  {"name": "Steung Treng", "icon": "assets/icons/home.svg"},
  {"name": "Fun ", "icon": "assets/icons/home.svg"},
];

List<String> albumImages = [
  "https://images.unsplash.com/photo-1598928636135-d146006ff4be?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
];

List features = [
  {
    "id": 100,
    "name": "Superior Room",
    "image":
        "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$210",
    "type": categories[1]["name"],
    "rate": 4.5,
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 101,
    "name": "Junior Suite",
    "image":
        "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$150",
    "type": categories[3]["name"],
    "rate": 4.5,
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 102,
    "name": "Classic Queen Room",
    "image":
        "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$320",
    "type": categories[2]["name"],
    "rate": 4.5,
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 103,
    "name": "Luxury King",
    "image":
        "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$350",
    "type": categories[2]["name"],
    "rate": 4.5,
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 104,
    "name": "Classic Room",
    "image":
        "https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$180",
    "type": categories[4]["name"],
    "rate": 4.5,
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 105,
    "name": "Twin Room",
    "image":
        "https://images.unsplash.com/photo-1566195992011-5f6b21e539aa?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$250",
    "type": categories[1]["name"],
    "rate": 4.5,
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 200,
    "name": "Reliance Mall",
    "image":
        "https://lh5.googleusercontent.com/p/AF1QipP3canIq5LTv6d0nWgOV29IbRw025zoOtfsMB2p=w260-h175-n-k-no",
    "price": "\$210",
    "type": categories[9]["name"],
    "rate": 4.5,
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 201,
    "name": "Iscon Prozone Mall Rajkot",
    "image":
        "https://lh3.googleusercontent.com/p/AF1QipMihbS3teicVQtUDpIM9inxAyLJIwpcOTBYi9bn=s680-w680-h510",
    "price": "\$150",
    "type": categories[9]["name"],
    "rate": 4.5,
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 202,
    "name": "Crystal Mall",
    "image":
        "https://lh3.googleusercontent.com/p/AF1QipNUod9zj8COvRLIlDluF1WAX9rOGnt3BZzvTYmr=s680-w680-h510",
    "price": "\$150",
    "type": categories[9]["name"],
    "rate": 4.5,
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 203,
    "name": "Star Shopping Center",
    "image":
        "https://lh3.googleusercontent.com/p/AF1QipMhhEqrhCDyyI1ZNK7aQUfx4aXPNU15HvkYM-B0=s680-w680-h510",
    "price": "\$150",
    "type": categories[10]["name"],
    "rate": 4.5,
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 300,
    "name": "Rotary International Dolls Museum",
    "image":
        "https://lh3.googleusercontent.com/p/AF1QipNoP14lnwQrhYCV9nRooEgAjZ7yXmI9zsn_fhW9=s680-w680-h510",
    "price": "\$150",
    "type": categories[13]["name"],
    "rate": 4.4,
    "location": "  Dr Yagnik Rd, opp. Heera-Panna, Jagnath Plot",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 301,
    "name": "Fun World",
    "image":
        "https://lh3.googleusercontent.com/p/AF1QipMUqtPP3VUMJWNbILmGe64PScEBOgyLDdrWe6fR=s680-w680-h510",
    "price": "\$150",
    "type": categories[14]["name"],
    "rate": 4.3,
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Popular, sprawling amusement park with a host of rides & games for all ages, along with a cafe.",
  },
  {
    "id": 302,
    "name": "Kaba Gandhi No Delo",
    "image":
        "https://lh3.googleusercontent.com/p/AF1QipMsJ90E4q4s__M6Blho6G2Bs5c10IdApPnsIbC4=s680-w680-h510",
    "price": "\$150",
    "type": categories[12]["name"],
    "rate": 4.3,
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Kaba Gandhi No Delo, Rajkot was Indian leader Mahatma Gandhi's primary family home in India until 1915, including during those years when he stayed in London and in South Africa. Later on, on return from South Africa in 1915, he established Kocharab Ashram in Ahmedabad.",
  },
  {
    "id": 303,
    "name": "Pradhyuman Zoological Park, Rajkot",
    "image":
        "https://lh3.googleusercontent.com/p/AF1QipMt568J57PUmBQed-VOf-OgaR61rXZigw_P0fxx=s680-w680-h510",
    "price": "\$150",
    "type": categories[11]["name"],
    "rate": 4.3,
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Large zoo with gardens, a playground, concessions & rentable golf carts for transportation.",
  },
];

List recommends = [
  {
    "id": 110,
    "name": "Luxury King",
    "image":
        "https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$310",
    "type": categories[1]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 111,
    "name": "Classic Room",
    "image":
        "https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$250",
    "type": categories[2]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 112,
    "name": "Twin Room",
    "image":
        "https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$190",
    "type": categories[1]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "album_images": albumImages,
    "is_favorited": false,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
];

List rajkot_malls = [
  {
    "id": 200,
    "name": "Reliance Mall",
    "image":
        "https://lh5.googleusercontent.com/p/AF1QipP3canIq5LTv6d0nWgOV29IbRw025zoOtfsMB2p=w260-h175-n-k-no",
    "price": "\$210",
    "type": categories[1]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 201,
    "name": "Iscon Prozone Mall Rajkot",
    "image":
        "https://lh3.googleusercontent.com/p/AF1QipMihbS3teicVQtUDpIM9inxAyLJIwpcOTBYi9bn=s680-w680-h510",
    "price": "\$150",
    "type": categories[3]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 202,
    "name": "Crystal Mall",
    "image":
        "https://lh3.googleusercontent.com/p/AF1QipNUod9zj8COvRLIlDluF1WAX9rOGnt3BZzvTYmr=s680-w680-h510",
    "price": "\$150",
    "type": categories[3]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 203,
    "name": "Star Shopping Center",
    "image":
        "https://lh3.googleusercontent.com/p/AF1QipMhhEqrhCDyyI1ZNK7aQUfx4aXPNU15HvkYM-B0=s680-w680-h510",
    "price": "\$150",
    "type": categories[3]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
];
