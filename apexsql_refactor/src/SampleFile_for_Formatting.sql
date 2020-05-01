--ここから、SQL Apex Refactorのサンプルコード 

------------------------------
--Formattingのサンプルクエリ--
------------------------------

CrEaTE prOCEdurE spInsertOrUpdateProduct /* Input parameters --*/
@productnumber nvarchar(25),@listprice money AS beGIn iF eXISTs(sElECT * FROm
Production.Product WHErE ProductNumber=@productnumber AnD ListPrice>1000) begin
updAtE Production.Product Set ListPrice=ListPrice-100 wHEre ProductNumber=
@productnumber; eND; ELsE BEgIN insERt iNto Production.Product(ProductNumber,
ListPrice) seLECT @productnumber,@listprice; eNd; END;
Go
SelEct * FROm Production.Product;
gO
iNSert intO Production.UnitMeasure(UnitMeasureCode,Name,ModifiedDate) vALUEs(
N'FT2',N'Square Feet','20080923');
go


----------------------------------^
--Capitalizationのサンプルクエリ--
----------------------------------

DEClArE @initials varchar(5); DECLAre @firstname varchar(25); DeCLARe @lastname
varchar(25); seT @firstname='Katie'; SEt @lastname='Melua'; sElEcT @initials=
SUBSTRING(@firstname,1,1)+SUBSTRING(@lastname,1,1); Print @initials; SELECt *
fRoM humanresources.employee; wAiTfoR TiMe '00:00'; sELEct @@servername; 


----------------------------
--Commentsのサンプルクエリ--
----------------------------
sElect name,productnumber,color /* First line of a multiple-line comment. Second line of a multiple-line comment. */
fRom production.product;/* Single line comment.*/
GO


------------------------------
--Statementsのサンプルクエリ--
------------------------------
iNsert iNTO #tmp seLEct DIStinCT  c.lastname aS a,c.firstname AS b fRoM person.
person As c joIN humanresources.employee aS e oN e.businessentityid=c.
businessentityid where c.businessentityid iN(SelEct salespersonid fROm sales.
salesorderheader WhERE salesorderid IN(sELECT salesorderid FrOM sales.
salesorderdetail WheRe productid IN(seleCT productid froM production.product aS
p WheRE productnumber iN(1,2,3))));
GO
sELEct * fRoM person.address,person.addresstype;
Go
UpDAte sales.salesorderheader SET salespersonid=1;
go
creAtE PRocEDURE humanresources.uspupdateemployeelogin @currentflag dbo.Flag aS
BEGiN uPDAtE humanresources.employee SeT currentflag=@currentflag wHere
businessentityid=@businessentityid; ENd;
go


-------------------------
--tableのサンプルクエリ--
-------------------------
SelEcT c.
LastName as a,c.FirstName As b fRom Person.Person;
go
sEleCt * frOm Person.Address,Person.AddressTypePerson.AddressLocation;
go


--------------------------
--Columnのサンプルクエリ--
--------------------------
SELeCT c.
LastName aS a,c.FirstName AS b FroM Person.Person;
GO
INseRT INTO Person(FirstName,LastName,Age) vaLues(PersonFirstName,
PersonLastName,PersonAge);
gO


-------------------------
--valueのサンプルクエリ--
-------------------------
insERT INto
Production.UnitMeasure valuES(N'FT2',N'Square Feet ','20080923'),(N'Y',N'Yards',
'20080923'),(N'Y3',N'Cubic Yards','20080923');
gO
INsERT intO Person(FirstName,LastName,Age) VALuEs(PersonFirstName,
PersonLastName,PersonAge);
go


-----------------------------------
--Where in valuesのサンプルクエリ--
-----------------------------------
SeLeCt productid frOM production.product as p WhERE productnumber IN(1,2,3); 


-------------------------------
--Assignmentsのサンプルクエリ-
-------------------------------
cReaTE PrOCEDurE HumanResources.uspUpdateEmployeeLogin @businessentityid int,
@organizationnode hierarchyid,@loginid nvarchar(256),@jobtitle nvarchar(50),
@hiredate datetime,@currentflag dbo.Flag as BegiN UpDATe HumanResources.
Employee SEt OrganizationNode=@organizationnode,LoginID=@loginid,JobTitle=
@jobtitle,HireDate=@hiredate,CurrentFlag=@currentflag WheRE BusinessEntityID=
@businessentityid; eNd;
GO
cReAte DaTABasE Sales ON(SIZE=10,MaxSizE=50,fiLEGROwth=5);
Go


-----------------------------
--Variablesのサンプルクエリ--
-----------------------------
DeCLare @ninitials varchar(25),@firstname varchar(25),@lastname varchar(25); 


------------------------------
--Parametersのサンプルクエリ--
------------------------------
CREAte tABLe person(firstname varchar(50),lastname varchar(50),age int);
Go
Create pROCEDure humanresources.uspupdateemployeelogin @businessentityid int,
@organizationnode hierarchyid,@loginid nvarchar(256),@jobtitle nvarchar(50),
@hiredate datetime,@currentflag dbo.Flag AS BEgIN uPdAte humanresources.
employee sEt organizationnode=@organizationnode WHeRe businessentityid=
@businessentityid; END; 

