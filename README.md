# Jaffle Shop Snowflake — Incremental Models & Snapshots

A dbt project built on synthetic Jaffle Shop data, demonstrating incremental 
loading and SCD Type 2 snapshots with Snowflake.

## Project Structure
- **staging**: cleans and renames raw source data
- **marts**: final business-facing models (incremental)
- **snapshots**: tracks historical changes in order data (SCD Type 2)

## Key Concepts Demonstrated
- Incremental models: only processes new data on each run
- dbt Snapshots: captures historical changes (SCD Type 2)
- Source freshness and data tests

## Tools
- dbt-core
- dbt-snowflake
- Snowflake
- jafgen (synthetic data generation)

## How to Run

### First time (full load)
```bash
dbt seed
dbt run
dbt test
```

### Incremental run (new data only)
```bash
dbt seed --full-refresh
dbt run --select fct_orders
```

### Snapshots
```bash
dbt snapshot
```