Imports System.IO
Public Class Form6

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Form5.Visible = True
        Me.Visible = False
        Exit Sub
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        On Error GoTo ErrorExit
        Dim headerS As String
        headerS = ""
        Me.ProgressBar1.Value += 1
        If Me.ProgressBar1.Value = 90 Then
            Me.ProgressBar1.Value = 99
            Timer1.Enabled = False
        End If
        If Me.ProgressBar1.Value = 99 Then
            'Me.Timer1.Enabled = False
            'Me.ProgressBar1.Visible = False
            'Me.Label8.Visible = False
            Me.Label8.Text = "Generated!"
            Me.TextBox1.Enabled = True
            Me.Label5.Text = "Copy it and paste it in sonic1.asm under" & vbCrLf & "Map_Obj34: over your current text!"
            Me.Label5.Visible = True
            Me.TextBox2.Text = ""
            If Me.CheckBox1.Checked = True Then
                If Me.TextBox1.TextLength >= 10 Then
                    headerS = "$"
                Else
                    headerS = ""
                End If
                Me.TextBox2.Text = Label15.Text & ":	dc.b " & headerS & Hex(TextBox1.TextLength) & "	;  " & ComboBox1.Text & " | " & TextBox1.Text & vbCrLf
            End If
            'DIE MAIN CODING LINE
            Dim i As Integer
            Dim i2 As Integer
            i2 = "&H" & TextBox3.Text
            For i = 0 To Me.TextBox1.TextLength - 1 Step 1
                'For i = Me.TextBox1.TextLength - 1 To 0 Step -1
                Select Case (Me.TextBox1.Text.Substring(i, 1))
                    Case "A"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, 0, $" & Hex(i2) & "		; A"
                    Case "B"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, 4, $" & Hex(i2) & "		; B"
                    Case "C"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, 8, $" & Hex(i2) & "		; C"
                    Case "D"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $0C, $" & Hex(i2) & "	; D"
                    Case "E"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $10, $" & Hex(i2) & "	; E"
                    Case "F"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $14, $" & Hex(i2) & "	; F"
                    Case "G"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $18, $" & Hex(i2) & "	; G"
                    Case "H"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $1C, $" & Hex(i2) & "	; H"
                    Case "I"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 1, 0, $20, $" & Hex(i2) & "	; I"
                        i2 -= 8
                        'Kein J
                    Case "K"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $22, $" & Hex(i2) & "	; K"
                    Case "L"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $26, $" & Hex(i2) & "	; L"
                    Case "M"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $2A, $" & Hex(i2) & "	; M"
                    Case "N"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $2E, $" & Hex(i2) & "	; N"
                    Case "O"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $32, $" & Hex(i2) & "	; O"
                    Case "P"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $36, $" & Hex(i2) & "	; P"
                        'Kein Q
                    Case "R"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $3A, $" & Hex(i2) & "	; R"
                    Case "S"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $3E, $" & Hex(i2) & "	; S"
                    Case "T"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $42, $" & Hex(i2) & "	; T"
                    Case "U"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $46, $" & Hex(i2) & "	; U"
                        'Kein V, W, X
                    Case "Y"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $4A, $" & Hex(i2) & "	; Y"
                    Case "Z"
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 5, 0, $4E, $" & Hex(i2) & "	; Z"

                    Case " "
                        TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 0, 0, $56, $" & Hex(i2) & "	; Space"

                    Case Else
                        TextBox2.Text = TextBox2.Text & "; ERROR: UNKOWN SIGN"
                        Me.Label10.Visible = True
                        'DIE MAIN CODING LINE

                End Select
                If i < Me.TextBox1.TextLength - 1 Then TextBox2.Text = TextBox2.Text & vbCrLf
                i2 += 16
                i2 = i2 And &HFF

            Next
            Me.Button5.Enabled = True
            Me.Button6.Enabled = True
            Me.Button5.Focus()
            Exit Sub

