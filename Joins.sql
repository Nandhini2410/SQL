Use Practice_Nandhini


Select * from Employees

Select * from EmployeeID


Exec SP_Rename 'EmployeeID','Department'


 Select * from Department  ,Employees 
 
 Select * from Department
                                                Innerjoin:

Select 'A' Union Select 'A'
                                                          Employee Table (Employee_Id,First_Name,Last_Name,Email,Phone_Number,Hire_date,Job_Id,Sallary,Manager_Id,Department_Id)
														  Department Table (Department_Id,First_Name,Last_Name,Ralationship,EmployeeID)
Select 'A' UnionAll Select 'B'
                                                        
											Select D.*,E.Department_Id                         
											from Employees As E 
								             Inner Join
											Departments As D
											On E.Department_Id=D.Department_Id                                                                

    Select E.*, D.Department_Name
          from Departments As D
		  Inner Join
		  Employees As E
		  On D.Department_Id=E.Department_Id

LeftJoin:                                                            Select D.*,E.Employee_Id
                                                                              from Employees as e
																			  left join
																			  departments as d
																			  on e.Department_Id=D.department_Id
		  Select E.*, D.Department_Name,D.Department_Id              
		   from Employees As E
		   Left Join
		   Departments As D
		   On D.Department_Id= E.Department_Id

RightJoin:                                                       Select e.*,d.*
                                                                    from Department as d
																	right join
																	Employees as e
																	On d.Dependent_Id=e.Department_Id
         Select D.*,E.Department_Id
		 From Employees As E
		 Right Join
		 Departments As D
		 ON E.Department_Id= D. Department_Id



		                      select l.*,c.Country_Id,c.Country_Name,c.Region_Id
							     from Country as c
								 Inner join
								 Location as L
								 On c.Country_Id=l.Country_Id

                
		Select D.*, D.Department_Name,D.Department_Id              
		   from Employees As E
		   Left Join
		   Departments As D
		   On D.Department_Id= E.Department_Id

								            Select  D.Department_Name,  Count(*) As EmpCount            
		                                          from Employees As E
		                                          Left Join
		                                          Departments As D
		                                          On D.Department_Id= E.Department_Id
												  Group by D.Department_Name

							Select  D.Department_Name,  Count(Employee_Id) As EmpCount            
		                          from Employees As E
		                          Left Join
		                          Departments As D
		                          On D.Department_Id= E.Department_Id
							      Group by D.Department_Name                                     Select * from Departments       Select * from Employees
								                                           
																		                        Insert Into Departments Values (12,'Sasthra',Null)


                   Select E.*, D.Department_Name
				     From Departments As D
					    Join
					    Employees As E
					 On D.Department_Id=E.Department_Id
					 Where D.Department_Name Is Null
					                                         
															 Select D.Department_Name ,Max(Salary) As HighSal
															    From Departments As D
																    Left Join 
																	Employees AS E
																	On E.Department_Id=D.Department_Id
																	Group by Department_Name

	   Select D.*,E.*
	      From Employees As E
		  Join 
		  Departments As D
		  On E.Department_Id=D.Department_Id
		  Where Hire_date > ='1997-01-01' And Hire_date < '1998-01-01'

		                          Select D.Department_Name, E.Hire_date, Datediff (Month,Hire_Date,GetDate()) As Month
								      From Employees As E
									  Left join
									  Departments As D
									  On E.Department_Id=D.Department_Id
				
				Select E.*,D.Department_Name
				 from Employees As E
				  Left Join
				  Departments As D
				  On E.Department_Id=D.Department_Id
				  Where D.Department_Id Is Null
				
		Exec Sp_Rename 'Department','Dependent'	
		Exec Sp_Rename 'Dependent','Departments'
		
	