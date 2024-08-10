------------------------------------------------------------------------------------------------------------------------------------------------
----------------------100 Day Sql Challenge Day 2-------------------------------------------



 -- Q1] total employee in each department

 Select Name As Department, count(BusinessEntityID) As Total_Employee
 From HumanResources.Department as d
 inner join HumanResources.EmployeeDepartmentHistory as e
 on d.DepartmentID = e.DepartmentID
 Group by Name

 -- Q2] male and female employee in each department 

 Select  Name , Gender, Count (Gender) as Total_Employee
 From HumanResources.Department as d
 inner join HumanResources.EmployeeDepartmentHistory as e
 on d.DepartmentID = e.DepartmentID
 Inner join
 HumanResources.Employee as H 
 On e.BusinessEntityID = h.BusinessEntityID
 Group By Name , Gender 
 Order by total_Employee desc


 -- Q3] Receintly Hired employee 

Select top 1
CONCAT(FirstName,' ',LastName) as Employee_Name, MAX(Startdate) as dateofjoin
from HumanResources.Employee as A
Inner Join
Person.Person as b
on A.BusinessEntityID = b.BusinessEntityID
Inner Join 
HumanResources.EmployeeDepartmentHistory as Hd 
on a.BusinessEntityID = Hd.BusinessEntityID
Group by CONCAT(FirstName,' ',LastName) 
Order by  dateofjoin Desc
		
		
 -- Q4] Adventure Work Ceo Name
  
  Select CONCAT(FirstName,' ',LastName) as CEO_Name from HumanResources.Employee as A
         Inner Join Person.Person as b on A.BusinessEntityID = b.BusinessEntityID
		 where JobTitle = 'Chief Executive Officer'


 -- Q5] Replace Gender column F = female M Male 

      Update Purchasing.Vendor 
      set PreferredVendorStatus = 
	  case 
	  when PreferredVendorStatus = 1
	  then 'Prefered' else 'Not Prefered'
	  end 


 -- Q6] Job title for Employee John Evans

 select CONCAT(FirstName,' ',LastName) as 'Name', Name department 
from HumanResources.Employee As E 
         inner join 
		 HumanResources.EmployeeDepartmentHistory as H on e.BusinessEntityID = h.BusinessEntityID
		 inner join
		 HumanResources.Department as d on h.DepartmentID = d.DepartmentID 
		 inner join
		 Person.Person as p  on e.BusinessEntityID = p.BusinessEntityID
where FirstName = 'john' and LastName = 'Evans'


 -- Q7] People Directly Reported to CEO

 Select CONCAT(FirstName,' ',LastName),JobTitle from HumanResources.Employee as A
         Inner Join Person.Person as b on A.BusinessEntityID = b.BusinessEntityID
		 where OrganizationLevel =1


 -- Q8] When CEO start Working In Adventure Work 

 Select CONCAT(FirstName,' ',LastName) as 'CEO Name', HireDate as 'start working'
 from HumanResources.Employee as A
 Inner Join Person.Person as b on A.BusinessEntityID = b.BusinessEntityID
 where JobTitle = 'Chief Executive Officer'


 -- Q9] Total People Working on job title SP 

     select count(distinct (JobTitle))                                          
                from HumanResources.Employee as a
				inner join Person.Person as b
				on a.BusinessEntityID = b.BusinessEntityID
	Where CurrentFlag = 1 
	and PersonType = 'SP' 

 -- Q10 Which perchasing vendor have highest credit Rating/

   select MAX(creditrating), Name from Purchasing.Vendor as vd 
   inner join  Person.Person as p
   on 
   vd.BusinessEntityID = p.BusinessEntityID
   inner join Person.BusinessEntity as be on
   vd.BusinessEntityID = be.BusinessEntityID
   Group By Name


