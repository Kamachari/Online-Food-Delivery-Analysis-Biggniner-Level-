-- create tabkes schema ( customers, restaurants, menu_items, orders, order_details )
-- 1.CUSTOMERS TABLE
create table customers
(
customer_id 		int primary key,
customer_name 		varchar(60),
email 				varchar(60),
city 				varchar(60),
signup_date 		date
);

-- 2.RESTAURANT TABLE
create table restaurants
(
restaurant_id 		int primary key,
rest_name 			varchar(60),
city 				varchar(60),
reg_date 			date
);

-- 3.MENU_ITEMS TABLE
create table menu_items
(
item_id 			int primary key,
restaurant_id 		int,
item_name 			varchar(60),
price 				decimal(10,2),
constraint fk_menu_rest 
foreign key (restaurant_id)
references restaurant (restaurant_id)
);

-- 4.ORDER TABLE
create table orders
(
order_id 			int primary key,
customer_id 		int,
restaurant_id 		int,
order_date 			date,
constraint fk_order_cust
foreign key (customer_id) references customers (customer_id),
constraint fk_order_rest
foreign key (restaurant_id) references restaurant (restaurant_id)
);

-- 5.ORDER_DETAILS TABLE
create table order_details
(
order_detail_id 	int primary key,
order_id 			int,
item_id 			int,
quantity 			int,
constraint fk_order_detail
foreign key (order_id) references orders (order_id),
constraint fk_order_item
foreign key (item_id) references menu_item (item_id)
);