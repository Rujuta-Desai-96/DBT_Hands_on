with utc_dates as 
    (select 
        id AS order_item_id,
        order_id,
        user_id,
        product_id,
        inventory_item_id,
        status,

        DATEADD(
            SECOND,
            IFF(
                EXTRACT(SECOND FROM TO_TIMESTAMP_TZ(
                    created_at, 
                    IFF(POSITION('.' IN created_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
                )) - 
                FLOOR(EXTRACT(SECOND FROM TO_TIMESTAMP_TZ(
                    created_at, 
                    IFF(POSITION('.' IN created_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
                ))) >= 0.5, 
                1, 
                0
            ),
            DATE_TRUNC('SECOND', TO_TIMESTAMP_TZ(
                created_at, 
                IFF(POSITION('.' IN created_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
            ))
        ) AS created_at_tz,

        DATEADD(
            SECOND,
            IFF(
                EXTRACT(SECOND FROM TO_TIMESTAMP_TZ(
                    shipped_at, 
                    IFF(POSITION('.' IN shipped_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
                )) - 
                FLOOR(EXTRACT(SECOND FROM TO_TIMESTAMP_TZ(
                    shipped_at, 
                    IFF(POSITION('.' IN shipped_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
                ))) >= 0.5, 
                1, 
                0
            ),
            DATE_TRUNC('SECOND', TO_TIMESTAMP_TZ(
                shipped_at, 
                IFF(POSITION('.' IN shipped_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
            ))
        ) AS shipped_at_tz,

        DATEADD(
            SECOND,
            IFF(
                EXTRACT(SECOND FROM TO_TIMESTAMP_TZ(
                    delivered_at, 
                    IFF(POSITION('.' IN delivered_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
                )) - 
                FLOOR(EXTRACT(SECOND FROM TO_TIMESTAMP_TZ(
                    delivered_at, 
                    IFF(POSITION('.' IN delivered_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
                ))) >= 0.5, 
                1, 
                0
            ),
            DATE_TRUNC('SECOND', TO_TIMESTAMP_TZ(
                delivered_at, 
                IFF(POSITION('.' IN delivered_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
            ))
        ) AS delivered_at_tz,

        DATEADD(
            SECOND,
            IFF(
                EXTRACT(SECOND FROM TO_TIMESTAMP_TZ(
                    returned_at, 
                    IFF(POSITION('.' IN returned_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
                )) - 
                FLOOR(EXTRACT(SECOND FROM TO_TIMESTAMP_TZ(
                    returned_at, 
                    IFF(POSITION('.' IN returned_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
                ))) >= 0.5, 
                1, 
                0
            ),
            DATE_TRUNC('SECOND', TO_TIMESTAMP_TZ(
                returned_at, 
                IFF(POSITION('.' IN returned_at) > 0, 'YYYY-MM-DD HH24:MI:SS.FF6 TZD', 'YYYY-MM-DD HH24:MI:SS TZD')
            ))
        ) AS returned_at_tz,

        sale_price

        from {{ ref("mart_order_items")}}
    )

select * from utc_dates

