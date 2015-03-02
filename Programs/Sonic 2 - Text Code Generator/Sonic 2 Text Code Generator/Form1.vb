Imports System.IO
Public Class Form1
    Dim textisin As Integer = 0
    Dim XStartLoc As String = "70"
    Dim KeyCharInt As Integer

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        On Error GoTo ErrorExit
        TextBox2.Clear()
        TextBox3.Clear()
        XStartLoc = "&h" & TextBox6.Text
        XStartLoc -= 16
        If Me.TextBox1.Text.Substring(0, 1) = "M" Then XStartLoc += 3

        ' ===================================================================================================
        Dim zoneshort As String = TextBox4.Text
        Dim converted As String = TextBox1.Text
        converted = converted.Replace("E", "")
        converted = converted.Replace("N", "")
        converted = converted.Replace("O", "")
        converted = converted.Replace("Z", "")
        converted = converted.Replace(" ", "")
        Dim i As Integer

        Dim TB2Part1 As String = ""
        Dim TB2Part2 As String = ""
        Dim TB2Part3 As String = ""
        Dim TB2Part4 As String = ""
        Dim TB2Part5 As String = ""

        TB2Part1 = "TCL_" & TextBox4.Text & ":" & Chr(9) & "dc.w "
        If Not converted = "" Then TB2Part1 = TB2Part1 & "_"

        TB2Part2 = Mid(converted, 1, 1)
        For i = 2 To converted.Length
            If InStr(TB2Part2, Mid(converted, i, 1)) = 0 Then
                TB2Part2 = TB2Part2 & ", _" & Mid(converted, i, 1)
            End If
        Next
        If Not converted = "" Then TB2Part3 = ", "
        TB2Part3 = TB2Part3 & "TCEnd"

        Dim replaced As String = TB2Part2.Replace(", _", "")
        converted = converted.Replace(" ", "")
        Dim max As Integer = 8 - replaced.Length

        'For i = 0 To max - 1
        '   TB2Part4 = TB2Part4 & ", 0"
        'Next

        TB2Part5 = Chr(9) & "; " & zoneshort

        If CheckBox1.Checked = False Then
            TextBox2.Text = TB2Part1 & TB2Part2 & TB2Part3 & TB2Part4 & TB2Part5
        Else
            TextBox2.Text = "Hg: Go to 'word_15832:' and type in your name manually."
        End If
        ' ===================================================================================================

        converted = TextBox1.Text.Replace(" ", "")
        TextBox3.Text = "TC_" & zoneshort & ":	"
        If zoneshort.Length < 4 Then
            TextBox3.Text = TextBox3.Text & "	"
        End If
        TextBox3.Text = TextBox3.Text & "dc.w $"
        'If converted.Length > 9 Then
        'TextBox3.Text = TextBox3.Text & "$"
        'End If
        TextBox3.Text = TextBox3.Text & Hex(converted.Length) & Chr(9) & Chr(9) & Chr(9) & Chr(9) & "; " & TextBox1.Text & vbCrLf
        Dim i1 As Integer
        Dim i3 As Integer = "&H" & "DE"
        Dim i4 As Integer = "&H" & "EF"
        converted = converted.Replace("E", "")
        converted = converted.Replace("N", "")
        converted = converted.Replace("O", "")
        converted = converted.Replace("Z", "")
        Dim CharArray As String
        Dim IntArray(14) As Integer
        Dim i5 As Integer = 0
        Dim GespeicherteZeichen As String = ""
        Dim pos As Integer
        Dim GespeicherteZeichen2 As String = ""
        Dim pos2 As Integer
        Dim vramover As Integer = 0
        Dim out As String
        Dim alteradd As Integer = 0
        Dim nexttime As Integer = 0
        For i1 = 0 To Me.TextBox1.TextLength - 1
            If Me.TextBox1.Text.Substring(i1, 1) = " " Then
                GoTo Space
            End If
            If TextBox1.Text.Substring(i1, 1) = "E" Or TextBox1.Text.Substring(i1, 1) = "N" Or TextBox1.Text.Substring(i1, 1) = "O" Or TextBox1.Text.Substring(i1, 1) = "Z" Then
                GoTo Noi3Add
            End If
            pos = InStr(GespeicherteZeichen, Me.TextBox1.Text.Substring(i1, 1))
            If pos = 0 Then
                GespeicherteZeichen = GespeicherteZeichen & Me.TextBox1.Text.Substring(i1, 1)
                pos = GespeicherteZeichen.Length
                IntArray(pos) = 4
                If alteradd = 1 Then
                    IntArray(pos) = 2
                    alteradd = 0
                End If
                If alteradd = 2 Then
                    IntArray(pos) = 6
                    alteradd = 0
                End If
                If Me.TextBox1.Text.Substring(i1, 1) = "I" Then alteradd = 1
                If Me.TextBox1.Text.Substring(i1, 1) = "W" Then alteradd = 2
                If Me.TextBox1.Text.Substring(i1, 1) = "M" Then alteradd = 2
                IntArray(pos) += IntArray(pos - 1)
            End If
            i3 = IntArray(pos)
            i3 += "&hDA"

            i4 = IntArray(pos) / 2
            i4 += "&hED"
            'pos2 = InStr(GespeicherteZeichen2, Me.TextBox1.Text.Substring(i1, 1))
            'If pos2 = 0 Then
            'GespeicherteZeichen2 = GespeicherteZeichen2 & Me.TextBox1.Text.Substring(i1, 1)
            'i4 = GespeicherteZeichen2.Length * 2
            'Else
            'i4 = pos2 * 2
            'End If

            'i4 = "00"

