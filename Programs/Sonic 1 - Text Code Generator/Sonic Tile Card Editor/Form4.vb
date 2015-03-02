Public Class Form4
    Dim TitleX As String = "90"
    Dim TitleY As String = "90"

    Dim Name1X As String = "C0"
    Dim Name1Y As String = "B8"

    Dim Name2X As String = "C0"
    Dim Name2Y As String = "D8"

    Dim Name3X As String = "C0"
    Dim Name3Y As String = "F8"

    Dim Name4X As String = "C0"
    Dim Name4Y As String = "18"

    Dim Name5X As String = "C0"
    Dim Name5Y As String = "38"


    Private Sub TrackBar1_Scroll(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TrackBar1.Scroll
        If Me.TrackBar1.Value = 1 Then
            Me.TextBox6.Enabled = False
            Me.TextBox7.Enabled = False
            Me.TextBox8.Enabled = False
            Me.TextBox9.Enabled = False
        End If
        If Me.TrackBar1.Value = 2 Then
            Me.TextBox6.Enabled = True
            Me.TextBox7.Enabled = False
            Me.TextBox8.Enabled = False
            Me.TextBox9.Enabled = False
        End If
        If Me.TrackBar1.Value = 3 Then
            Me.TextBox6.Enabled = True
            Me.TextBox7.Enabled = True
            Me.TextBox8.Enabled = False
            Me.TextBox9.Enabled = False
        End If
        If Me.TrackBar1.Value = 4 Then
            Me.TextBox6.Enabled = True
            Me.TextBox7.Enabled = True
            Me.TextBox8.Enabled = True
            Me.TextBox9.Enabled = False
        End If
        If Me.TrackBar1.Value = 5 Then
            Me.TextBox6.Enabled = True
            Me.TextBox7.Enabled = True
            Me.TextBox8.Enabled = True
            Me.TextBox9.Enabled = True
        End If
    End Sub

    Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button7.Click
        Me.TextBox1.Text = ""
        Me.TextBox5.Text = ""
        Me.TextBox6.Text = ""
        Me.TextBox7.Text = ""
        Me.TextBox8.Text = ""
        Me.TextBox9.Text = ""
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBox1.SelectedIndexChanged
        If Me.ComboBox1.SelectedIndex = 0 Then
            Me.Label15.Text = "byte_172F8"
        End If
        If Me.ComboBox1.SelectedIndex = 1 Then
            Me.Label15.Text = "byte_1733F"
        End If
        If Me.ComboBox1.SelectedIndex = 2 Then
            Me.Label15.Text = "byte_17390"
        End If
        If Me.ComboBox1.SelectedIndex = 3 Then
            Me.Label15.Text = "byte_173C3"
        End If
        If Me.ComboBox1.SelectedIndex = 4 Then
            Me.Label15.Text = "byte_1743C"
        End If
        If Me.ComboBox1.SelectedIndex = 5 Then
            Me.Label15.Text = "byte_174A1"
        End If
        If Me.ComboBox1.SelectedIndex = 6 Then
            Me.Label15.Text = "byte_17524"
        End If
        If Me.ComboBox1.SelectedIndex = 7 Then
            Me.Label15.Text = "byte_17598"
        End If
        If Me.ComboBox1.SelectedIndex = 8 Then
            Me.Label15.Text = "byte_17634"
        End If
        If Me.ComboBox1.SelectedIndex = 9 Then
            Me.Label15.Text = "byte_17680"
        End If
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Me.TextBox1.Text = "" Then
            MsgBox("You must insert Text, before you can convert it!", MsgBoxStyle.Critical, "Error")
            TextBox1.Focus()
            Exit Sub
        End If
        Dim exitt As String
        Dim TB As String = ""
        exitt = "0"
        If Me.TextBox1.Text.Contains("Q") Then
            exitt = "1"
            MsgBox("Q can't be used for Credits Title Cards!", MsgBoxStyle.Critical, "Error")
            Me.TextBox1.Focus()
        End If
        If Me.TextBox1.Text.Contains("V") Then
            exitt = "1"
            MsgBox("V can't be used for Credits Title Cards!", MsgBoxStyle.Critical, "Error")
            Me.TextBox1.Focus()
        End If
        If Me.TextBox1.Text.Contains("W") Then
            exitt = "1"
            MsgBox("W can't be used for Credits Title Cards!", MsgBoxStyle.Critical, "Error")
            Me.TextBox1.Focus()
        End If
        If Me.TextBox1.Text.Contains("Z") Then
            exitt = "1"
            MsgBox("Z can't be used for Credits Title Cards!", MsgBoxStyle.Critical, "Error")
            Me.TextBox1.Focus()
        End If

restart:
        TB = "TextBox5"
        GoTo DoIt
        TB = "TextBox6"
        GoTo DoIt
        TB = "TextBox7"
        GoTo DoIt
        TB = "TextBox8"
        GoTo DoIt
        TB = "TextBox9"

DoIt:
        If TB.Contains("Q") Then
            exitt = "1"
            MsgBox("Q can't be used for Credits Title Cards!", MsgBoxStyle.Critical, "Error")
        End If
        If TB.Contains("V") Then
            exitt = "1"
            MsgBox("V can't be used for Credits Title Cards!", MsgBoxStyle.Critical, "Error")
        End If
        If TB.Contains("W") Then
            exitt = "1"
            MsgBox("W can't be used for Credits Title Cards!", MsgBoxStyle.Critical, "Error")
        End If
        If TB.Contains("Z") Then
            exitt = "1"
            MsgBox("Z can't be used for Credits Title Cards!", MsgBoxStyle.Critical, "Error")
        End If
        If TB = "TextBox9" Then
            GoTo restart
        End If
        If exitt = "1" Then
            Exit Sub
        End If
        Timer1.Enabled = True
        Me.Label8.Visible = False
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        'On Error GoTo ErrorExit
        Timer1.Enabled = False
        Me.TextBox2.Text = ""
        Me.TextBox2.Text = Label15.Text & ":	dc.b $" & Hex(TextBox1.TextLength + TextBox5.TextLength + TextBox6.TextLength + TextBox7.TextLength + TextBox8.TextLength + TextBox9.TextLength) & "	;  " & ComboBox1.Text & " | " & TextBox1.Text & " " & TextBox5.Text & " " & TextBox6.Text & " " & TextBox7.Text & " " & TextBox8.Text & " " & TextBox9.Text & vbCrLf
        Dim i As Integer
        Dim i2 As Integer
        Dim YIndex As Integer = 0

        i2 = "&H" & TitleX
        For i = 0 To Me.TextBox1.TextLength - 1 Step 1
            Select Case (Me.TextBox1.Text.Substring(i, 1))
                Case "A"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, 4, $" & Hex(i2) & "		; A"
                Case "B"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $48, $" & Hex(i2) & "	; B"
                Case "C"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $1E, $" & Hex(i2) & "	; C"
                Case "D"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $42, $" & Hex(i2) & "	; D"
                Case "E"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $0E, $" & Hex(i2) & "	; E"
                Case "F"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $5C, $" & Hex(i2) & "	; F"
                Case "G"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, 0, $" & Hex(i2) & "		; G"
                Case "H"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $3A, $" & Hex(i2) & "	; H"
                Case "I"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 1, 0, $46, $" & Hex(i2) & "	; I"
                    i2 -= 8
                Case "J"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $4C, $" & Hex(i2) & "	; J"
                Case "K"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $58, $" & Hex(i2) & "	; K"
                Case "L"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $16, $" & Hex(i2) & "	; L"
                Case "M"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 9, 0, 8, $" & Hex(i2) & "		; M"
                    i2 += 4
                Case "N"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $1A, $" & Hex(i2) & "	; N"
                Case "O"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $26, $" & Hex(i2) & "	; O"
                Case "P"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $12, $" & Hex(i2) & "	; P"
                    'Kein Q
                Case "R"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $22, $" & Hex(i2) & "	; R"
                Case "S"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $2E, $" & Hex(i2) & "	; S"
                Case "T"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $3E, $" & Hex(i2) & "	; T"
                Case "U"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $32, $" & Hex(i2) & "	; U"
                Case "X"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $50, $" & Hex(i2) & "	; X"
                    'Kein V, W, X
                Case "Y"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $2A, $" & Hex(i2) & "	; Y"

                    'Nur in meiner Version
                Case "Q"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $6E, $" & Hex(i2) & "	; Q"
                Case "V"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $6A, $" & Hex(i2) & "	; V"
                Case "W"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 9, 0, $60, $" & Hex(i2) & "	; W"
                Case "Z"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 5, 0, $66, $" & Hex(i2) & "	; Z"

                    'Spezial
                Case " "
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", 0, 0, $60, $" & Hex(12) & "    ;Space"
                Case "2"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TitleY & ", $C, 0, $36, $" & Hex(i2) & "	;  2"

                Case Else
                    TextBox2.Text = TextBox2.Text & "; ERROR: UNKOWN CHARACTER"
                    Me.Label10.Visible = True

            End Select
            If i < Me.TextBox1.TextLength - 1 Then TextBox2.Text = TextBox2.Text & vbCrLf
            i2 += 16
            i2 = i2 And &HFF
            YIndex += 1

        Next
        Me.Label8.Text = "Generated!"
        Me.Label8.Visible = True
        Me.Timer2.Enabled = True
        Exit Sub

ErrorExit:
        'MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
        Exit Sub
    End Sub

    Private Sub Form4_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ListBox1.SelectedIndex = 0
        Me.ComboBox1.SelectedIndex = 0
        'Me.ToolTip1.SetToolTip(TextBox13, "Title X-Position")
        'Me.ToolTip1.SetToolTip(TextBox10, "Title Y-Position")
        'Me.ToolTip1.SetToolTip(TextBox11, "Name X-Position (For all names the same)")
        'Me.ToolTip1.SetToolTip(TextBox12, "Name Y-Position (Difference between the names = $20)")
    End Sub

    Private Sub Form4_Deactivate(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Deactivate
        If Form5.CheckBox1.Checked = True Then
            Me.Opacity = 0.9F
        End If
    End Sub

    Private Sub Form4_Activated(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Activated
        Me.Opacity = 1.0F
    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        Dim pos As Integer = TextBox1.SelectionStart
        TextBox1.Text = TextBox1.Text.ToUpper
        TextBox1.Text = TextBox1.Text.ToUpper
        TextBox1.SelectionStart = pos
    End Sub

    Private Sub TextBox5_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox5.TextChanged
        Dim pos As Integer = TextBox5.SelectionStart
        TextBox5.Text = TextBox5.Text.ToUpper
        TextBox5.SelectionStart = pos
    End Sub

    Private Sub TextBox6_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox6.TextChanged
        Dim pos As Integer = TextBox6.SelectionStart
        TextBox6.Text = TextBox6.Text.ToUpper
        TextBox6.SelectionStart = pos
    End Sub

    Private Sub TextBox7_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox7.TextChanged
        Dim pos As Integer = TextBox7.SelectionStart
        TextBox7.Text = TextBox7.Text.ToUpper
        TextBox7.SelectionStart = pos
    End Sub

    Private Sub TextBox8_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox8.TextChanged
        Dim pos As Integer = TextBox8.SelectionStart
        TextBox8.Text = TextBox8.Text.ToUpper
        TextBox8.SelectionStart = pos
    End Sub

    Private Sub TextBox9_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox9.TextChanged
        Dim pos As Integer = TextBox9.SelectionStart
        TextBox9.Text = TextBox9.Text.ToUpper
        TextBox9.SelectionStart = pos
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim f As New Form6
        f.Show()
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Clipboard.Clear()
        Clipboard.SetText(TextBox2.Text)
        TextBox2.Focus()
        TextBox2.SelectAll()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Me.Close()
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        Dim url As String
        url = "http://sonicresearch.org/forums/index.php?showuser=469"
        'url = "http://goggle.de"
        Try
            Process.Start(url)
        Catch ex As Exception
            'MsgBox("Error: " & Err.Description & vbCrLf & "URL: " & url, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        ''On Error GoTo ErrorExit
        Timer2.Enabled = False
        Dim i As Integer
        Dim i2 As Integer
        Dim YIndex As Integer = 0
        Me.TextBox2.Text = TextBox2.Text & vbCrLf & vbCrLf
        i2 = "&H" & Name1X
        For i = 0 To Me.TextBox5.TextLength - 1 Step 1
            Select Case (Me.TextBox5.Text.Substring(i, 1))
                Case "A"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, 4, $" & Hex(i2) & "		; A"
                Case "B"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $48, $" & Hex(i2) & "	; B"
                Case "C"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $1E, $" & Hex(i2) & "	; C"
                Case "D"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $42, $" & Hex(i2) & "	; D"
                Case "E"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $0E, $" & Hex(i2) & "	; E"
                Case "F"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $5C, $" & Hex(i2) & "	; F"
                Case "G"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, 0, $" & Hex(i2) & "		; G"
                Case "H"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $3A, $" & Hex(i2) & "	; H"
                Case "I"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 1, 0, $46, $" & Hex(i2) & "	; I"
                    i2 -= 8
                Case "J"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $4C, $" & Hex(i2) & "	; J"
                Case "K"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $58, $" & Hex(i2) & "	; K"
                Case "L"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $16, $" & Hex(i2) & "	; L"
                Case "M"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 9, 0, 8, $" & Hex(i2) & "		; M"
                    i2 += 4
                Case "N"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $1A, $" & Hex(i2) & "	; N"
                Case "O"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $26, $" & Hex(i2) & "	; O"
                Case "P"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $12, $" & Hex(i2) & "	; P"
                    'Kein Q
                Case "R"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $22, $" & Hex(i2) & "	; R"
                Case "S"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $2E, $" & Hex(i2) & "	; S"
                Case "T"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $3E, $" & Hex(i2) & "	; T"
                Case "U"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $32, $" & Hex(i2) & "	; U"
                Case "X"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $50, $" & Hex(i2) & "	; X"
                    'Kein V, W, X
                Case "Y"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $2A, $" & Hex(i2) & "	; Y"

                    'Nur in meiner Version
                Case "Q"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $6E, $" & Hex(i2) & "	; Q"
                Case "V"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $6A, $" & Hex(i2) & "	; V"
                Case "W"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 9, 0, $60, $" & Hex(i2) & "	; W"
                Case "Z"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 5, 0, $66, $" & Hex(i2) & "	; Z"

                    'Spezial
                Case " "
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", 0, 0, $60, $" & Hex(12) & "    ;Space"
                Case "2"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name1Y & ", $C, 0, $36, $" & Hex(i2) & "	;  2"

                Case Else
                    TextBox2.Text = TextBox2.Text & "; ERROR: UNKOWN SIGN"
                    Me.Label10.Visible = True

            End Select
            If i < Me.TextBox5.TextLength - 1 Then TextBox2.Text = TextBox2.Text & vbCrLf
            i2 += 16
            i2 = i2 And &HFF
            YIndex += 1

        Next
        Me.Label8.Text = "Generated!"
        Me.Label8.Visible = True
        Me.Timer3.Enabled = True

ErrorExit:
        'MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
        Exit Sub
    End Sub

    Private Sub Timer3_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer3.Tick
        ''On Error GoTo ErrorExit
        Timer3.Enabled = False
        Dim i As Integer
        Dim i2 As Integer
        Dim YIndex As Integer = 0
        Me.TextBox2.Text = TextBox2.Text & vbCrLf & vbCrLf
        i2 = "&H" & Name2X
        For i = 0 To Me.TextBox6.TextLength - 1 Step 1
            Select Case (Me.TextBox6.Text.Substring(i, 1))
                Case "A"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, 4, $" & Hex(i2) & "		; A"
                Case "B"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $48, $" & Hex(i2) & "	; B"
                Case "C"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $1E, $" & Hex(i2) & "	; C"
                Case "D"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $42, $" & Hex(i2) & "	; D"
                Case "E"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $0E, $" & Hex(i2) & "	; E"
                Case "F"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $5C, $" & Hex(i2) & "	; F"
                Case "G"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, 0, $" & Hex(i2) & "		; G"
                Case "H"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $3A, $" & Hex(i2) & "	; H"
                Case "I"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 1, 0, $46, $" & Hex(i2) & "	; I"
                    i2 -= 8
                Case "J"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $4C, $" & Hex(i2) & "	; J"
                Case "K"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $58, $" & Hex(i2) & "	; K"
                Case "L"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $16, $" & Hex(i2) & "	; L"
                Case "M"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 9, 0, 8, $" & Hex(i2) & "		; M"
                    i2 += 4
                Case "N"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $1A, $" & Hex(i2) & "	; N"
                Case "O"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $26, $" & Hex(i2) & "	; O"
                Case "P"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $12, $" & Hex(i2) & "	; P"
                    'Kein Q
                Case "R"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $22, $" & Hex(i2) & "	; R"
                Case "S"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $2E, $" & Hex(i2) & "	; S"
                Case "T"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $3E, $" & Hex(i2) & "	; T"
                Case "U"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $32, $" & Hex(i2) & "	; U"
                Case "X"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $50, $" & Hex(i2) & "	; X"
                    'Kein V, W, X
                Case "Y"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $2A, $" & Hex(i2) & "	; Y"

                    'Nur in meiner Version
                Case "Q"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $6E, $" & Hex(i2) & "	; Q"
                Case "V"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $6A, $" & Hex(i2) & "	; V"
                Case "W"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 9, 0, $60, $" & Hex(i2) & "	; W"
                Case "Z"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 5, 0, $66, $" & Hex(i2) & "	; Z"

                    'Spezial
                Case " "
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", 0, 0, $60, $" & Hex(12) & "    ;Space"
                Case "2"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name2Y & ", $C, 0, $36, $" & Hex(i2) & "	;  2"

                Case Else
                    TextBox2.Text = TextBox2.Text & "; ERROR: UNKOWN SIGN"
                    Me.Label10.Visible = True

            End Select
            If i < Me.TextBox6.TextLength - 1 Then TextBox2.Text = TextBox2.Text & vbCrLf
            i2 += 16
            i2 = i2 And &HFF
            YIndex += 1

        Next
        Me.Label8.Text = "Generated!"
        Me.Label8.Visible = True
        Me.Timer4.Enabled = True

ErrorExit:
        'MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
        Exit Sub
    End Sub

    Private Sub Timer4_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer4.Tick
        'On Error GoTo ErrorExit
        Timer4.Enabled = False
        Dim i As Integer
        Dim i2 As Integer
        Dim YIndex As Integer = 0
        Me.TextBox2.Text = TextBox2.Text & vbCrLf & vbCrLf
        i2 = "&H" & Name3X
        For i = 0 To Me.TextBox7.TextLength - 1 Step 1
            Select Case (Me.TextBox7.Text.Substring(i, 1))
                Case "A"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, 4, $" & Hex(i2) & "		; A"
                Case "B"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $48, $" & Hex(i2) & "	; B"
                Case "C"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $1E, $" & Hex(i2) & "	; C"
                Case "D"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $42, $" & Hex(i2) & "	; D"
                Case "E"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $0E, $" & Hex(i2) & "	; E"
                Case "F"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $5C, $" & Hex(i2) & "	; F"
                Case "G"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, 0, $" & Hex(i2) & "		; G"
                Case "H"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $3A, $" & Hex(i2) & "	; H"
                Case "I"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 1, 0, $46, $" & Hex(i2) & "	; I"
                    i2 -= 8
                Case "J"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $4C, $" & Hex(i2) & "	; J"
                Case "K"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $58, $" & Hex(i2) & "	; K"
                Case "L"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $16, $" & Hex(i2) & "	; L"
                Case "M"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 9, 0, 8, $" & Hex(i2) & "		; M"
                    i2 += 4
                Case "N"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $1A, $" & Hex(i2) & "	; N"
                Case "O"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $26, $" & Hex(i2) & "	; O"
                Case "P"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $12, $" & Hex(i2) & "	; P"
                    'Kein Q
                Case "R"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $22, $" & Hex(i2) & "	; R"
                Case "S"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $2E, $" & Hex(i2) & "	; S"
                Case "T"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $3E, $" & Hex(i2) & "	; T"
                Case "U"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $32, $" & Hex(i2) & "	; U"
                Case "X"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $50, $" & Hex(i2) & "	; X"
                    'Kein V, W, X
                Case "Y"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $2A, $" & Hex(i2) & "	; Y"

                    'Nur in meiner Version
                Case "Q"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $6E, $" & Hex(i2) & "	; Q"
                Case "V"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $6A, $" & Hex(i2) & "	; V"
                Case "W"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 9, 0, $60, $" & Hex(i2) & "	; W"
                Case "Z"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 5, 0, $66, $" & Hex(i2) & "	; Z"

                    'Spezial
                Case " "
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", 0, 0, $60, $" & Hex(12) & "    ;Space"
                Case "2"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name3Y & ", $C, 0, $36, $" & Hex(i2) & "	;  2"

                Case Else
                    TextBox2.Text = TextBox2.Text & "; ERROR: UNKOWN SIGN"
                    Me.Label10.Visible = True

            End Select
            If i < Me.TextBox7.TextLength - 1 Then TextBox2.Text = TextBox2.Text & vbCrLf
            i2 += 16
            i2 = i2 And &HFF
            YIndex += 1

        Next
        Me.Label8.Text = "Generated!"
        Me.Label8.Visible = True
        Me.Timer5.Enabled = True

ErrorExit:
        'MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
        Exit Sub
    End Sub

    Private Sub Timer5_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer5.Tick
        'On Error GoTo ErrorExit
        Timer5.Enabled = False
        Dim i As Integer
        Dim i2 As Integer
        Dim YIndex As Integer = 0
        Me.TextBox2.Text = TextBox2.Text & vbCrLf & vbCrLf
        i2 = "&H" & Name4X
        For i = 0 To Me.TextBox8.TextLength - 1 Step 1
            Select Case (Me.TextBox8.Text.Substring(i, 1))
                Case "A"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, 4, $" & Hex(i2) & "		; A"
                Case "B"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $48, $" & Hex(i2) & "	; B"
                Case "C"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $1E, $" & Hex(i2) & "	; C"
                Case "D"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $42, $" & Hex(i2) & "	; D"
                Case "E"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $0E, $" & Hex(i2) & "	; E"
                Case "F"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $5C, $" & Hex(i2) & "	; F"
                Case "G"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, 0, $" & Hex(i2) & "		; G"
                Case "H"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $3A, $" & Hex(i2) & "	; H"
                Case "I"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 1, 0, $46, $" & Hex(i2) & "	; I"
                    i2 -= 8
                Case "J"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $4C, $" & Hex(i2) & "	; J"
                Case "K"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $58, $" & Hex(i2) & "	; K"
                Case "L"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $16, $" & Hex(i2) & "	; L"
                Case "M"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 9, 0, 8, $" & Hex(i2) & "		; M"
                    i2 += 4
                Case "N"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $1A, $" & Hex(i2) & "	; N"
                Case "O"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $26, $" & Hex(i2) & "	; O"
                Case "P"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $12, $" & Hex(i2) & "	; P"
                    'Kein Q
                Case "R"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $22, $" & Hex(i2) & "	; R"
                Case "S"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $2E, $" & Hex(i2) & "	; S"
                Case "T"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $3E, $" & Hex(i2) & "	; T"
                Case "U"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $32, $" & Hex(i2) & "	; U"
                Case "X"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $50, $" & Hex(i2) & "	; X"
                    'Kein V, W, X
                Case "Y"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $2A, $" & Hex(i2) & "	; Y"

                    'Nur in meiner Version
                Case "Q"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $6E, $" & Hex(i2) & "	; Q"
                Case "V"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $6A, $" & Hex(i2) & "	; V"
                Case "W"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 9, 0, $60, $" & Hex(i2) & "	; W"
                Case "Z"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 5, 0, $66, $" & Hex(i2) & "	; Z"

                    'Spezial
                Case " "
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", 0, 0, $60, $" & Hex(12) & "    ;Space"
                Case "2"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name4Y & ", $C, 0, $36, $" & Hex(i2) & "	;  2"

                Case Else
                    TextBox2.Text = TextBox2.Text & "; ERROR: UNKOWN SIGN"
                    Me.Label10.Visible = True

            End Select
            If i < Me.TextBox8.TextLength - 1 Then TextBox2.Text = TextBox2.Text & vbCrLf
            i2 += 16
            i2 = i2 And &HFF
            YIndex += 1

        Next
        Me.Label8.Text = "Generated!"
        Me.Label8.Visible = True
        Me.Timer6.Enabled = True

ErrorExit:
        'MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
        Exit Sub
    End Sub

    Private Sub Timer6_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer6.Tick
        'On Error GoTo ErrorExit
        Timer6.Enabled = False
        Dim i As Integer
        Dim i2 As Integer
        Dim YIndex As Integer = 0
        Me.TextBox2.Text = TextBox2.Text & vbCrLf & vbCrLf
        i2 = "&H" & Name5X
        For i = 0 To Me.TextBox9.TextLength - 1 Step 1
            Select Case (Me.TextBox9.Text.Substring(i, 1))
                Case "A"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, 4, $" & Hex(i2) & "		; A"
                Case "B"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $48, $" & Hex(i2) & "	; B"
                Case "C"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $1E, $" & Hex(i2) & "	; C"
                Case "D"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $42, $" & Hex(i2) & "	; D"
                Case "E"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $0E, $" & Hex(i2) & "	; E"
                Case "F"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $5C, $" & Hex(i2) & "	; F"
                Case "G"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, 0, $" & Hex(i2) & "		; G"
                Case "H"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $3A, $" & Hex(i2) & "	; H"
                Case "I"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 1, 0, $46, $" & Hex(i2) & "	; I"
                    i2 -= 8
                Case "J"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $4C, $" & Hex(i2) & "	; J"
                Case "K"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $58, $" & Hex(i2) & "	; K"
                Case "L"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $16, $" & Hex(i2) & "	; L"
                Case "M"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 9, 0, 8, $" & Hex(i2) & "		; M"
                    i2 += 4
                Case "N"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $1A, $" & Hex(i2) & "	; N"
                Case "O"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $26, $" & Hex(i2) & "	; O"
                Case "P"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $12, $" & Hex(i2) & "	; P"
                    'Kein Q
                Case "R"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $22, $" & Hex(i2) & "	; R"
                Case "S"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $2E, $" & Hex(i2) & "	; S"
                Case "T"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $3E, $" & Hex(i2) & "	; T"
                Case "U"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $32, $" & Hex(i2) & "	; U"
                Case "X"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $50, $" & Hex(i2) & "	; X"
                    'Kein V, W, X
                Case "Y"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $2A, $" & Hex(i2) & "	; Y"

                    'Nur in meiner Version
                Case "Q"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $6E, $" & Hex(i2) & "	; Q"
                Case "V"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $6A, $" & Hex(i2) & "	; V"
                Case "W"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 9, 0, $60, $" & Hex(i2) & "	; W"
                Case "Z"
                    'TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 5, 0, $66, $" & Hex(i2) & "	; Z"

                    'Spezial
                Case " "
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", 0, 0, $60, $" & Hex(12) & "    ;Space"
                Case "2"
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & Name5Y & ", $C, 0, $36, $" & Hex(i2) & "	;  2"

                Case Else
                    TextBox2.Text = TextBox2.Text & "; ERROR: UNKOWN SIGN"
                    Me.Label10.Visible = True

            End Select
            If i < Me.TextBox9.TextLength - 1 Then TextBox2.Text = TextBox2.Text & vbCrLf
            i2 += 16
            i2 = i2 And &HFF
            YIndex += 1

        Next
        Me.Label8.Text = "Generated!"
        Me.Label8.Visible = True

ErrorExit:
        'MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
        Exit Sub
    End Sub

    Private Sub GroupBox2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles GroupBox2.Click
        Exit Sub ' disabled because it's not working
        '   If Me.TextBox3.Visible = False Then
        'TextBox3.Text = "Title:	X $" & TextBox13.Text & "; Y $" & TextBox10.Text & vbCrLf & _
        '                "Name 1:	X $" & TextBox11.Text & "; Y $" & TextBox12.Text & vbCrLf & _
        '                "Name 2:	X $" & TextBox11.Text & "; Y $" & Hex(32) + &HFF And TextBox12.Text & vbCrLf & _
        '                "Name 3:	X $" & TextBox11.Text & "; Y $" & Hex(64) + &HFF And TextBox12.Text & vbCrLf & _
        '                "Name 4:	X $" & TextBox11.Text & "; Y $" & Hex(96) + &HFF And TextBox12.Text & vbCrLf & _
        '                "Name 5:	X $" & TextBox11.Text & "; Y $" & Hex(128) + &HFF And TextBox12.Text
        'Me.TextBox3.Visible = True
        'Else
        'Me.TextBox3.Visible = False
        ' End If
    End Sub

    Private Sub ListBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBox1.SelectedIndexChanged
        If ListBox1.SelectedIndex = 0 Then
            TextBox13.Text = TitleX
            TextBox10.Text = TitleY
        End If
        If ListBox1.SelectedIndex = 1 Then
            TextBox13.Text = Name1X
            TextBox10.Text = Name1Y
        End If
        If ListBox1.SelectedIndex = 2 Then
            TextBox13.Text = Name2X
            TextBox10.Text = Name2Y
        End If
        If ListBox1.SelectedIndex = 3 Then
            TextBox13.Text = Name3X
            TextBox10.Text = Name3Y
        End If
        If ListBox1.SelectedIndex = 4 Then
            TextBox13.Text = Name4X
            TextBox10.Text = Name4Y
        End If
        If ListBox1.SelectedIndex = 5 Then
            TextBox13.Text = Name5X
            TextBox10.Text = Name5Y
        End If
    End Sub

    Private Sub TextBox13_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox13.TextChanged
        If ListBox1.SelectedIndex = 0 Then
            TitleX = TextBox13.Text
        End If
        If ListBox1.SelectedIndex = 1 Then
            Name1X = TextBox13.Text
        End If
        If ListBox1.SelectedIndex = 2 Then
            Name2X = TextBox13.Text
        End If
        If ListBox1.SelectedIndex = 3 Then
            Name3X = TextBox13.Text
        End If
        If ListBox1.SelectedIndex = 4 Then
            Name4X = TextBox13.Text
        End If
        If ListBox1.SelectedIndex = 5 Then
            Name5X = TextBox13.Text
        End If
    End Sub

    Private Sub TextBox10_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox10.TextChanged
        If ListBox1.SelectedIndex = 0 Then
            TitleY = TextBox10.Text
        End If
        If ListBox1.SelectedIndex = 1 Then
            Name1Y = TextBox10.Text
        End If
        If ListBox1.SelectedIndex = 2 Then
            Name2Y = TextBox10.Text
        End If
        If ListBox1.SelectedIndex = 3 Then
            Name3Y = TextBox10.Text
        End If
        If ListBox1.SelectedIndex = 4 Then
            Name4Y = TextBox10.Text
        End If
        If ListBox1.SelectedIndex = 5 Then
            Name5Y = TextBox10.Text
        End If
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim f As New Dialog5
        f.Show()
    End Sub
End Class