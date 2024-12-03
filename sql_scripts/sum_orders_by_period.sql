SELECT
    TO_CHAR(date, 'YYYY-MM') AS period,  
    SUM(oi.price * oi.quantity) AS total_sum   
FROM
    test_order o 
JOIN
    test_order_item oi ON o.id = oi.order_id  
WHERE
    o.status != 'canceled'  
    AND oi.deleted IS NULL  
GROUP BY
    TO_CHAR(date, 'YYYY-MM')  
ORDER BY
    period;   