Noi3Add:
            If vramover = 0 Then
                If i3 > "&hFF" Then
                    vramover = 1
                    MsgBox("You've been using too many different letters (over 8, excluding E, N, O and Z)." & vbCrLf & "Try picking a name with less unique letters." & vbCrLf & vbCrLf & "The output code is NOT going to work.", MsgBoxStyle.Critical, "VRAM Overflow Error")
                End If
            End If

            If Not Char.IsLetter(Me.TextBox1.Text.Substring(i1, 1)) Then
                MsgBox("Your name contains invalid letters. Canceling process. (" & Me.TextBox1.Text.Substring(i1, 1) & ")", MsgBoxStyle.Critical)
                TextBox2.Text = "Error" & vbCrLf & vbCrLf & TextBox2.Text
                TextBox3.Text = "Error" & vbCrLf & vbCrLf & TextBox3.Text
                Exit Sub
            End If
Space:
            Select Case (Me.TextBox1.Text.Substring(i1, 1))
                Case "M"
                    XStartLoc += 13
                Case Else
                    XStartLoc += 16
            End Select
            If Not nexttime = 0 Then
                XStartLoc += nexttime
            End If
            XStartLoc = XStartLoc And &HFF
            Select Case (Me.TextBox1.Text.Substring(i1, 1))
                Case " "
                    ' Do nothing on a space but increasing XStartLoc
                Case "E"
                    TextBox3.Text = TextBox3.Text & "		dc.w $0005, $8580, $82C0, "
                    If XStartLoc >= 128 Then TextBox3.Text = TextBox3.Text & "$FF" Else TextBox3.Text = TextBox3.Text & "$00"
                    TextBox3.Text = TextBox3.Text & "" & (Hex(XStartLoc)).ToString.PadLeft(2, "0") & Chr(9) & "; E"
                Case "N"
                    TextBox3.Text = TextBox3.Text & "		dc.w $0005, $8584, $82C2, "
                    If XStartLoc >= 128 Then TextBox3.Text = TextBox3.Text & "$FF" Else TextBox3.Text = TextBox3.Text & "$00"
                    TextBox3.Text = TextBox3.Text & "" & (Hex(XStartLoc)).ToString.PadLeft(2, "0") & Chr(9) & "; N"
                Case "O"
                    TextBox3.Text = TextBox3.Text & "		dc.w $0005, $8588, $82C4, "
                    If XStartLoc >= 128 Then TextBox3.Text = TextBox3.Text & "$FF" Else TextBox3.Text = TextBox3.Text & "$00"
                    TextBox3.Text = TextBox3.Text & "" & (Hex(XStartLoc)).ToString.PadLeft(2, "0") & Chr(9) & "; O"
                Case "Z"
                    TextBox3.Text = TextBox3.Text & "		dc.w $0005, $858C, $82C6, "
                    If XStartLoc >= 128 Then TextBox3.Text = TextBox3.Text & "$FF" Else TextBox3.Text = TextBox3.Text & "$00"
                    TextBox3.Text = TextBox3.Text & "" & (Hex(XStartLoc)).ToString.PadLeft(2, "0") & Chr(9) & "; Z"
                Case Else
                    Dim FormatValue As Integer = 5
                    If TextBox1.Text.Substring(i1, 1) = "M" Then FormatValue = 9
                    If TextBox1.Text.Substring(i1, 1) = "W" Then FormatValue = 9
                    If TextBox1.Text.Substring(i1, 1) = "I" Then FormatValue = 1
                    TextBox3.Text = TextBox3.Text & "		dc.w $000" & FormatValue & ", $85" & Hex(i3) & ", $82" & Hex(i4) & ", "
                    If XStartLoc >= 128 Then TextBox3.Text = TextBox3.Text & "$FF" Else TextBox3.Text = TextBox3.Text & "$00"
                    TextBox3.Text = TextBox3.Text & "" & (Hex(XStartLoc)).ToString.PadLeft(2, "0") & "	; " & Me.TextBox1.Text.Substring(i1, 1)
            End Select

            If i1 < Me.TextBox1.TextLength - 1 Then TextBox3.Text = TextBox3.Text & vbCrLf
            nexttime = 0
            If TextBox1.Text.Substring(i1, 1) = "M" Then nexttime = 8
            If TextBox1.Text.Substring(i1, 1) = "W" Then nexttime = 8
            If TextBox1.Text.Substring(i1, 1) = "I" Then nexttime = -8

        Next
        If CheckBox1.Checked Then
            GroupBox2.Enabled = False
        Else
            GroupBox2.Enabled = True
        End If
        GroupBox3.Enabled = True
        Exit Sub

