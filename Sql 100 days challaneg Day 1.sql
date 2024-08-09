-----

------------------------------------------------------------------------------------------------------------------------------------------------
----------------------100 Day Sql Challenge Day 1-------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------



--Q1] Total Number of Employee in Adventure Work

select distinct COUNT(BusinessEntityID) as totalEmployee
                from HumanResources.Employee  
				

--Q2] Total Number of male and female employee working in adventure work?

select Gender, COUNT(businessentityid) as Total_Employee 
from HumanResources.Employee
group by Gender
			                                    
--Q3] Todays birthday employee id 

select distinct(BusinessEntityID)
                from HumanResources.Employee  
				where day(BirthDate) =day(GETDATE())
				and
				month(BirthDate) =MONTH(GETDATE())


-- Q4] Total Married and unmarried Employee 


select MaritalStatus, COUNT(businessentityid) as Total_Employee 
               from HumanResources.Employee
                group by MaritalStatus


-- Q5] List of all departments in adventure work 

select Name department_name
  from HumanResources.Department

-- Q6] List of Unique Job titles


select distinct(JobTitle),count(BusinessEntityID) 
   from HumanResources.Employee
   group by JobTitle


-- Q7] Number of active employee

select distinct COUNT(BusinessEntityID) as 'total Active Employee'
                from HumanResources.Employee  
	            Where CurrentFlag = 1 


--Q8] Details of employee which age is greater that 40 years 

           select *   from HumanResources.Employee  
			where year(BirthDate) +40  <= YEAR(GETDATE())



--Q9] details of employee left in adventure work

select * from HumanResources.EmployeeDepartmentHistory
where EndDate is not null 


--Q10] Concatinate first and last name of person 

select concat(firstname,' ',lastname) as full_Nane
from Person.Person 


---------------------------------------Todays End----------------
                     --  Thank You ---