ErrorExit:
            Me.TextBox2.Text = ""
            MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
            Exit Sub

            'Frühere Version, probleme mit F
            TextBox2.Text = TextBox1.Text.Replace("A", "		dc.b $F8, 5, 0, 0, $14 ;A" & vbCrLf).Replace("B", "		dc.b $F8, 5, 0, 4, $14 ;B" & vbCrLf).Replace("C", "		dc.b $F8, 5, 0, 8, $14 ;C" & vbCrLf).Replace("D", "		dc.b $F8, 5, 0, $0C, $14 ;D" & vbCrLf).Replace("E", "		dc.b $F8, 5, 0, $10, $14 ;E" & vbCrLf) _
            .Replace("F", "		dc.b $F8, 5, 0, $14, $14 ;F" & vbCrLf).Replace("G", "		dc.b $F8, 5, 0, $18, $14 ;G" & vbCrLf).Replace("H", "		dc.b $F8, 5, 0, $1C, $14 ;H" & vbCrLf).Replace("I", "		dc.b $F8, 1, 0, $20, $14 ;I" _
             & vbCrLf).Replace("K", "        dc.b $F8, 5, 0, $22, $14 ;K" & vbCrLf).Replace("L", "		dc.b $F8, 5, 0, $26, $14 ;L" & vbCrLf).Replace("M", "		dc.b $F8, 5, 0, $2A, $14 ;M" & vbCrLf).Replace("N", "		dc.b $F8, 5, 0, $2E, $14 ;N" & vbCrLf).Replace("O", "		dc.b $F8, 5, 0, $32, $14 ;O" & vbCrLf).Replace("P", "		dc.b $F8, 5, 0, $36, $14 ;P" & vbCrLf).Replace("R", "		dc.b $F8, 5, 0, $3A, $14 ;R" & vbCrLf).Replace("S", "		dc.b $F8, 5, 0, $3E, $14 ;S" & vbCrLf).Replace("T", "		dc.b $F8, 5, 0, $42, $14 ;T" _
             & vbCrLf).Replace("U", "		dc.b $F8, 5, 0, $46, $14 ;U" & vbCrLf).Replace("Y", "		dc.b $F8, 5, 0, $4A, $14 ;Y" & vbCrLf).Replace("Z", "		dc.b $F8, 5, 0, $4E, $14 ;Z" & vbCrLf)
            'DIE MAIN CODING LINE
            Me.TextBox2.Focus()
            Me.TextBox2.SelectAll()
        End If
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Me.TextBox1.Text = "Type in your text!" Then
            MsgBox("U SUK!!!", MsgBoxStyle.Critical, "Error")
            Exit Sub
        End If
        If Me.CheckBox1.Checked = True Then
            If Me.ComboBox1.Text = "" Then
                MsgBox("Please edit the Header Settings!", MsgBoxStyle.Exclamation)
                Me.ComboBox1.Focus()
                Exit Sub
            End If
        End If
        If Me.TextBox1.Text = "" Then
            MsgBox("You must insert Text, before you can convert it!", MsgBoxStyle.Critical, "Error")
            TextBox1.Focus()
            Exit Sub
        End If
        Dim exitt As String
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
        If exitt = "1" Then
            Exit Sub
        End If
        TextBox1.Text = TextBox1.Text.ToUpper
        'Me.Label5.Visible = True
        Me.Label8.Visible = True
        Me.ProgressBar1.Visible = True
        Me.ProgressBar1.Value = 0
        Me.TextBox1.Enabled = False
        Me.Label10.Visible = False
        Me.Label8.Text = "Generating..."
        Timer2.Enabled = True

        Exit Sub
        'Me.Label5.Visible = True
        Me.Label8.Visible = True
        Me.ProgressBar1.Visible = True
        Me.TextBox1.Enabled = False
        Me.Label8.Text = "Generating..."
        Timer2.Enabled = True
    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick

        On Error GoTo ErrorExit
        Dim headerS As String
        headerS = ""
        Me.ProgressBar1.Value += 1
        Timer2.Enabled = False
        'Me.Timer1.Enabled = False
        'Me.ProgressBar1.Visible = False
        'Me.Label8.Visible = False
        Me.Label8.Text = "Generated!"
        Me.TextBox1.Enabled = True
        Me.Label5.Text = "Copy it and paste it in _maps -> obj8A.asm " & vbCrLf & "over your current text!"
        Me.Label5.Visible = True
        Me.TextBox2.Text = ""
        If Me.CheckBox1.Checked = True Then
            If Me.TextBox1.TextLength >= 10 Then
                headerS = "$"
            Else
                headerS = ""
            End If
            Me.TextBox2.Text = Label15.Text & ":	dc.b " & headerS & Hex(TextBox1.TextLength) & "	;  " & ComboBox1.Text & " | " & TextBox1.Text & vbCrLf
        End If
        'DIE MAIN CODING LINE
        Dim i As Integer
        Dim i2 As Integer
        i2 = "&H" & TextBox3.Text
        For i = 0 To Me.TextBox1.TextLength - 1 Step 1
            'For i = Me.TextBox1.TextLength - 1 To 0 Step -1
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
                    TextBox2.Text = TextBox2.Text & "		dc.b $" & TextBox4.Text & ", 0, 0, $60, $" & Hex(12) & "    ;Space"
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
        Me.Button5.Enabled = True
        Me.Button6.Enabled = True
        Me.Button5.Focus()
        Exit Sub

