{{ config(materialized = 'table') }}

select ID ,
	ORDER_ID ,
	USER_ID ,
	PRODUCT_ID ,
	INVENTORY_ITEM_ID ,
	STATUS ,
	CREATED_AT ,
	SHIPPED_AT ,
	DELIVERED_AT ,
	RETURNED_AT ,
	SALE_PRICE 
    from elook_commerce.dbt_rsanjaydesai.order_items