VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Form_frmMarketHandler"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub btnDelete_Click()
On Error GoTo problem
    If Not IsNull(Me.txtMarketCode) Then
        If MsgBox("You are about to delete this market. Would you like to proceed?", vbExclamation + vbYesNo, "Market Delete Action") = vbYes Then
            Me.Refresh
            DoCmd.RunCommand acCmdDeleteRecord
        Else
            DoCmd.CancelEvent
        End If
    Else
        MsgBox "This is an Asad Portal support object. It assists with software configuration and is a permenant and undeleteable file.", vbExclamation, "Operation Failed"
    End If
    Exit Sub
problem:
    MsgBox "Delete operation failed.", vbCritical, "Operation failed"
End Sub

Private Sub btnNew_Click()
    DoCmd.OpenForm "frmMarketCreator"
    DoCmd.Maximize
    Forms!frmMarketCreator!txtSellerID = Me.txtSellerID
End Sub


Private Sub btnOpen_Click()
On Error Resume Next
    Me.Requery
End Sub

Private Sub btnOpen_DblClick(Cancel As Integer)
On Error GoTo problem
    DoCmd.OpenForm "frmMarketEditor"
    If Not IsNull(Me.txtMarketCode) Then
        DoCmd.OpenForm "frmMarketEditor", , , "[MarketID]=" & [txtMarketID]
        DoCmd.Maximize
    Else
        MsgBox "This is an Asad Portal support object. It cannot be opened.", vbExclamation, "Operation Failed"
    End If
    Exit Sub
problem:
    MsgBox "Open operation failed.", vbCritical, "Operation failed"
End Sub

Private Sub btnOrders_Click()
On Error GoTo problem
    If Not IsNull(Me.txtMarketCode) Then
        DoCmd.OpenForm "frmOrdersView", , , "[MarketID]=" & [txtMarketID]
        Forms!frmOrdersView!txtMarketCode = Me.txtMarketCode
    Else
        MsgBox "This is an Asad Portal support object. It has no existing orders.", vbExclamation, "Operation Failed"
    End If
    Exit Sub
problem:
    MsgBox "The orders were unable to be displayed.", vbExclamation, "Operation Failed"
End Sub

Private Sub chkPublic_Click()
On Error Resume Next
    If IsNull(Me.txtMarketCode) Then
        Me.chkPublic.Enabled = False
        Me.chkPublic.Locked = True
        Me.chkPublic.Value = False
        Me.chkPublic.Enabled = True
        Me.chkPublic.Locked = False
    End If
End Sub

Private Sub btnCopy_Click()
    On Error GoTo problem
    If Not IsNull(Me.txtMarketCode) Then
        Me.txtMarketCode.SetFocus
        DoCmd.RunCommand acCmdCopy
        Me.btnCopy.SetFocus
    Else
        MsgBox "This is an Asad Portal support object. It has no existing market code to copy.", vbExclamation, "Operation Failed"
    End If
    Exit Sub
problem:
    MsgBox "Copy operation failed.", vbCritical, "Operation failed"
End Sub

Private Sub LastEdited_DblClick(Cancel As Integer)
On Error GoTo problem
    If Not IsNull(Me.txtMarketCode) Then
        DoCmd.OpenForm "frmMarketEditor", , , "[MarketID]=" & [txtMarketID]
        DoCmd.Maximize
    Else
        MsgBox "This is an Asad Portal support object. It cannot be opened.", vbExclamation, "Operation Failed"
    End If
    Exit Sub
problem:
    MsgBox "Open operation failed.", vbCritical, "Operation failed"
End Sub
End Sub

Private Sub txtMarketCode_DblClick(Cancel As Integer)
On Error GoTo problem
    If Not IsNull(Me.txtMarketCode) Then
        DoCmd.OpenForm "frmMarketEditor", , , "[MarketID]=" & [txtMarketID]
        DoCmd.Maximize
    Else
        MsgBox "This is an Asad Portal support object. It cannot be opened.", vbExclamation, "Operation Failed"
    End If
    Exit Sub
problem:
    MsgBox "Open operation failed.", vbCritical, "Operation failed"
End Sub

Private Sub txtTitle_Click()
On Error Resume Next
    If IsNull(Me.txtMarketCode) Then
        Me.txtTitle.Enabled = False
        Me.txtTitle.Locked = True
        Me.txtTitle.Value = "Configuration File"
        Me.txtTitle.Enabled = True
        Me.txtTitle.Locked = False
    End If
End Sub

Private Sub txtTitle_DblClick(Cancel As Integer)
On Error Resume Next
    If IsNull(Me.txtMarketCode) Then
        Me.txtTitle.Enabled = False
        Me.txtTitle.Locked = True
        Me.txtTitle.Value = "Configuration File"
        Me.txtTitle.Enabled = True
        Me.txtTitle.Locked = False
    End If
End Sub
