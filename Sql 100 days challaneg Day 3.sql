------------------------------------------------------------------------------------------------------------------------------------------------
----------------------100 Day Sql Challenge Day 3-------------------------------------------

-- Q1] year wise total Sales of Adventure work ?

select year(DueDate), sum(orderQty)* sum(UnitPrice) as Sales 
from Purchasing.PurchaseOrderDetail
group by year(DueDate)

select * from  Purchasing.PurchaseOrderDetail
select * from  Purchasing.PurchaseOrderHeader


-- Q2] Highest Price Product ?


select top 1 Name, MAX(UnitPrice) as prise  from Purchasing.PurchaseOrderDetail as ord
inner Join Production.Product as prd on ord.ProductID = prd.ProductID
group by Name
order by prise desc 


-- Q3] Product wise average How many Days take to ship Orders

select name as product_name, avg(DATEDIFF(day,OrderDate,ShipDate)) as Average_ship_days
from  Purchasing.PurchaseOrderDetail as dtl
inner join Purchasing.PurchaseOrderHeader as hed on dtl.PurchaseOrderID = hed.PurchaseOrderID
inner join Production.Product as prd on prd.ProductID = dtl.ProductID
group by Name

-- Q4] Product wise Shipping cost for each Product

select name as product_name, avg(Freight) as Average_ship_Cost
from  Purchasing.PurchaseOrderDetail as dtl
inner join Purchasing.PurchaseOrderHeader as hed on dtl.PurchaseOrderID = hed.PurchaseOrderID
inner join Production.Product as prd on prd.ProductID = dtl.ProductID
group by Name


-- Q5] Highest Sale Product ?

select top 1 name as product_name, sum(orderQty)* sum(UnitPrice) as Sales
from  Purchasing.PurchaseOrderDetail as dtl
inner join Purchasing.PurchaseOrderHeader as hed on dtl.PurchaseOrderID = hed.PurchaseOrderID
inner join Production.Product as prd on prd.ProductID = dtl.ProductID
group by Name

-- Q6] Number of order received per year 

select year(DueDate), COUNT(purchaseorderid)
from Purchasing.PurchaseOrderDetail
group by year(DueDate)

-- Q7] Give me list of product 

select distinct (Name) as product_name from Production.Product

-- Q8] Product Wise pending Order

select  name as product_name,COUNT(purchaseorderdetailid) Pending_Order
from  Purchasing.PurchaseOrderDetail as dtl
inner join Purchasing.PurchaseOrderHeader as hed on dtl.PurchaseOrderID = hed.PurchaseOrderID
inner join Production.Product as prd on prd.ProductID = dtl.ProductID
where Status = 1
group by Name
order by Pending_Order desc




-- Q9] Product wise tax amounnt 

select  name as product_name,sum(taxamt) as Tax_amount
from  Purchasing.PurchaseOrderDetail as dtl
inner join Purchasing.PurchaseOrderHeader as hed on dtl.PurchaseOrderID = hed.PurchaseOrderID
inner join Production.Product as prd on prd.ProductID = dtl.ProductID
group By name 
Order By Tax_amount desc

-- Q10 Year wise Revenue 

select year(DueDate), sum(orderQty)* sum(UnitPrice) - sum(freight) as Sales 
from Purchasing.PurchaseOrderDetail as dtl
inner join Purchasing.PurchaseOrderHeader as hrd 
on dtl.PurchaseOrderID = hrd.PurchaseOrderID 
group by year(DueDate)


