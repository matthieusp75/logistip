require "date"
require "open-uri"

# puts "destroy existing data"
# OrderLine.destroy_all
# Order.destroy_all
# Product.destroy_all
# Supplier.destroy_all
# Client.destroy_all
# User.destroy_all

puts "create users"

User.create!(
  email:"jeanfrancois@logistip.com",
  first_name:"Jean Francois",
  last_name:"Barbato",
  telephone:"0123456789",
  password:"bonjour",
)

User.create!(
  email:"matthieu@logistip.com",
  first_name:"Matthieu",
  last_name:"Seaux Peters",
  telephone:"0234567891",
  password:"bonjour",
)

User.create!(
  email:"stephane@logistip.com",
  first_name:"Stephane",
  last_name:"Debuiche",
  telephone:"0345678912",
  password:"bonjour",
)

puts "create clients"

# 6 clients
Client.create!(
  first_name:"Marie",
  last_name:"Dumont",
  address:"14 rue Mouffetard, 75005 Paris",
  telephone:"0987654321",
  user_id:"1",
)

Client.create(
  first_name:"Paul",
  last_name:"Poutou",
  address:"18 rue de la Paix rue Mouffetard, 75002 Paris",
  telephone:"0876543219",
  user_id:"1",
)

Client.create(
  first_name:"Jean",
  last_name:"Cisteron",
  address:"154 rue de bezons, 92400 Courbevoie",
  telephone:"0765432198",
  user_id:"2",
)

Client.create(
  first_name:"Philippe",
  last_name:"Gentil",
  address:"71 rue la condamine, 75017 Paris",
  telephone:"0876543219",
  user_id:"2",
)

Client.create(
  first_name:"Alessandro",
  last_name:"Bonati",
  address:"3 rue de Courcelles, 75008 Paris",
  telephone:"0654321987",
  user_id:"3",
)

Client.create(
  first_name:"Luc",
  last_name:"Osseau",
  address:"59 rue de ponthieu, 75008 Paris",
  telephone:"05432109876",
  user_id:"3",
)

puts "create suppliers"

# 6 suppliers
supplier1 = Supplier.new(
  name:"Maison Chanel",
  address:"67 rue de romainville, 75019 Paris",
  email:"contact@parfumeo.com",
  telephone:"0543219876",
  shipping_date_minimum_period:"2",
  user_id:"1"
)
file = URI.open('https://www.icon-icon.com/wp-content/uploads/2021/05/053_ar-ae8i2093.jpg')
supplier1.photo.attach(io: file, filename: 'picsupplier1.jpg', content_type: 'image/jpg')
supplier1.save!


supplier2 = Supplier.create(
  name:"Grossiste Orient",
  address:"11 avenue corentin cariou, 75019 Paris",
  email:"contact@bazardenfer.com",
  telephone:"0432198765",
  shipping_date_minimum_period:"4",
  user_id:"1",
)
file = URI.open('https://media.cylex-locale.fr/companies/1295/7112/images/787140478-Grossiste-Orient-parfum-dubai_801380_large.jpg')
supplier2.photo.attach(io: file, filename: 'picsupplier2.jpg', content_type: 'image/jpg')
supplier2.save!

supplier3 = Supplier.create(
  name:"Melina Destock",
  address:"19 boulevard bourdon, 75004 Paris",
  email:"contact@toutenun.com",
  telephone:"0321987654",
  shipping_date_minimum_period:"3",
  user_id:"2",
)
file = URI.open('https://www.pagesjaunes.fr/media/agc/1e/c0/7e/00/00/1a/25/98/90/b8/626f1ec07e00001a259890b8/626f1ec07e00001a259890b9.png')
supplier3.photo.attach(io: file, filename: 'picsupplier3.png', content_type: 'image/png')
supplier3.save!

supplier4 = Supplier.create(
  name:"Compagnie des parfums",
  address:"contact@labonneaffaire.com",
  email:"2 avenue léonard de vinci 92400, Courbevoie",
  telephone:"0219876543",
  shipping_date_minimum_period:"5",
  user_id:"2",
)
file = URI.open('https://www.compagnie-europeenne-parfums.fr/sites/default/files/logo.png')
supplier4.photo.attach(io: file, filename: 'picsupplier4.png', content_type: 'image/png')
supplier4.save!

# Supplier.create(
#   name:"Cdispo",
#   address:"9 rue auguste beau, 92400 Courbevoie",
#   email:"contact@cdispo.com",
#   telephone:"0101987654",
#   shipping_date_minimum_period:"1",
#   user_id:"3",
# )

# Supplier.create(
#   name:"Good Life",
#   address:"14 avenue edouard vaillant, 93500 Pantin",
#   email:"contact@goodlife.com",
#   telephone:"0102987654",
#   shipping_date_minimum_period:"5",
#   user_id:"3",
# )