ErrorExit:
        Me.TextBox2.Text = ""
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
        Exit Sub

        Me.ProgressBar1.Value += 1
        If Me.ProgressBar1.Value = 90 Then
            Me.ProgressBar1.Value = 99
            Timer2.Enabled = False
        End If
        If Me.ProgressBar1.Value = 99 Then
            'Me.Timer2.Enabled = False
            'Me.ProgressBar1.Visible = False
            'Me.Label8.Visible = False
            Me.Label8.Text = "Generated!"
            Me.TextBox1.Enabled = True
            Me.ProgressBar1.Value = 0
            Me.Label5.Text = "Copy it and paste it in _maps -> obj8A.asm " & vbCrLf & "over your current text!"
            Me.Label5.Visible = True
            Me.TextBox2.Text = "yyyyxxx"
        End If
    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        Dim pos As Integer = TextBox1.SelectionStart
        If Me.TextBox3.Text = "" Then
            Exit Sub
        End If
        TextBox1.Text = TextBox1.Text.ToUpper
        If Me.TextBox1.TextLength = 0 Then
            Me.Button2.Enabled = False
        End If
        If Me.TextBox1.TextLength >= 1 Then
            Me.Button2.Enabled = True
        End If
        TextBox1.Text = TextBox1.Text.ToUpper
        TextBox1.SelectionStart = pos
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Clipboard.Clear()
        Clipboard.SetText(TextBox2.Text)
        'TextBox1.Text = Clipboard.GetText
        TextBox2.Focus()
        TextBox2.SelectAll()
    End Sub

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
        Me.SaveFileDialog1.ShowDialog()
        If Me.SaveFileDialog1.FileName = "" Then
            Exit Sub
        End If
        File.WriteAllText(SaveFileDialog1.FileName, TextBox2.Text)
        MsgBox("A Text file was created under: " & SaveFileDialog1.FileName, MsgBoxStyle.Information, "Saved")
    End Sub

    Private Sub TextBox3_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox3.TextChanged
        Dim firststart As String
        firststart = "0"
        Dim pos As Integer = TextBox3.SelectionStart
        TextBox3.Text = TextBox3.Text.ToUpper
        If Me.TextBox3.TextLength = 0 Then
            Me.Button2.Enabled = False
        Else
            Me.Button2.Enabled = True
        End If
        If Me.TextBox3.TextLength >= 1 Then
            If firststart = "1" Then
                Me.Button2.Enabled = True
            End If
            firststart = "1"
        End If
        TextBox3.Text = TextBox3.Text.ToUpper
        TextBox3.SelectionStart = pos
    End Sub

    Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button7.Click
        TextBox1.Text = ""
        TextBox1.Focus()
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If Me.CheckBox1.Checked = False Then
            Me.Label15.Text = "-"
            Me.ComboBox1.SelectedIndex = 0
            Me.ComboBox1.Enabled = False
        End If
        If Me.CheckBox1.Checked = True Then
            Me.ComboBox1.Enabled = True
            Me.ComboBox1.SelectedIndex = 0
            Me.Label15.Text = "byte_172F8"
        End If
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBox1.SelectedIndexChanged
        If Me.ComboBox1.SelectedIndex = 0 Then
            Me.Label15.Text = "byte_172F8"
            Me.TextBox4.Text = "F8"
        End If
        If Me.ComboBox1.SelectedIndex = 1 Then
            Me.Label15.Text = "byte_1733F"
            Me.TextBox4.Text = "F8"
        End If
        If Me.ComboBox1.SelectedIndex = 2 Then
            Me.Label15.Text = "byte_17390"
            Me.TextBox4.Text = "F8"
        End If
        If Me.ComboBox1.SelectedIndex = 3 Then
            Me.TextBox4.Text = "F8"
            Me.Label15.Text = "byte_173C3"
        End If
        If Me.ComboBox1.SelectedIndex = 4 Then
            Me.TextBox4.Text = "F8"
            Me.Label15.Text = "byte_1743C"
        End If
        If Me.ComboBox1.SelectedIndex = 5 Then
            Me.TextBox4.Text = "F8"
            Me.Label15.Text = "byte_174A1"
        End If
        If Me.ComboBox1.SelectedIndex = 6 Then
            Me.TextBox4.Text = "F8"
            Me.Label15.Text = "byte_17524"
        End If
        If Me.ComboBox1.SelectedIndex = 7 Then
            Me.TextBox4.Text = "F8"
            Me.Label15.Text = "byte_17598"
        End If
        If Me.ComboBox1.SelectedIndex = 8 Then
            Me.TextBox4.Text = "F8"
            Me.Label15.Text = "byte_17634"
        End If
        If Me.ComboBox1.SelectedIndex = 9 Then
            Me.Label15.Text = "byte_17680"
            Me.TextBox4.Text = "30"
        End If
        If Me.ComboBox1.SelectedIndex = 10 Then
            If MsgBox("You just selected " & Chr(34) & "Sonic Team Presents" & Chr(34) & ". I recommend you to use the special generator for this." & vbCrLf & "Do you want to open the it now?", MsgBoxStyle.Question Or MsgBoxStyle.YesNo) = MsgBoxResult.Yes Then
                Dim f As New Form7
                f.Show()
            End If
            Me.TextBox4.Text = "E8"
            Me.Label15.Text = "byte_176A9"
        End If
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Dim b() As Byte
        Dim i, z As Integer
        b = File.ReadAllBytes("C:\menutext.bin")
        For i = 0 To b.Count - 10 Step 5
            For z = 0 To 5
                Me.TextBox2.Text = Me.TextBox2.Text & Hex(b(i + z)) & " "
            Next
            Me.TextBox2.Text = Me.TextBox2.Text & vbCrLf
        Next
    End Sub

    Private Sub Button9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button9.Click
        Dim f As New Dialog1
        f.Show()
    End Sub

    Private Sub Form3_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.ComboBox1.Text = "GREEN HILL"
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        Dim url As String
        url = "http://sonicresearch.org/forums/index.php?showuser=469"
        'url = "http://goggle.de"
        Try
            Process.Start(url)
        Catch ex As Exception
            MsgBox("Error: " & Err.Description & vbCrLf & "URL: " & url, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button10.Click
        Dim laenge As Integer
        Dim i As Integer
        laenge = 0
        For i = 0 To TextBox1.TextLength - 1
            laenge += 16
            If TextBox1.Text.Substring(i, 1) = "I" Then laenge -= 8
        Next
        laenge = &H100 - laenge + &H4C
        laenge = laenge And &HFF
        If laenge < &H80 And Me.TextBox1.TextLength > 9 Then
            laenge = laenge And &HF Or &H80
        End If
        TextBox3.Text = Hex(laenge)
        If Me.TextBox1.Text = "" Then
            Me.TextBox3.Text = "80"
        End If
    End Sub

    Private Sub Button3_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim f As New Form7
        f.Show()
    End Sub
    Private Sub Form6_Deactivate(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Deactivate
        If Form5.CheckBox1.Checked = True Then
            Me.Opacity = 0.9F
        End If
    End Sub

    Private Sub Form6_Activated(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Activated
        Me.Opacity = 1.0F
    End Sub
End Class