SELECT * FROM customer_behavior.customer;
select shippingtype, avg(purchaseAmount) from customer
where ShippingType in ('Standard', 'Express')
group by ShippingType;
select SubscriptionStatus, 
count(CustomerID) as total_customer,
avg(PurchaseAmount) as avg_spend,
sum(PurchaseAmount) as total_revenue
from customer
group by SubscriptionStatus
order by total_revenue, avg_spend desc;

with customer_type as (
select CustomerID, PreviousPurchases,
CASE
	WHEN PreviousPurchases = 1 THEN 'NEW'
    WHEN PreviousPurchases BETWEEN 2 AND 10 THEN 'Returning'
    ELSE 'Loyal'
    END AS customer_segment
    from customer
)

select customer_segment, count(*) as "number_of_customers"
from customer_type
group by customer_segment;

SELECT * FROM customer_behavior.customer;