puts "create products"

# # 12 products
product1 = Product.create(
  ean:"7658904635785",
  title:"N°5 de Chanel",
  description:"L'eau de parfum la plus connue du monde",
  quantity_in_stock:"0",
  buying_price:"4",
  selling_price:"9",
  quantity_per_case:"12",
  minimum_order_quantity:"12",
  supplier_id:"1",
)
file = URI.open('https://images.unsplash.com/photo-1541643600914-78b084683601?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyZnVtZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60')
product1.photo.attach(io: file, filename: 'picsupplier1.jpg', content_type: 'image/jpg')
product1.save!

product2 = Product.create(
  ean:"7658904635786",
  title:"Bleu de Chanel",
  description:"La fragrance masculine par excellence",
  quantity_in_stock:"4",
  buying_price:"6",
  selling_price:"11",
  quantity_per_case:"3",
  minimum_order_quantity:"3",
  supplier_id:"1",
)
file = URI.open('https://images.unsplash.com/photo-1523293182086-7651a899d37f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyZnVtZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60')
product2.photo.attach(io: file, filename: 'picsupplier2.jpg', content_type: 'image/jpg')
product2.save!

product3 = Product.create(
  ean:"7658904635788",
  title:"Coco de Chanel",
  description:"La jeunesse et la légèreté",
  quantity_in_stock:"0",
  buying_price:"7",
  selling_price:"12",
  quantity_per_case:"1",
  minimum_order_quantity:"1",
  supplier_id:"1",
)
file = URI.open('https://images.unsplash.com/photo-1592945403244-b3fbafd7f539?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cGVyZnVtZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60')
product3.photo.attach(io: file, filename: 'picsupplier3.jpg', content_type: 'image/jpg')
product3.save!

product4 = Product.create(
  ean:"7658904635538",
  title:"Noir de Chanel",
  description:"Pour une sensualité magnétique",
  quantity_in_stock:"5",
  buying_price:"7",
  selling_price:"12",
  quantity_per_case:"1",
  minimum_order_quantity:"1",
  supplier_id:"1",
)
file = URI.open('https://images.unsplash.com/photo-1592945403244-b3fbafd7f539?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cGVyZnVtZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60')
product4.photo.attach(io: file, filename: 'picsupplier4.jpg', content_type: 'image/jpg')
product4.save!

product5 = Product.create(
  ean:"7658904635789",
  title:"Miu miu",
  description:"La femme pétillante et addictive",
  quantity_in_stock:"0",
  buying_price:"9",
  selling_price:"22",
  quantity_per_case:"1",
  minimum_order_quantity:"2",
  supplier_id:"2",
)
file = URI.open('https://images.unsplash.com/photo-1557170334-a9632e77c6e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cGVyZnVtZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60')
product5.photo.attach(io: file, filename: 'picsupplier5.jpg', content_type: 'image/jpg')
product5.save!

product6 = Product.create(
  ean:"7658904635780",
  title:"Aqua di Gio",
  description:"L'homme simple et connecté avec lui-même",
  quantity_in_stock:"0",
  buying_price:"8",
  selling_price:"14",
  quantity_per_case:"1",
  minimum_order_quantity:"5",
  supplier_id:"2",
)
file = URI.open('https://feelunique.com/cdn-cgi/image/quality=90,format=auto,metadata=none,dpr=1/img/products/5777/alternative/armani_acqua_di_gio_for_men_eau_de_toilette_spray_50ml_112716_1629709892_main.jpg')
product6.photo.attach(io: file, filename: 'picsupplier6.jpg', content_type: 'image/jpg')
product6.save!

product7 = Product.create(
  ean:"7658904635781",
  title:"Prada Milano",
  description:"L'intensité de l'homme à l'état pur",
  quantity_in_stock:"1",
  buying_price:"12",
  selling_price:"25",
  quantity_per_case:"5",
  minimum_order_quantity:"10",
  supplier_id:"2",
)
file = URI.open('https://images.unsplash.com/photo-1610461888750-10bfc601b874?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHBlcmZ1bWV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60')
product7.photo.attach(io: file, filename: 'picsupplier7.jpg', content_type: 'image/jpg')
product7.save!

product8 = Product.create(
  ean:"7658904635782",
  title:"Gentleman de Givenchy",
  description:"L'audace et la spontanéité",
  quantity_in_stock:"10",
  buying_price:"6",
  selling_price:"10",
  quantity_per_case:"1",
  minimum_order_quantity:"1",
  supplier_id:"2",
)
file = URI.open('https://images.unsplash.com/photo-1588514912908-8f5891714f8d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHBlcmZ1bWV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60')
product8.photo.attach(io: file, filename: 'picsupplier8.jpg', content_type: 'image/jpg')
product8.save!