--以下追記
go
--追記ここまで 


-------------------------------
--Expressionsのサンプルクエリ--
-------------------------------
SELECT employee,oldsalary,newsalary FrOM salary wheRe oldsalary<=5 aND
oldsalary+@coli*oldsalary<10 oR (@coli+10-45+125)/5<1000; 


-------------------------
--Joinsのサンプルクエリ--
-------------------------
Select Tunes.Name,Musicians.Name,Duos.Name froM Tunes iNNER JoIN Musicians ON
Tunes.Name=Musicians.Name inNer jOIN Duos on musicians.name=duos.name; 

--以下追記
gO
---追記ここまで


--------------------------------
--Flow controlのサンプルクエリ--
--------------------------------
cReAte ProCEDURE ufn_salesbystore(@storeid int) as beGin IF @storeid>10 begIn
SeLEcT productnumber p,name n,'Price Range'=cASE wheN listprice=0 ThEn
'Mfg item - not for resale' WHEN listprice<50 tHen 'Under $50' elSe
'Over $1000' eND From production.product; EnD eLse BeGin prInT
'Incorrect Store ID'; ENd; eNd;

--以下追記
go
--追記ここまで 

/*ここまで、SQL Apex Refactorのサンプルコード*/



/*ここから、追加文*/

--WHERE句にて、()句を追加
seLEcT employee,oldsalary,newsalary FroM salary WHeRe oldsalary<=5 And
oldsalary+@coli*oldsalary<10 aNd (oldsalary+@coli*oldsalary<10 or (@coli+10-45+
125)/5<1000);

--GROPUBY句とORDERBY句を確認
SeLEcT L_RETURNFLAG,L_LINESTATUS,SUM(L_QUANTITY) AS SUM_QTY,SUM(L_EXTENDEDPRICE)
AS SUM_BASE_PRICE,SUM(L_EXTENDEDPRICE*(1-L_DISCOUNT)) As SUM_DISC_PRICE,SUM(
L_EXTENDEDPRICE*(1-L_DISCOUNT)*(1+L_TAX)) AS SUM_CHARGE,AVG(L_QUANTITY) AS
AVG_QTY,AVG(L_EXTENDEDPRICE) AS AVG_PRICE,AVG(L_DISCOUNT) As AVG_DISC,COUNT(*)
As COUNT_ORDER FRom LINEITEM wHErE L_SHIPDATE<=DATEADD(dd,-90,CAST('1998-12-01'
As datetime)) GrOUp by L_RETURNFLAG,L_LINESTATUS OrdER BY L_RETURNFLAG,
L_LINESTATUS;


--長い計算式を確認
seLEct 100.00*SUM(CaSE WhEN P_TYPE lIKe 'PROMO%%' TheN L_EXTENDEDPRICE*(1-
L_DISCOUNT) elSE 0 eND)/SUM(L_EXTENDEDPRICE*(1-L_DISCOUNT)) aS PROMO_REVENUE
FrOM LINEITEM,PART wherE L_PARTKEY=P_PARTKEY aND L_SHIPDATE>='1995-09-01' AND
L_SHIPDATE<DATEADD(mm,1,'1995-09-01');


--With句を確認
/*
Microsoft Docsより引用 
WITH common_table_expression (Transact-SQL) 
https://docs.microsoft.com/ja-jp/sql/t-sql/queries/with-common-table-expression-transact-sql?view=sql-server-ver15
*/
WitH Sales_CTE(SalesPersonID,TotalSales,SalesYear) AS  /* Define the first CTE query. */
(SeLECT SalesPersonID,SUM(TotalDue) As TotalSales,YEAR(OrderDate) as SalesYear
fRoM Sales.SalesOrderHeader WheRE SalesPersonID Is nOT NUlL GRoUP by
SalesPersonID,YEAR(OrderDate)), /* Use a comma to separate multiple CTE definitions.  Define the second CTE query, which returns sales quota data by year for each sales person. */
Sales_Quota_CTE(BusinessEntityID,SalesQuota,SalesQuotaYear) As (selECt
BusinessEntityID,SUM(SalesQuota) AS SalesQuota,YEAR(QuotaDate) AS
SalesQuotaYear FROM Sales.SalesPersonQuotaHistory gROup By BusinessEntityID,
YEAR(QuotaDate)) /* Define the outer query by referencing columns from both CTEs. */
SeleCT SalesPersonID,SalesYear,FORMAT(TotalSales,'C','en-us') as TotalSales,
SalesQuotaYear,FORMAT(SalesQuota,'C','en-us') AS SalesQuota,FORMAT(TotalSales-
SalesQuota,'C','en-us') AS Amt_Above_or_Below_Quota FrOM Sales_CTE jOiN
Sales_Quota_CTE on Sales_Quota_CTE.BusinessEntityID=Sales_CTE.SalesPersonID AnD
Sales_CTE.SalesYear=Sales_Quota_CTE.SalesQuotaYear oRDer bY SalesPersonID,
SalesYear;

