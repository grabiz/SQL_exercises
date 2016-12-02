/*EXERCISES CHAP 3*/
/*1*/
SELECT VendorContactFName,VendorContactLName,VendorName
FROM Vendors
ORDER BY VendorContactLName,VendorContactFName; 
/*2*/
SELECT InvoiceNumber AS Number,InvoiceTotal AS Total,
       PaymentTotal+CreditTotal AS Credits, InvoiceTotal-Credits AS Balance
FROM Invoices;
/*3*/
SELECT VendorContactLName + ','+ VendorContactFName AS "Full Name"
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName;
/*4*/
SELECT IvoiceTotal, 10%*InvoiceTotal AS "10%", InvoiceTotal + "10%" AS "Plus 10%"
FROM Invoices
WHERE InvoiceTotal-PaymentTotal-CreditTotal >1000
ORDER BY InvoiceTotal DESC;
/*5*/
SELECT InvoiceNumber AS Number,InvoiceTotal AS Total,
       PaymentTotal+CreditTotal AS Credits, InvoiceTotal-Credits AS Balance
FROM Invoices
WHERE InvoiceTotal BETWEEN 500 AND 10000;
/*6*/
SELECT VendorContactLName + ','+ VendorContactFName AS "Full Name"
FROM Vendors
WHERE VendorContactLName LIKE '[ABCE]%'
ORDER BY VendorContactLName, VendorContactFName;
/*7*/
SELECT PaymentDate
FROM Invoices
WHERE (PaymentDate IS NULL AND (InvoiceTotal-PaymentTotal-CreditTotal) IS NULL)
       OR (PaymentDate IS NOT NULL AND (InvoiceTotal-PaymentTotal-CreditTotal) IS NOT NULL);
/*EXERCISES CHAP 4*/
/*1*/
SELECT *
FROM Vendors JOIN Invoices
     ON Vendors.VendorID=Invoices.VendorID;
/*2*/
SELECT VendorName,InvoiceNumber,InvoiceDate,InvoiceTotal-(PaymentTotal+CreditTotal) AS Balance
FROM  Vendors JOIN Invoices
      ON Vendors.VendorID=Invoices.VendorID
WHERE Balance <>0
ORDER BY VendorName;
/*3*/
SELECT VendorName,DefaultAccountNo,AccountDescription
FROM Vendors JOIN GLAccounts
     ON Vendors. 
ORDER BY AccountDescription,VendorName;
/*4*/
SELECT VendorName,InvoiceNumber,InvoiceDate,InvoiceTotal-(PaymentTotal+CreditTotal) AS Balance
FROM  Vendors,Invoices
WHERE Vendors.VendorID=Invoices.VendorID AND Balance <>0
ORDER BY VendorName;
/*5*/
SELECT VendorName AS Vendor,InvoiceDate AS DATE,InvoiceNumber AS Number,InvoiceSequence AS #,InvoiceLineItemAmount AS LineItem
FROM Vendors AS v JOIN Invoice AS i
     ON v.VendorID=i.VendorID
	 JOIN InvoiceLineItems AS li
	 ON i.InvoiceID=li.InvoiceID
ORDER BY Vendor,Date,Number,#;
/*6*/
SELECT DISTINCT VendorID,VendorName, VendorContactFName+ ' '+ VendorContactLName AS Name
FROM Vendors AS V1 JOIN Vendors AS V2
     ON V1.VendorContactFName=V2.VendorContactFName
ORDER BY Name;
/*7*/
SELECT AccountNo, AccountDescription
FROM GLAccounts LEFT JOIN InvoiceLineItems
     ON GLAccounts.
WHERE  IS NULL
ORDER BY AccountNo;
/*8*/
SELECT VendorName,VendorState
FROM Vendors
WHERE VendorState='CA'
UNION
SELECT VendorName,'Outside CA' AS VendorState
FROM Vendors
WHERE VendorState <> 'CA'
ORDER BY VendorName;
/*EXCERCISES CHAP 5*/

/*EXERCISES CHAP 6*/
