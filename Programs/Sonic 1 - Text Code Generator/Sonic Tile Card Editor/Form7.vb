Public Class Form7

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Form5.Visible = True
        Me.Visible = False
        Exit Sub
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Me.TextBox1.Text = "" Then
            MsgBox("You must insert Text, before you can convert it.", MsgBoxStyle.Critical, "Error")
            TextBox1.Focus()
            Exit Sub
        End If
        Dim exitt As String
        exitt = "0"
        If Me.TextBox1.Text.Contains("Q") Then
            exitt = "1"
        End If
        If Me.TextBox1.Text.Contains("V") Then
            exitt = "1"
        End If
        If Me.TextBox1.Text.Contains("W") Then
            exitt = "1"
        End If
        If Me.TextBox1.Text.Contains("Z") Then
            exitt = "1"
        End If
        If exitt = "1" Then
            MsgBox("Sorry, Q, V, W and Z can't be used!", MsgBoxStyle.Critical, "Error")
            Me.TextBox1.Focus()
            Exit Sub
        End If
        If CheckBox2.Checked = True Then
            Call ClacCenterPos()
        End If
        TextBox1.Text = TextBox1.Text.ToUpper
        Me.Label8.Visible = True
        Me.ProgressBar1.Visible = True
        Me.ProgressBar1.Value = 0
        Me.Label10.Visible = False
        Me.Label8.Text = "Generating..."
        Timer1.Enabled = True
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Clipboard.Clear()
        Clipboard.SetText(Me.TextBox2.Text)
        Me.TextBox2.Focus()
        Me.TextBox2.SelectAll()
    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        Dim pos As Integer = TextBox1.SelectionStart
        If Me.TextBox1.TextLength = 0 Then
            Me.Button1.Enabled = False
        End If
        If Me.TextBox1.TextLength >= 1 Then
            Me.Button1.Enabled = True
        End If
        TextBox1.Text = TextBox1.Text.ToUpper
        TextBox1.SelectionStart = pos
        If CheckBox2.Checked = True Then
            If Me.TextBox1.Text = "" Then
                TextBox3.Text = "80"
                Exit Sub
            Else
                Call ClacCenterPos()
            End If
        End If
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        On Error GoTo ErrorExit
        Dim headerS As String
        headerS = ""
        Timer1.Enabled = False
        Me.Label8.Text = "Generated!"
        Me.TextBox1.Enabled = True
        Me.Label5.Visible = True
        Me.TextBox2.Text = ""
        If Me.CheckBox1.Checked = True Then
            If Me.TextBox1.TextLength >= 2 Then
                headerS = "$"
            Else
                headerS = ""
            End If
        Else
            If Me.TextBox1.TextLength >= 10 Then
                headerS = "$"
            Else
                headerS = ""
            End If
        End If
        If Me.CheckBox1.Checked = True Then
            Me.TextBox2.Text = "byte_176A9:	dc.b " & headerS & Hex(TextBox1.TextLength + 8) & "	;  SONIC TEAM PRESENTS | " & TextBox1.Text & "PRESENTS" & vbCrLf
        Else
            Me.TextBox2.Text = "byte_176A9:	dc.b " & headerS & Hex(TextBox1.TextLength) & "	;  SONIC TEAM PRESENTS | " & TextBox1.Text & vbCrLf
        End If

        'DIE MAIN CODING LINE
        Dim i As Integer
        Dim i2 As Integer
        i2 = "&H" & TextBox3.Text
        For i = 0 To Me.TextBox1.TextLength - 1 Step 1
            Select Case (Me.TextBox1.Text.Substring(i, 1))
                Case "A"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, 4, $" & Hex(i2) & "		; A"
                Case "B"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $48, $" & Hex(i2) & "	; B"
                Case "C"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $1E, $" & Hex(i2) & "	; C"
                Case "D"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $42, $" & Hex(i2) & "	; D"
                Case "E"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $0E, $" & Hex(i2) & "	; E"
                Case "F"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $5C, $" & Hex(i2) & "	; F"
                Case "G"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, 0, $" & Hex(i2) & "		; G"
                Case "H"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $3A, $" & Hex(i2) & "	; H"
                Case "I"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 1, 0, $46, $" & Hex(i2) & "	; I"
                    i2 -= 8
                Case "J"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $4C, $" & Hex(i2) & "	; J"
                Case "K"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $58, $" & Hex(i2) & "	; K"
                Case "L"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $16, $" & Hex(i2) & "	; L"
                Case "M"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 9, 0, 8, $" & Hex(i2) & "		; M"
                    i2 += 4
                Case "N"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $1A, $" & Hex(i2) & "	; N"
                Case "O"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $26, $" & Hex(i2) & "	; O"
                Case "P"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $12, $" & Hex(i2) & "	; P"
                    'Kein Q
                Case "R"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $22, $" & Hex(i2) & "	; R"
                Case "S"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $2E, $" & Hex(i2) & "	; S"
                Case "T"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $3E, $" & Hex(i2) & "	; T"
                Case "U"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $32, $" & Hex(i2) & "	; U"
                Case "X"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $50, $" & Hex(i2) & "	; X"
                    'Kein V, W, X
                Case "Y"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $2A, $" & Hex(i2) & "	; Y"

                    'Nur in meiner Version
                Case "Q"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $6E, $" & Hex(i2) & "	; Q"
                Case "V"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $6A, $" & Hex(i2) & "	; V"
                Case "W"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 9, 0, $60, $" & Hex(i2) & "	; W"
                Case "Z"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $66, $" & Hex(i2) & "	; Z"

                    'Spezial
                Case " "
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 0, 0, $60, $" & Hex(12) & "   	 ; Space"
                Case "2"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", $C, 0, $36, $" & Hex(i2) & "	;  2"

                Case Else
                    TextBox2.Text = TextBox2.Text & "; ERROR: UNKOWN SIGN"
                    Me.Label10.Visible = True
                    'DIE MAIN CODING LINE

            End Select
            If i < Me.TextBox1.TextLength - 1 Then TextBox2.Text = TextBox2.Text & vbCrLf
            i2 += 16
            i2 = i2 And &HFF

        Next
        If Me.CheckBox1.Checked = True Then
            Me.TextBox2.Text = TextBox2.Text & vbCrLf & vbCrLf & _
            "		dc.b 0,	5, 0, $12, $C0	; P" & vbCrLf & _
            "		dc.b 0,	5, 0, $22, $D0	; R" & vbCrLf & _
            "		dc.b 0,	5, 0, $E, $E0	; E" & vbCrLf & _
            "		dc.b 0,	5, 0, $2E, $F0	; S" & vbCrLf & _
            "		dc.b 0,	5, 0, $E, 0	; E" & vbCrLf & _
            "		dc.b 0,	5, 0, $1A, $10	; N" & vbCrLf & _
            "		dc.b 0,	5, 0, $3E, $20	; T" & vbCrLf & _
            "		dc.b 0,	5, 0, $2E, $30	; S"
        End If
        If Me.CheckBox3.Checked = True Then
            Me.TextBox2.Text = TextBox2.Text & vbCrLf & _
            "		even"
        End If
        Me.Button5.Enabled = True
        Me.Button5.Focus()
        Exit Sub

ErrorExit:
        Me.TextBox2.Text = ""
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
        Exit Sub
    End Sub

    Private Sub Button10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button10.Click
        Call ClacCenterPos()
    End Sub

    Public Sub ClacCenterPos()
        Dim laenge As Integer = TextBox1.TextLength * 16
        Dim CenterPos As Integer = (255 - laenge) / 2
        Dim i As Integer
        For i = 0 To TextBox1.TextLength - 1
            If (TextBox1.Text.Substring(i, 1) = "M") Then CenterPos += 4
            If (TextBox1.Text.Substring(i, 1) = "I") Then CenterPos -= 8
        Next
        CenterPos = CenterPos + 128
        TextBox3.Text = Hex(CenterPos)
    End Sub

    Private Sub Form7_Deactivate(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Deactivate
        If Form5.CheckBox1.Checked = True Then
            Me.Opacity = 0.9F
        End If
    End Sub

    Private Sub Form7_Activated(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Activated
        Me.Opacity = 1.0F
    End Sub
End Class