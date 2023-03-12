Select * from BikeStores.dbo.orderid 

Select o.order_id, 
       Concat(c.first_name, ' ', c.last_name) 'customers',
       c.city,
	   c.state,
	   o.order_date,
	   SUM(i.quantity) 'total_units',
	   Sum(i.quantity * i.list_price) 'revenue',
	   p.product_name,
	   pc.category_name,
	   pb.brand_name,
	   ss.store_name,
	   Concat(sst.first_name, ' ', sst.last_name) 'sales_rep'
From sales.orders o
JOIN sales.customers c
ON o.customer_id = c.customer_id
JOIN sales.order_items i
ON o.order_id = i.order_id
Join production.products p
On i.product_id = p.product_id
Join production.categories pc
On p.category_id = pc.category_id
JOIN production.brands pb
On p.brand_id = pb.brand_id
JOIN sales.stores ss
On o.store_id = ss.store_id
Join sales.staffs sst
On o.staff_id = sst.staff_id
Group by 
       o.order_id, 
	   Concat(c.first_name, ' ', c.last_name),
       c.city,
	   c.state,
	   o.order_date,
	   p.product_name,
	   pc.category_name,
	   pb.brand_name,
	   ss.store_name,
	   Concat(sst.first_name, ' ', sst.last_name)