product9 = Product.create(
  ean:"7658904635783",
  title:"The One de Dolce & Gabana",
  description:"L'unique et inégalable",
  quantity_in_stock:"0",
  buying_price:"4",
  selling_price:"12",
  quantity_per_case:"2",
  minimum_order_quantity:"2",
  supplier_id:"3",
)
file = URI.open('https://images.unsplash.com/photo-1616949755610-8c9bbc08f138?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NXxwTUxlMHVhSFo3MHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60')
product9.photo.attach(io: file, filename: 'picsupplier9.jpg', content_type: 'image/jpg')
product9.save!

product10 = Product.create(
  ean:"7658904635784",
  title:"Black Opium par Yves Saint Laurent",
  description:"Une dose d'adrénaline",
  quantity_in_stock:"5",
  buying_price:"12",
  selling_price:"28",
  quantity_per_case:"3",
  minimum_order_quantity:"6",
  supplier_id:"3",
)
file = URI.open('https://images.unsplash.com/photo-1600612253971-422e7f7faeb6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NnxwTUxlMHVhSFo3MHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60')
product10.photo.attach(io: file, filename: 'picsupplier10.jpg', content_type: 'image/jpg')
product10.save!

product11 = Product.create(
  ean:"7658904635779",
  title:"Red diamond",
  description:"Intense et sûr de lui",
  quantity_in_stock:"4",
  buying_price:"15",
  selling_price:"30",
  quantity_per_case:"3",
  minimum_order_quantity:"3",
  supplier_id:"3",
)
file = URI.open('https://images.unsplash.com/photo-1608528577891-eb055944f2e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTN8cE1MZTB1YUhaNzB8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60')
product11.photo.attach(io: file, filename: 'picsupplier11.jpg', content_type: 'image/jpg')
product11.save!

product12 = Product.create(
  ean:"7658904635769",
  title:"Olympea",
  description:"L'élixir d'Aphrodite",
  quantity_in_stock:"0",
  buying_price:"10",
  selling_price:"20",
  quantity_per_case:"5",
  minimum_order_quantity:"5",
  supplier_id:"3",
)
file = URI.open('https://images.unsplash.com/photo-1612179594004-7d90fa67cf16?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTd8cE1MZTB1YUhaNzB8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60')
product12.photo.attach(io: file, filename: 'picsupplier12.jpg', content_type: 'image/jpg')
product12.save!

product13 = Product.create(
  ean:"9658904635769",
  title:"Jo Malone",
  description:"Des essences fruitées pour une jeunesse sans fin",
  quantity_in_stock:"16",
  buying_price:"8",
  selling_price:"20",
  quantity_per_case:"5",
  minimum_order_quantity:"1",
  supplier_id:"4",
)
file = URI.open('https://images.unsplash.com/photo-1519669011783-4eaa95fa1b7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8N3xwTUxlMHVhSFo3MHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60')
product13.photo.attach(io: file, filename: 'picsupplier13.jpg', content_type: 'image/jpg')
product13.save!

product14 = Product.create(
  ean:"765890463#788",
  title:"Comme une évidence par Yves Rocher",
  description:"Simple et naturel",
  quantity_in_stock:"0",
  buying_price:"10",
  selling_price:"14",
  quantity_per_case:"1",
  minimum_order_quantity:"1",
  supplier_id:"4",
)
file = URI.open('https://images.unsplash.com/photo-1620059310606-e829e7fb1b0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTZ8cE1MZTB1YUhaNzB8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60')
product14.photo.attach(io: file, filename: 'picsupplier14.jpg', content_type: 'image/jpg')
product14.save!

product15 = Product.create(
  ean:"765890463#788",
  title:"Boss, d'Hugo Boss",
  description:"L'hommes, confiant et sauvage",
  quantity_in_stock:"0",
  buying_price:"10",
  selling_price:"14",
  quantity_per_case:"1",
  minimum_order_quantity:"1",
  supplier_id:"4",
)
file = URI.open('https://images.unsplash.com/photo-1596516109345-3ad1086ca0a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTF8cE1MZTB1YUhaNzB8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60')
product15.photo.attach(io: file, filename: 'picsupplier15.jpg', content_type: 'image/jpg')
product15.save!


# Produits pour faire des orderlines initiales

product16 = Product.create(
  ean:"765890463#788",
  title:"Comme des garçons",
  description:"Simplicité et légèreté",
  quantity_in_stock:"0",
  buying_price:"10",
  selling_price:"14",
  quantity_per_case:"1",
  minimum_order_quantity:"1",
  supplier_id:"2",
)
file = URI.open('https://images.unsplash.com/photo-1632854627971-5a609662d2aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80')
product16.photo.attach(io: file, filename: 'picsupplier16.jpg', content_type: 'image/jpg')
product16.save!

