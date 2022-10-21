SELECT id, account_id, standard_qty,
       DATE_TRUNC('month', occurred_at) AS month,
       DENSE_rank() OVER w as dense_rank,
       sum(standard_qty) OVER w as sum_std_qty,
       count(standard_qty) OVER w as count_std_qty,
       avg(standard_qty) OVER w as avg_std_qty,
       min(standard_qty) OVER w as max_std_qty,
       max(standard_qty) OVER w as min_std_qty
from orders
WINDOW w AS (PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at));