require "date"

User.create(
  email:"jeanfrancois@logistip.com",
  first_name:"Jean Francois",
  last_name:"Barbato",
  telephone:"0123456789",
  password:"bonjour",
)

User.create(
  email:"matthieu@logistip.com",
  first_name:"Matthieu",
  last_name:"Seaux Peters",
  telephone:"0234567891",
  password:"bonjour",
)

User.create(
  email:"stephane@logistip.com",
  first_name:"Stephane",
  last_name:"Debuiche",
  telephone:"0345678912",
  password:"bonjour",
)


# 6 clients
Client.create(
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

# 6 suppliers
Supplier.create(
  name:"Parfumeo",
  address:"67 rue de romainville, 75019 Paris",
  email:"contact@parfumeo.com",
  telephone:"0543219876",
  shipping_date_minimum_period:"2",
  user_id:"1",
)

Supplier.create(
  name:"Bazar Denfer",
  address:"11 avenue corentin cariou, 75019 Paris",
  email:"contact@bazardenfer.com",
  telephone:"0432198765",
  shipping_date_minimum_period:"4",
  user_id:"1",
)

Supplier.create(
  name:"Tout En Un",
  address:"19 boulevard bourdon, 75004 Paris",
  email:"contact@toutenun.com",
  telephone:"0321987654",
  shipping_date_minimum_period:"3",
  user_id:"2",
)

Supplier.create(
  name:"La Bonne Affaire",
  address:"contact@labonneaffaire.com",
  email:"2 avenue léonard de vinci 92400, Courbevoie",
  telephone:"0219876543",
  shipping_date_minimum_period:"5",
  user_id:"2",
)

Supplier.create(
  name:"Cdispo",
  address:"9 rue auguste beau, 92400 Courbevoie",
  email:"contact@cdispo.com",
  telephone:"0101987654",
  shipping_date_minimum_period:"1",
  user_id:"3",
)

Supplier.create(
  name:"Good Life",
  address:"14 avenue edouard vaillant, 93500 Pantin",
  email:"contact@goodlife.com",
  telephone:"0102987654",
  shipping_date_minimum_period:"5",
  user_id:"3",
)

# 12 products
Product.create(
  ean:"7658904635785",
  title:"Parfum vanille",
  description:"Un délicieux parfum aux essences de vanille",
  quantity_in_stock:"5",
  buying_price:"4",
  selling_price:"9",
  quantity_per_case:"12",
  minimum_order_quantity:"12",
  supplier_id:"1",
)

Product.create(
  ean:"7658904635786",
  title:"Parfum lavande",
  description:"Un délicieux parfum aux essences de lavande",
  quantity_in_stock:"7",
  buying_price:"6",
  selling_price:"11",
  quantity_per_case:"3",
  minimum_order_quantity:"3",
  supplier_id:"2",
)

Product.create(
  ean:"7658904635788",
  title:"Gel hydroalcoolique",
  description:"Un gel haut de gamme, pour une protection optimale",
  quantity_in_stock:"11",
  buying_price:"7",
  selling_price:"12",
  quantity_per_case:"1",
  minimum_order_quantity:"1",
  supplier_id:"2",
)

Product.create(
  ean:"7658904635789",
  title:"Parfum Fraise",
  description:"Un délicieux parfum aux essences de fraise",
  quantity_in_stock:"9",
  buying_price:"9",
  selling_price:"22",
  quantity_per_case:"1",
  minimum_order_quantity:"2",
  supplier_id:"3",
)

Product.create(
  ean:"7658904635780",
  title:"Tondeuse Dyson",
  description:"La meilleure tondeuse à gazoon du marché",
  quantity_in_stock:"15",
  buying_price:"8",
  selling_price:"14",
  quantity_per_case:"1",
  minimum_order_quantity:"5",
  supplier_id:"3",
)

Product.create(
  ean:"7658904635781",
  title:"Bougie vanille",
  description:"Une bougie aux essences de vanille",
  quantity_in_stock:"1",
  buying_price:"12",
  selling_price:"25",
  quantity_per_case:"5",
  minimum_order_quantity:"10",
  supplier_id:"4",
)

Product.create(
  ean:"7658904635782",
  title:"Bougie lavande",
  description:"Une bougie aux essences de lavande",
  quantity_in_stock:"0",
  buying_price:"6",
  selling_price:"10",
  quantity_per_case:"1",
  minimum_order_quantity:"1",
  supplier_id:"4",
)

Product.create(
  ean:"7658904635783",
  title:"Bougie fraise",
  description:"Une bougie aux essences de fraise",
  quantity_in_stock:"0",
  buying_price:"4",
  selling_price:"12",
  quantity_per_case:"2",
  minimum_order_quantity:"2",
  supplier_id:"5",
)

Product.create(
  ean:"7658904635784",
  title:"Bougie noisette",
  description:"Une bougie aux essences de noisette",
  quantity_in_stock:"25",
  buying_price:"12",
  selling_price:"28",
  quantity_per_case:"3",
  minimum_order_quantity:"6",
  supplier_id:"5",
)

Product.create(
  ean:"7658904635779",
  title:"Sapin odorant",
  description:"Fini les mauvaises odeurs dans votre voiture",
  quantity_in_stock:"4",
  buying_price:"15",
  selling_price:"30",
  quantity_per_case:"3",
  minimum_order_quantity:"3",
  supplier_id:"6",
)

Product.create(
  ean:"7658904635769",
  title:"Tilleul odorant",
  description:"Fini les mauvaises odeurs dans votre voiture",
  quantity_in_stock:"9",
  buying_price:"10",
  selling_price:"20",
  quantity_per_case:"5",
  minimum_order_quantity:"5",
  supplier_id:"6",
)

Product.create(
  ean:"9658904635769",
  title:"Huile moteur",
  description:"Le meilleur ami du garagiste",
  quantity_in_stock:"16",
  buying_price:"8",
  selling_price:"20",
  quantity_per_case:"5",
  minimum_order_quantity:"1",
  supplier_id:"6",
)

# 6 orders
Order.create(
  planned_delivery_date:Date.new(2022, 5, 12),
  total_price:"141",
  status:"1",
  user_id:"1",
  client_id:"6",
)

Order.create(
  planned_delivery_date:Date.new(2022, 5, 12),
  total_price:"56",
  status:"1",
  user_id:"1",
  client_id:"5",
)

Order.create(
  planned_delivery_date:Date.new(2022, 7, 14),
  total_price:"320",
  status:"0",
  user_id:"2",
  client_id:"4",
)

Order.create(
  planned_delivery_date:Date.new(2022, 7, 2),
  total_price:"34",
  status:"0",
  user_id:"2",
  client_id:"3",
)

Order.create(
  planned_delivery_date:Date.new(2022, 8, 4),
  total_price:"258",
  status:"3",
  user_id:"3",
  client_id:"2",
)

Order.create(
  planned_delivery_date:Date.new(2022, 8, 9),
  total_price:"120",
  status:"3",
  user_id:"3",
  client_id:"1",
)

# 12 orerlines
OrderLine.create(
  quantity:"12",
  line_total_price:"108",
  order_id:"1",
  product_id:"1",
)

OrderLine.create(
  quantity:"3",
  line_total_price:"33",
  order_id:"1",
  product_id:"2",
)

OrderLine.create(
  quantity:"1",
  line_total_price:"12",
  order_id:"2",
  product_id:"3",
)

OrderLine.create(
  quantity:"2",
  line_total_price:"44",
  order_id:"2",
  product_id:"4",
)

OrderLine.create(
  quantity:"5",
  line_total_price:"70",
  order_id:"3",
  product_id:"5",
)

OrderLine.create(
  quantity:"10",
  line_total_price:"250",
  order_id:"3",
  product_id:"6",
)

OrderLine.create(
  quantity:"1",
  line_total_price:"10",
  order_id:"4",
  product_id:"7",
)

OrderLine.create(
  quantity:"2",
  line_total_price:"24",
  order_id:"4",
  product_id:"8",
)

OrderLine.create(
  quantity:"6",
  line_total_price:"168",
  order_id:"5",
  product_id:"9",
)

OrderLine.create(
  quantity:"3",
  line_total_price:"90",
  order_id:"5",
  product_id:"10",
)

OrderLine.create(
  quantity:"5",
  line_total_price:"100",
  order_id:"6",
  product_id:"11",
)

OrderLine.create(
  quantity:"1",
  line_total_price:"20",
  order_id:"6",
  product_id:"12",
)
