Imports System.IO
Public Class Form11

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
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
        If Me.TextBox1.Text.Contains("J") Then
            exitt = "1"
            MsgBox("J can't be used for Zone Title Cards!", MsgBoxStyle.Critical, "Error")
            Me.TextBox1.Focus()
        End If
        If Me.TextBox1.Text.Contains("Q") Then
            exitt = "1"
            MsgBox("Q can't be used for Zone Title Cards!", MsgBoxStyle.Critical, "Error")
            Me.TextBox1.Focus()
        End If
        If Me.TextBox1.Text.Contains("V") Then
            exitt = "1"
            MsgBox("V can't be used for Zone Title Cards!", MsgBoxStyle.Critical, "Error")
            Me.TextBox1.Focus()
        End If
        If Me.TextBox1.Text.Contains("W") Then
            exitt = "1"
            MsgBox("W can't be used for Zone Title Cards!", MsgBoxStyle.Critical, "Error")
            Me.TextBox1.Focus()
        End If
        If Me.TextBox1.Text.Contains("X") Then
            exitt = "1"
            MsgBox("X can't be used for Zone Title Cards!", MsgBoxStyle.Critical, "Error")
            Me.TextBox1.Focus()
        End If
        If exitt = "1" Then
            Exit Sub
        End If
        If TextBox1.TextLength >= 16 Then
            If MsgBox("Text length is longer than 16 characters. It's possible, that problems are cused. Continue?", MsgBoxStyle.Question Or MsgBoxStyle.YesNo, "Over 16 characters") = MsgBoxResult.No Then
                Exit Sub
            End If
        End If
        TextBox1.Text = TextBox1.Text.ToUpper
        Me.Label8.Visible = True
        Me.TextBox1.Enabled = False
        Me.Label10.Visible = False
        Me.Label8.Text = "Generating..."
        Timer1.Enabled = True
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        On Error GoTo ErrorExit
        Dim headerS As String
        headerS = ""
        Timer1.Enabled = False
        Me.Label8.Text = "Generated!"
        Me.TextBox1.Enabled = True
        Me.Label5.Text = "Copy it and paste it in sonic1.asm under" & vbCrLf & "Map_Obj3A: over your current text!"
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
        Dim TCCHelp_string As String
        If Not File.Exists("S1TCG settings.txt") Then
            File.WriteAllText("S1TCG settings.txt", "0")
        End If
        TCCHelp_string = File.ReadAllText("S1TCG settings.txt")
        If TCCHelp_string = "0" Then
            If MsgBox("To get perfect results, you should edit the Title Card Configs. Do you want to open the help Window now?", MsgBoxStyle.Information Or MsgBoxStyle.YesNo, "Generated!") = MsgBoxResult.Yes Then
                Dim f As New Dialog3
                f.Show()
            End If
        End If
        Exit Sub

ErrorExit:
        Me.TextBox2.Text = ""
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
        Exit Sub
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Form5.Visible = True
        Me.Visible = False
        Exit Sub
    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        Call CalcCenterPos()
    End Sub
    Public Sub CalcCenterPos()
        Dim pos As Integer = TextBox1.SelectionStart
        If Me.TextBox3.Text = "" Then
            Exit Sub
        End If
        TextBox1.Text = TextBox1.Text.ToUpper
        If Me.TextBox1.TextLength = 0 Then
            Me.Button1.Enabled = False
        End If
        If Me.TextBox1.TextLength >= 1 Then
            Me.Button1.Enabled = True
        End If
        TextBox1.Text = TextBox1.Text.ToUpper
        TextBox1.SelectionStart = pos
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
    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Clipboard.Clear()
        Clipboard.SetText(TextBox2.Text)
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
            Me.Button1.Enabled = False
        Else
            Me.Button1.Enabled = True
        End If
        If Me.TextBox3.TextLength >= 1 Then
            If firststart = "1" Then
                Me.Button1.Enabled = True
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
            Me.Label15.Text = "byte_CBEA"
        End If
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBox1.SelectedIndexChanged
        If Me.ComboBox1.SelectedIndex = 0 Then
            Me.Label15.Text = "byte_CBEA"
        End If
        If Me.ComboBox1.SelectedIndex = 1 Then
            Me.Label15.Text = "byte_CC13"
        End If
        If Me.ComboBox1.SelectedIndex = 2 Then
            Me.Label15.Text = "byte_CC32"
        End If
        If Me.ComboBox1.SelectedIndex = 3 Then
            Me.Label15.Text = "byte_CC51"
        End If
        If Me.ComboBox1.SelectedIndex = 4 Then
            Me.Label15.Text = "byte_CC75"
        End If
    End Sub

    Private Sub Button9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Dim f As New Dialog1
        f.Show()
    End Sub

    Private Sub Form3_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.ComboBox1.Text = "SONIC HAS"
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        Dim url As String
        url = "http://sonicresearch.org/forums/index.php?showuser=469"
        Try
            Process.Start(url)
        Catch ex As Exception
            MsgBox("Error: " & Err.Description & vbCrLf & "URL: " & url, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button10.Click
        Call CalcCenterPos()
    End Sub

    Private Sub Button3_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If Not File.Exists("S1TCG settings.txt") Then
            File.WriteAllText("S1TCG settings.txt", "0")
        End If
        Dim f As New Dialog3
        f.Show()
    End Sub
    Private Sub Form3_Deactivate(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Deactivate
        If Form5.CheckBox1.Checked = True Then
            Me.Opacity = 0.9F
        End If
    End Sub

    Private Sub Form3_Activated(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Activated
        Me.Opacity = 1.0F
    End Sub
End Class