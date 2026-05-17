# Coffee Shop Sales SQL Analysis

A portfolio SQL project that explores sales, customers, products, and store performance for a fictional coffee shop chain.

The goal is to show practical SQL skills for a GitHub profile: schema design, joins, aggregations, window functions, customer segmentation, and business-focused insights.

## Project Questions

- Which stores generate the most revenue?
- What are the best-selling products and categories?
- How does revenue trend over time?
- Which customers are high value?
- What products are frequently purchased together?
- Which stores have the strongest average order value?

## Repository Structure

```text
.
├── README.md
├── data
│   ├── customers.csv
│   ├── order_items.csv
│   ├── orders.csv
│   ├── products.csv
│   ├── seed.sql
│   └── stores.csv
├── queries
│   └── analysis.sql
├── schema.sql
└── insights.md
```

## Database

This project uses SQLite syntax so it can be run locally with minimal setup.

To create the database:

```bash
sqlite3 coffee_shop.db < schema.sql
sqlite3 coffee_shop.db < data/seed.sql
```

To run the analysis queries:

```bash
sqlite3 coffee_shop.db < queries/analysis.sql
```

## Skills Demonstrated

- Relational database design
- Primary and foreign keys
- `JOIN`, `GROUP BY`, and aggregate functions
- Common table expressions
- Window functions
- Customer segmentation
- Revenue and product analysis
- Business insight writing

## Example Business Insights

- Downtown is the top revenue store, driven by strong espresso and latte sales.
- Loyalty customers spend more per order than non-loyalty customers.
- Morning purchases account for the largest share of total sales.
- Espresso, latte, and croissant items are frequently purchased together.
