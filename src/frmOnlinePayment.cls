VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Form_frmOnlinePayment"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub btnCancel_Click()
    On Error GoTo problem
    Me.Refresh
    DoCmd.RunCommand acCmdDeleteRecord
    DoCmd.Close acForm, "frmOnlinePayment", acSaveNo
problem:
    If Err.Number Then
        DoCmd.Close acForm, "frmOnlinePayment", acSaveNo
    End If
End Sub

Private Sub Submit_Click()

    If (DCount("Debit_Card_Number", "tblUsers", "txtCardNumber = [Debit_Card_Number] And txtCardPin = [Debit_Card_Pin]")) > 0 And Not IsNull(Me.cboTransactionDescription) Then
        If MsgBox("Would you like to submit your payment and proceed? Note: if you click 'Yes', money from your account wil process into the receivers account, and you will be unable to undo this action. Click 'Yes' to proceed. Click 'No' to cancel payment and return.", vbInformation + vbYesNo + vbDefaultButton1, "Proceed Transaction?") = vbYes Then
            DoCmd.RunCommand acCmdSaveRecord 'Save transaction, open receipt
            DoCmd.OpenReport "rptReceipts", acViewReport, , , acDialog 'open  specific receipt
            DoCmd.Close acForm, "frmOnlinePayment", acSaveYes 'close payment form
        Else
            DoCmd.CancelEvent
        End If
    ElseIf IsNull(Me.cboTransactionDescription) Then
            MsgBox "Incorrect payment code. Please enter a valid payment code.", vbCritical, "Invalid Payment Code"
    ElseIf IsNull(Me.txtCardNumber Or Me.txtCardPin) Then
            MsgBox "Incorrect username and/or password.", vbCritical, "Incorrect Credentials"
    End If
End Sub

Private Sub txtCardNumber_AfterUpdate()
Me.cboCardNumber = Me.txtCardNumber
Me.txtUsername = Me.cboCardNumber.Column(1)
Me.txtAddress = Me.cboCardNumber.Column(3)
End Sub


Private Sub txtPaymentCode_AfterUpdate()
Me.cboPaymentCode = Me.txtPaymentCode
Me.txtTransactionDescription = Me.cboPaymentCode.Column(1)
Me.txtPaymentAmount = Me.cboPaymentCode.Column(2)
Me.txtReciever = Me.cboPaymentCode.Column(3)
End Sub

Private Sub Sample_for_submit_Click()
Dim txtTransactionID As TempVar

If (DCount("DebitCardNumber", "tblUsers", "txtCardNumber = [DebitCardNumber] And txtCardPin = [DebitCardPin]")) > 0 & Not IsNull(Me.cboTransactionDescription.Value) Then
    If MsgBox("Would you like to submit your payment and proceed? Note: if you click 'Yes', money from your account wil process into the receivers account, and you will be unable to undo this action. Click 'Yes' to proceed. Click 'No' to cancel payment and return.", vbInformation + vbYesNo + vbDefaultButton1, "Proceed Transaction?") = vbYes Then
        DoCmd.RunCommand acCmdSaveRecord 'If details correct, open receipt
        TempVars!TransactionID = Me.TransactionID.Value 'Open specific report
        DoCmd.OpenReport "rptAllReceipts", acViewReport, , TransactionID = TempVars!TransactionID, acDialog
    Else
        DoCmd.CancelEvent
    End If
ElseIf IsNull(Me.cboTransactionDescription) Then
    MsgBox "Incorrect payment code. Please enter payment code.", vbCritical, "Invalid Payment Code"
Else
 MsgBox "Incorrect username and/or password.", vbCritical, "Incorrect Credentials"
End If
End Sub
