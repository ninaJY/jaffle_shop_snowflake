{% docs fct_orders %}
## 订单事实表

**粒度**：每行代表一笔订单。

**业务规则**：
- 数据来源于 `stg_orders`，按天增量更新
- 只包含已完成状态的订单金额

**用途**：作为销售分析的核心事实表，被 `sales_overview_dashboard` 引用。
{% enddocs %}