product17 = Product.create(
  ean:"765890463#788",
  title:"Oyedo",
  description:"Le mystère fait votre charme",
  quantity_in_stock:"0",
  buying_price:"10",
  selling_price:"14",
  quantity_per_case:"1",
  minimum_order_quantity:"1",
  supplier_id:"3",
)
file = URI.open('https://images.unsplash.com/photo-1632928145408-ef47a7672964?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXxwTUxlMHVhSFo3MHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60')
product17.photo.attach(io: file, filename: 'picsupplier17.jpg', content_type: 'image/jpg')
product17.save!

product18 = Product.create(
  ean:"765890463#788",
  title:"Nina Ricci",
  description:"La fragrance intemporelle",
  quantity_in_stock:"0",
  buying_price:"10",
  selling_price:"14",
  quantity_per_case:"1",
  minimum_order_quantity:"1",
  supplier_id:"4",
)
file = URI.open('https://images.unsplash.com/photo-1588599335525-667ed6a4cdf2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1515&q=80')
product18.photo.attach(io: file, filename: 'picsupplier18.jpg', content_type: 'image/jpg')
product18.save!

puts "create orders"

# 7 orders
Order.create(
  planned_delivery_date:Date.new(2022, 11, 25),
  total_price:"10",
  status:"0",
  user_id:"1",
)

Order.create(
  planned_delivery_date:Date.new(2022, 11, 14),
  total_price:"20",
  status:"0",
  user_id:"1",
)

Order.create(
  planned_delivery_date:Date.new(2022, 10, 24),
  total_price:"30",
  status:"0",
  user_id:"2",
)

# Order.create(
#   planned_delivery_date:Date.new(2022, 10, 2),
#   total_price:"34",
#   status:"0",
#   user_id:"2",
#   client_id:"3",
# )

# Order.create(
#   planned_delivery_date:Date.new(2022, 10, 4),
#   total_price:"258",
#   status:"1",
#   user_id:"3",
#   client_id:"2",
# )

# Order.create(
#   planned_delivery_date:Date.new(2022, 7, 9),
#   total_price:"120",
#   status:"2",
#   user_id:"3",
#   client_id:"1",
# )

# Order.create(
#   planned_delivery_date:Date.new(2022, 12, 4),
#   total_price:"118",
#   status:"0",
#   user_id:"3",
#   client_id:"1",
# )

puts "create orderlines"

# 14 orderlines
OrderLine.create(
  quantity:"1",
  line_total_price:"10",
  order_id:"1",
  product_id:"16",
)

OrderLine.create(
  quantity:"2",
  line_total_price:"20",
  order_id:"2",
  product_id:"17",
)

OrderLine.create(
  quantity:"3",
  line_total_price:"30",
  order_id:"3",
  product_id:"18",
)

# OrderLine.create(
#   quantity:"2",
#   line_total_price:"44",
#   order_id:"2",
#   product_id:"4",
# )

# OrderLine.create(
#   quantity:"5",
#   line_total_price:"70",
#   order_id:"3",
#   product_id:"5",
# )

# OrderLine.create(
#   quantity:"10",
#   line_total_price:"250",
#   order_id:"3",
#   product_id:"6",
# )

# OrderLine.create(
#   quantity:"1",
#   line_total_price:"10",
#   order_id:"4",
#   product_id:"7",
# )

# OrderLine.create(
#   quantity:"2",
#   line_total_price:"24",
#   order_id:"4",
#   product_id:"8",
# )

# OrderLine.create(
#   quantity:"6",
#   line_total_price:"168",
#   order_id:"5",
#   product_id:"9",
# )

# OrderLine.create(
#   quantity:"3",
#   line_total_price:"90",
#   order_id:"5",
#   product_id:"10",
# )

# OrderLine.create(
#   quantity:"5",
#   line_total_price:"100",
#   order_id:"6",
#   product_id:"11",
# )

# OrderLine.create(
#   quantity:"1",
#   line_total_price:"20",
#   order_id:"6",
#   product_id:"12",
# )

# OrderLine.create(
#   quantity:"12",
#   line_total_price:"108",
#   order_id:"7",
#   product_id:"1",
# )

# OrderLine.create(
#   quantity:"1",
#   line_total_price:"10",
#   order_id:"7",
#   product_id:"7",
# )

# Ajout d'un orderline et d'un order (test orderline creation sur la Bougie Fraise)
    # Bougie fraise id : 8
    # Bougie fraise orderline id: 15
    # Bougie fraise order id: 8

# Order.create(
#   planned_delivery_date:Date.new(2022, 10, 4),
#   total_price:"10",
#   status:"0",
#   user_id:"3",
# )

# OrderLine.create(
#   quantity:"1",
#   line_total_price:"10",
#   order_id:"8",
#   product_id:"8",
# )

puts "Almost done"
