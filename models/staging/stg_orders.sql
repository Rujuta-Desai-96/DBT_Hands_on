{{ config(materialized="table") }}


select 
    ORDER_ID,
    USER_ID,
    STATUS ,
    GENDER ,
    CREATED_AT ,
    RETURNED_AT ,
    SHIPPED_AT ,
    DELIVERED_AT	
from elook_commerce.dbt_rsanjaydesai.orders 


