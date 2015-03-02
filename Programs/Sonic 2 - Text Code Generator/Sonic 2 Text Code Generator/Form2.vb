Imports System.IO
Public Class Form2
    Dim textisin As Integer = 0
    Dim XStartLoc As Integer
    Dim KeyCharInt As Integer

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click

        ' A C E GHI  LMNO  RSTU    Z.
        '  B D F   JK    PQ    VWXY .
        ' ABCDEFGHIJKLMNOPQRSTUVWXYZ.
        ' ACGHILMRSTU
        ' A, C, G, H, I, L, M, R, S, T, U

        On Error GoTo ErrorExit
        TextBox3.Clear()
        TextBox3.Clear()
        XStartLoc = "&h" & TextBox6.Text
        'XStartLoc -= 16
        ' ===================================================================================================
        Dim zoneshort As String = TextBox4.Text
        Dim exists As Integer
        Dim converted As String = ""
        Dim convertedX As String = ""
        For i = 0 To TextBox1.TextLength - 1
            exists = 0
            Select Case (TextBox1.Text.Substring(i, 1))
                Case "A"
                    exists = 1
                Case "C"
                    exists = 1
                Case "G"
                    exists = 1
                Case "H"
                    exists = 1
                Case "I"
                    exists = 1
                Case "L"
                    exists = 1
                Case "M"
                    exists = 1
                Case "R"
                    exists = 1
                Case "S"
                    exists = 1
                Case "T"
                    exists = 1
                Case "U"
                    exists = 1
                Case "E"
                    exists = 1
                Case "N"
                    exists = 1
                Case "O"
                    exists = 1
                Case "Z"
                    exists = 1
                Case Else
                    exists = 0
            End Select
            If exists = 1 Then
                converted = converted & TextBox1.Text.Substring(i, 1)
                convertedX = convertedX & TextBox1.Text.Substring(i, 1)
            Else
                convertedX = convertedX & " "
            End If
        Next

        TextBox3.Text = "EOL_" & zoneshort & ":" & Chr(9) & "dc.w $" & Hex(converted.Length) & Chr(9) & Chr(9) & Chr(9) & Chr(9) & "; " & convertedX & vbCrLf         ' example: "EOZ_Sonic:	dc.w $8         ; SONIC GOT"

        Dim MappingType As Integer
        Dim VRAMnormal As Integer
        Dim VRAM2Player As Integer
        Dim ENOZ As Integer
        Dim FForZero As String
        Dim UnsupportedChar As Integer = 0

        For i = 0 To Me.TextBox1.TextLength - 1
            XStartLoc = XStartLoc And &HFF

            MappingType = 5
            If Me.TextBox1.Text.Substring(i, 1) = "M" Then
                MappingType = 9
            End If
            If Me.TextBox1.Text.Substring(i, 1) = "I" Then
                MappingType = 1
            End If
            ENOZ = 0
            Select Case (Me.TextBox1.Text.Substring(i, 1))
                Case "A"
                    VRAMnormal = 0
                Case "C"
                    VRAMnormal = 4
                Case "G"
                    VRAMnormal = 8
                Case "H"
                    VRAMnormal = 12
                Case "I"
                    VRAMnormal = 16
                Case "L"
                    VRAMnormal = 18
                Case "M"
                    VRAMnormal = 22
                Case "R"
                    VRAMnormal = 28
                Case "S"
                    VRAMnormal = 32
                Case "T"
                    VRAMnormal = 36
                Case "U"
                    VRAMnormal = 40

                Case "E"
                    VRAMnormal = 128
                    VRAM2Player = 192
                    ENOZ = 1
                Case "N"
                    VRAMnormal = 132
                    VRAM2Player = 194
                    ENOZ = 1
                Case "O"
                    VRAMnormal = 136
                    VRAM2Player = 196
                    ENOZ = 1
                Case "Z"
                    VRAMnormal = 140
                    VRAM2Player = 198
                    ENOZ = 1

                Case " "
                    VRAMnormal = -2
                    XStartLoc += 8

                Case Else
                    XStartLoc += 16
                    VRAMnormal = -1
            End Select

            If VRAMnormal = -2 Then
                GoTo Skip
            End If

            If VRAMnormal = -1 Then
                TextBox3.Text = TextBox3.Text & Chr(9) & Chr(9) & "; " & Me.TextBox1.Text.Substring(i, 1) & " is not supported."
                UnsupportedChar += 1

                GoTo Skip
            End If

            If ENOZ = 0 Then
                VRAM2Player = (VRAMnormal / 2) + 216
                VRAMnormal += 176
            End If

            If XStartLoc >= 128 Then
                FForZero = "$FF"
            Else
                FForZero = "$00"
            End If

            TextBox3.Text = TextBox3.Text & Chr(9) & Chr(9) & "dc.w $000" & MappingType & ", $85" & Hex(VRAMnormal) & ", $82" & Hex(VRAM2Player) & ", " & FForZero & "" & Hex(XStartLoc).ToString.PadLeft(2, "0") & Chr(9) & "; " & Me.TextBox1.Text.Substring(i, 1)

            XStartLoc += 16
            If TextBox1.Text.Substring(i, 1) = "M" Then XStartLoc += 8
            If TextBox1.Text.Substring(i, 1) = "I" Then XStartLoc -= 8

