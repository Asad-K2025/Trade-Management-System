SELECT tblOnlinePayment.Transaction_ID, tblOnlinePayment.Transaction_Description, Sum(tblOnlinePayment.Payment_Amount) AS [SumOfPayment Amount], tblOnlinePayment.Reciever, tblOnlinePayment.Submitted, tblOnlinePayment.Full_Name
FROM tblOnlinePayment
GROUP BY tblOnlinePayment.Transaction_ID, tblOnlinePayment.Transaction_Description, tblOnlinePayment.Reciever, tblOnlinePayment.Submitted, tblOnlinePayment.Full_Name
HAVING (((tblOnlinePayment.Full_Name) Like "*" & [Forms]![frmNavigationForm]![txtUsername] & "*"))
ORDER BY tblOnlinePayment.Submitted DESC;