ErrorExit:
        MsgBox("Error:" & vbCrLf & vbCrLf & Err.Description, MsgBoxStyle.Critical)
    End Sub

    Public Sub FindStartXLoc()
        Dim laenge As Integer
        Dim i As Integer
        laenge = 0
        For i = 0 To TextBox1.TextLength - 1
            laenge += 16
            If TextBox1.Text.Substring(i, 1) = "I" Then laenge -= 8
            If TextBox1.Text.Substring(i, 1) = "M" Then laenge += 8
            If TextBox1.Text.Substring(i, 1) = "W" Then laenge += 8
        Next
        laenge = &H100 - laenge + &H70
        laenge = laenge And &HFF
        XStartLoc = laenge
        TextBox6.Text = Hex(XStartLoc + 16)
        Dim intx As Integer = "&h" & TextBox6.Text
        If intx > 255 Then
            TextBox6.Text = Hex(intx And 255)
        End If
    End Sub

    Private Sub TextBox1_GotFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBox1.GotFocus
        If textisin = 0 Then
            TextBox1.MaxLength = 15
            TextBox1.Text = ""
            TextBox1.Font = New Font("Courier New", 12, FontStyle.Regular)
            TextBox1.ForeColor = SystemColors.WindowText
        End If
    End Sub

    Private Sub TextBox1_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBox1.LostFocus
        If Me.TextBox1.Text = "" Then
            TextBox1.MaxLength = 35
            textisin = 0
            TextBox1.Text = "Type in your new Zone Name..."
            Button1.Enabled = False
            TextBox1.Font = New Font("Courier New", 12, FontStyle.Italic)
            TextBox1.ForeColor = Color.DimGray
        Else
            TextBox1.MaxLength = 14
            Button1.Enabled = True
            textisin = 1
        End If
    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        If TextBox1.TextLength = 0 Then
            Button1.Enabled = False
            TextBox5.Text = "0"
            TextBox6.Text = "80"
        Else
            Call FindStartXLoc()
            If Not ComboBox1.Text = "" Then
                Button1.Enabled = True
            End If
            TextBox5.Text = TextBox1.TextLength
        End If
        If TextBox1.Text = "TYPE IN YOUR NEW ZONE NAME..." Or TextBox1.Text = "Type in your new Zone Name..." Then
            TextBox1.Text = "Type in your new Zone Name..."
            TextBox5.Text = "0"
            TextBox6.Text = "80"
            Exit Sub
        End If
        Dim pos As Integer = TextBox1.SelectionStart
        TextBox1.Text = TextBox1.Text.ToUpper
        TextBox1.Text = TextBox1.Text.ToUpper
        TextBox1.SelectionStart = pos
    End Sub


    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Clipboard.Clear()
        Clipboard.SetText(TextBox2.Text)
        TextBox2.Focus()
        TextBox2.SelectAll()
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Clipboard.Clear()
        Clipboard.SetText(TextBox3.Text)
        TextBox3.Focus()
        TextBox3.SelectAll()
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBox1.SelectedIndexChanged
        Select Case (ComboBox1.SelectedItem)
            Case "Emerald Hill"
                TextBox4.Text = "EHZ"
            Case "Metropolis Act 1+2"
                TextBox4.Text = "MTZ"
            Case "Metropolis Act 3"
                TextBox4.Text = "MT3"
            Case "Wing Fortress"
                TextBox4.Text = "WFZ"
            Case "Hill Top"
                TextBox4.Text = "HTZ"
            Case "Hidden Palace"
                TextBox4.Text = "HPZ"
            Case "Oil Ocean"
                TextBox4.Text = "OOZ"
            Case "Mystic Cave"
                TextBox4.Text = "MCZ"
            Case "Casino Night"
                TextBox4.Text = "CNZ"
            Case "Chemical Plant"
                TextBox4.Text = "CPZ"
            Case "Death Egg"
                TextBox4.Text = "DEZ"
            Case "Aquatic Ruin"
                TextBox4.Text = "ARZ"
            Case "Sky Chase"
                TextBox4.Text = "SCZ"
            Case "ZONE"
                TextBox4.Text = "ZONE"
        End Select
    End Sub

    Private Sub TextBox1_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox1.KeyDown
        If e.Control = True And Chr(e.KeyCode) = "A" Then
            TextBox1.SelectAll()
        End If
        KeyCharInt = e.KeyCode
    End Sub

    Private Sub TextBox2_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox2.KeyDown
        If e.Control = True And Chr(e.KeyCode) = "A" Then
            TextBox2.SelectAll()
        End If
    End Sub

    Private Sub TextBox3_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox3.KeyDown
        If e.Control = True And Chr(e.KeyCode) = "A" Then
            TextBox3.SelectAll()
        End If
    End Sub

    Private Sub TextBox1_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles TextBox1.KeyPress
        If KeyCharInt < 65 Or KeyCharInt > 90 Then
            If Not KeyCharInt = 8 And Not KeyCharInt = 32 Then
                Beep()
                e.Handled = True
            End If
        End If
    End Sub

    Private Sub TextBox6_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox6.TextChanged
        If Me.TextBox6.TextLength = 0 Then
            Button1.Enabled = False
        Else
            Button1.Enabled = True
        End If
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.ComboBox1.SelectedIndex = 0
        TextBox1.Focus()
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged

    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        MsgBox("The Sonic 2 Hg disassembly is the most up to date version of the S2 disassembly and is frequently updated. It is highly recommended. However, many people still prefer Xenowhirl's old disassembly from 2007." & _
               vbCrLf & vbCrLf & "If you're using the new Hg version, please tick this Checkbox. Otherwise leave it blank." & _
               vbCrLf & vbCrLf & "The Hg disassembly has a unique system for the Title Card setup. Just go to 'word_15832:' and manually type in your zone name.", MsgBoxStyle.Information, "The Sonic 2 Hg Disassembly - Information")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dialog3.Show()
        If CheckBox1.Checked Then
            Dialog3.TabControl1.SelectTab(1)
        Else
            Dialog3.TabControl1.SelectTab(0)
        End If
    End Sub
End Class
