SELECT tblOnlinePayment.Transaction_ID, tblOnlinePayment.Transaction_Description, tblOnlinePayment.Payment_Amount, tblOnlinePayment.Reciever, tblOnlinePayment.Full_Name, tblUsers.Home_Address
FROM tblUsers INNER JOIN tblOnlinePayment ON tblUsers.Debit_Card_Number = tblOnlinePayment.Card_Number
WHERE (((tblOnlinePayment.Transaction_ID) Like "*" & [Forms]![frmOnlinePayment]![txtTransactionID] & "*"));