Skip:
            If i < Me.TextBox1.TextLength - 1 Then TextBox3.Text = TextBox3.Text & vbCrLf
        Next
        If Not UnsupportedChar = 0 Then
            MsgBox(UnsupportedChar & " unsupported character(s) were detected and not converted." & vbCrLf & vbCrLf & "Remember you may only use these letters:" & vbCrLf & "A, C, E, G, H, I, L, M, N, O, R, S, T, U and Z", MsgBoxStyle.Exclamation)
        End If
        GroupBox3.Enabled = True
        Exit Sub

ErrorExit:
        MsgBox("Error:" & vbCrLf & vbCrLf & Err.Description, MsgBoxStyle.Critical)
    End Sub

    Public Sub FindStartXLoc()
        Dim laenge As Integer = TextBox1.TextLength * 16
        Dim i As Integer
        For i = 0 To TextBox1.TextLength - 1
            If TextBox1.Text.Substring(i, 1) = "I" Then laenge -= 8
            If TextBox1.Text.Substring(i, 1) = " " Then laenge -= 8
            If TextBox1.Text.Substring(i, 1) = "M" Then laenge += 8
        Next
        Dim CenterPos As Integer = (255 - laenge) / 2
        CenterPos = CenterPos + 128
        TextBox6.Text = Hex(CenterPos)
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
            TextBox1.Text = "Type in your new Text..."
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
            If CheckBox1.Enabled = True Then
                If CheckBox1.Checked = True Then
                    Call FindStartXLoc()
                End If
            End If
            If Not ComboBox1.Text = "" Then
                Button1.Enabled = True
            End If
            TextBox5.Text = TextBox1.TextLength
        End If
        If TextBox1.Text = "TYPE IN YOUR NEW TEXT..." Or TextBox1.Text = "Type in your new Text..." Then
            TextBox1.Text = "Type in your new Text..."
            TextBox5.Text = "0"
            TextBox6.Text = "80"
            Exit Sub
        End If
        Dim pos As Integer = TextBox1.SelectionStart
        TextBox1.Text = TextBox1.Text.ToUpper
        TextBox1.Text = TextBox1.Text.ToUpper
        TextBox1.SelectionStart = pos
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dialog3.Show()
        Dialog3.TabControl1.SelectTab(2)
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Clipboard.Clear()
        Clipboard.SetText(TextBox3.Text)
        TextBox3.Focus()
        TextBox3.SelectAll()
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Clipboard.Clear()
        Clipboard.SetText(TextBox3.Text)
        TextBox3.Focus()
        TextBox3.SelectAll()
    End Sub

    Private Sub TextBox1_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox1.KeyDown
        If e.Control = True And Chr(e.KeyCode) = "A" Then
            TextBox1.SelectAll()
        End If
        KeyCharInt = e.KeyCode
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

    Private Sub ComboBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBox1.SelectedIndexChanged
        Select Case (ComboBox1.SelectedItem)
            Case "SONIC GOT"
                TextBox4.Text = "Sonic"
                CheckBox1.Enabled = True
            Case "MILES GOT"
                TextBox4.Text = "Miles"
                CheckBox1.Enabled = True
            Case "TAILS GOT"
                TextBox4.Text = "Tails"
                CheckBox1.Enabled = True
            Case "THROUGH"
                TextBox4.Text = "Through"
                CheckBox1.Enabled = False
            Case "ACT"
                TextBox4.Text = "Act"
                CheckBox1.Enabled = False
        End Select
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            Call FindStartXLoc()
        End If
    End Sub
End Class
