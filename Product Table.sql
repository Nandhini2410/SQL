

---- Customer Table

  CREATE TABLE  Customer
  (
     Customer_Id                  Int,
	 Customer_Name  varchar(50)   Not Null
  )

  INSERT INTO Customer Values (1,'John Smith')
                             ,(2,'Jane Doe')
							 ,(3,'Bob Johnson')
							 ,(4,'Alice Brown')
							 ,(5,'Tom Wilson')

	Select * from Customer

---------------------------------------------------------------------------------------

 --- Products Table

 CREATE TABLE Product
 (
   Product_Id               Int,
   Product_Name Varchar(50) Not Null,
   Product_Price            Int
 )

 INSERT INTO Product Values (1,'iphone',200000)
                           ,(2,'Motorala',15000)
						   ,(3,'Oppo',10000)
						   ,(4,'Samsung',150000)
						   ,(5,'Vivo',75000)

	Select * from Product

-----------------------------------------------------------------------------------

---Orders Table

  CREATE TABLE Orders
  (
     Order_Id             Int,
	 Customer_Id          Int,
	 Product_Id           Int,
	 Order_Date           Date
  )

  INSERT INTO Orders Values (1,1,2,'2022-01-01')
                           ,(2,1,4,'2022-01-02')
						   ,(3,2,1,'2022-01-02')
						   ,(4,4,3,'2022-01-03')
						   ,(5,4,3,'2022-01-03')
						   ,(6,5,2,'2023-03-04')
						   ,(7,5,4,'2023-05-05')

		Select * from Orders 

-----------------------------------------------------------------------------------------------------------

--Get a list of all orders along with the customer's name and the product name

   Select C.Customer_Name,P.Product_Name,O.Order_Id
   from Customer As C
	Join
	Product As P
	On C.Customer_Id=P.Product_Id
	Join
	Orders As O
	On O.Customer_Id=C.Customer_Id

-----------------------------------------------------------------------------------------------------------------------------

--Get a list of all customers and total number of orders they have placed, even if they have not placed any orders

     
	 SELECT C.Customer_Id, C.Customer_Name, COUNT(O.Order_Id) AS Total_Orders
               FROM Customer As C
              LEFT JOIN Orders As O
			  ON C.Customer_Id = O.Customer_Id
               GROUP BY C.Customer_Id, C.Customer_Name

---------------------------------------------------------------------------------------------------------------------------------

--Find a customer who has paid highest amount for his orders

		 Select C.Customer_Id, C.Customer_Name, MAX(TotalAmount) AS HighestAmountPaid
                  FROM Customer As C
                  JOIN 
					  (
					   SELECT Customer_Id, SUM(Order_Id) AS TotalAmount
					   FROM Orders As O
						GROUP BY Customer_Id
					   ) 
				  AS OrderTotals
				     ON C.Customer_Id = OrderTotals.Customer_Id
                     GROUP BY C.Customer_Id, C.Customer_Name
                     ORDER BY HighestAmountPaid DESC

--------------------------------------------------------------------------------------------------------------

--Identify the most bought product by Customer
 
          Select C.Customer_Id, C.Customer_Name,P.Product_Name, Count(*) As TotalOrders
		    from Customer As C
			Join
			Product As P
			On C.Customer_Id=P.Product_Id
			Group by C.Customer_Id, C.Customer_Name,P.Product_Name



			Having Count(*) = 
			                 (  
							    Select MAX(Count_Orders)
                             From (
                                    Select Customer_Id, COUNT(*) AS Count_Orders
                                      from Orders
                                      Group by Customer_Id
                                   )
								     As OrderCounts
					          )

---------------------------------------------------------------------------------------------------------------

--Find year wise and month wise product sales
                             
			SELECT YEAR(Product_Id) AS Year, MONTH(Product_price) AS Month, Product_Id, COUNT(*) AS TotalSales
            FROM Product
            GROUP BY YEAR(Product_Id) , MONTH(Product_Price) ,Product_Id
            ORDER BY Year, Month

  ------------------------------------------------------------------------------------------------------------------------

  --Identify the product was not sold so far

      SELECT Product_Id, Product_Name
                 FROM Product
                 WHERE Product_Id    NOT IN 
			 (
                 SELECT DISTINCT Product_Id
                 FROM Orders
              )

------------------------------------------------------------------------------------------------------------------------------

--Identify who hasn't placed any order so far
   
              SELECT C.Customer_Id, C.Customer_Name
                   FROM Customer As C
                   LEFT JOIN Orders As O
				   ON C.Customer_Id = O.Customer_Id
                   WHERE O.Customer_Id IS NULL































