-- Pivoting
SELECT *
FROM (
  SELECT product_name, category_name, sales
  FROM products p
  JOIN categories c ON p.category_id = c.category_id
)
PIVOT (
  SUM(sales)
  FOR category_name IN ('Category A', 'Category B', 'Category C')
) AS pivot_table;

-- Unpivoting
SELECT product_name, category, sales
FROM products
UNPIVOT (
  sales
  FOR category IN (category_a, category_b, category_c)
);