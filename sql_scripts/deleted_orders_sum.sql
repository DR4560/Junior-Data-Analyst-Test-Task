SELECT
    TO_CHAR(o.date, 'YYYY-MM') AS period,
    SUM(oi.price * oi.quantity) AS total_sum_deleted
FROM
    test_order o
JOIN
    test_order_item oi ON o.id = oi.order_id
WHERE
    o.status = 'canceled' OR oi.deleted IS NOT NULL
GROUP BY
    TO_CHAR(o.date, 'YYYY-MM')
ORDER BY
    period;
