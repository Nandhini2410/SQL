

-- Campaigns Table
CREATE TABLE Campaigns
(
	  Campaign_Id                  INT,
	  Campaign_name Varchar(50)    Not Null,
	  Start_Date                   date,
	  End_date                     date
 )

  Insert Into Campaigns values
     (1,'Summer Sale','2023-01-01','2023-06-30')
	 ,(2,'Back to School','2022-08-01','2022-09-01')
	 ,(3,'Winter Sale','2022-12-01','2023-01-01')

	 Select*from Campaigns
------------------------------------------------------------------------------------
-- Adsets Table
Create Table Adsets
(
 Adest_Id Int,
 Adset_Name Varchar(50) Not Null,
 Campaign_Id Int
 )

 Insert Into Adsets Values
      (1,'Womens Shoes',1)
	  ,(2,'Mens Shoes',1)
	  ,(3,'Kids Shoes',2)
	  ,(4,'Winter Clothes',3)

	  Select * from Adsets
------------------------------------------------------------------------------------
Create Table Placements
(
 Placement_Id Int,
 Placement_Name Varchar(50) Not Null
 )

 Insert Into Placements Values
    (1,'Facebook Feed'),(2,'Instagram Feed'),(3,'Audience Network'),(4,'Messenger Inbox')

	Select * from Placements
------------------------------------------------------------------------------------
CREATE TABLE Performance
	(
	 Adset_Id		INT,
	 Placement_Id	INT,
	 Impressions	INT ,
	 Clicks			INT,
	 Cost			INT
	)

   INSERT INTO Performance VALUES
            (1,1,10000,500,1000)
		   ,(1,2,50000,250,500)
		   ,(1,3,2000,100,200)
		   ,(2,1,15000,750,1500)
		   ,(2,2,80000,400,800)
		   ,(2,3,3000,150,300)
		   ,(3,1,5000,250,500)
		   ,(3,2,2500,125,250)
		   ,(4,1,10000,50,100)

	Select * from Performance
------------------------------------------------------------------------------------
--
	Select Campaign_Id,Campaign_Name
	From Campaigns
	Where End_date>Getdate()

	
	Select Pl.Placement_Name
	From
	 Placements As Pl
	 Join
	 Performance As Pe
	 On Pl.Placement_Id=Pe.Placement_Id
	 Where Pe.Clicks=(Select Max(Clicks)from Performance)

	 
	 Select Ca.Campaign_Name
	 From
	  Campaigns As Ca
	  Join
	  Adsets As A
	  On Ca.Campaign_Id=A.Campaign_Id
	  Join
	  Performance As Pe
	  On A.Adest_Id=Pe.Adset_Id
	  Where Pe.Cost=(select Max(cost) from Performance)

	  Select A.Adset_Name,Pe.Cost
	  From
	   Adsets As A
	   Join
	   Campaigns As Ca
	   On A.Campaign_Id=Ca.Campaign_Id
	   Join
	   Performance As Pe
	   On Pe.Adset_Id=A.Adest_Id
	   Join
	   Placements As Pl
	   On Pl.Placement_Id=Pe.Placement_Id
	   Where Adset_Name= 'Womens Shoes' And
	         Placement_Name='Facebook Feed' And
			 Campaign_name='Summer Sale'
------------------------------------------------------------------------------------
	  Select A.Adest_Id,A.Adset_Name
	  From
	    Adsets As A
	    Join
		Performance As Pe
		On Pe.Adset_Id=A.Adest_Id
		Where Impressions=(select Max(Impressions) from Performance 
		      Where Impressions<(select Max(Impressions)from Performance))
------------------------------------------------------------------------------------
	  Select A.Adest_Id,A.Adset_Name , Row_Number() Over ( order by Impressions ) As RNO
	  From
	    Adsets As A
	    Join
		Performance As Pe
		On Pe.Adset_Id=A.Adest_Id


		  Select A.Adest_Id,A.Adset_Name , Dense_Rank() Over ( order by Impressions ) As RNO
	  From
	    Adsets As A
	    Join
		Performance As Pe
		On Pe.Adset_Id=A.Adest_Id
		Order By RNO



		Select * from Adsets


		FROM
		WHERE
		GROUP BY
		HAVING
		SELECT TOP DISTINCT
		ORDER BY









		 









































