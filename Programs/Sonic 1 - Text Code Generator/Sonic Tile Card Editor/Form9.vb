Imports System.IO
Public Class Form9
    Dim Anzahl As Integer
    Dim laenge As Integer = 0
    Dim Datei As String
    Dim ByteDim As Byte()


    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        'If MsgBox("Opening this is in extreme Beta Stage. If you want to edit the original text, you should use the already loaded text. Load anyway?", MsgBoxStyle.Exclamation Or MsgBoxStyle.YesNo) = MsgBoxResult.No Then
        'Exit Sub
        'End If
Restart:
        On Error GoTo ErrorExit

        'LOAD FILE
        OpenFileDialog1.FileName = ""

        OpenFileDialog1.ShowDialog()
        If OpenFileDialog1.FileName = "" Then
            Exit Sub
        End If
        TextBox1.Text = OpenFileDialog1.FileName
        RTBText.Text = ""
        RTBHex.Text = ""
        Datei = OpenFileDialog1.FileName
        ByteDim = My.Computer.FileSystem.ReadAllBytes(Datei)
        For Each b As System.Byte In ByteDim
            Me.RTBHex.Text += System.String.Format("{0:X2} ", b)
        Next
        Dim text1optimzed As String
        text1optimzed = RTBHex.Text
        text1optimzed = text1optimzed.Replace(" ", "")
        Dim ihex As Integer
        Dim ihex2 As Integer
        For ihex = 0 To text1optimzed.Length - 2 Step 2
            Select Case (text1optimzed.Substring(ihex, 2))
                Case "11"
                    RTBText.Text = RTBText.Text & "A"
                Case "12"
                    RTBText.Text = RTBText.Text & "B"
                Case "13"
                    RTBText.Text = RTBText.Text & "C"
                Case "14"
                    RTBText.Text = RTBText.Text & "D"
                Case "15"
                    RTBText.Text = RTBText.Text & "E"
                Case "16"
                    RTBText.Text = RTBText.Text & "F"
                Case "17"
                    RTBText.Text = RTBText.Text & "G"
                Case "18"
                    RTBText.Text = RTBText.Text & "H"
                Case "19"
                    RTBText.Text = RTBText.Text & "I"
                Case "1A"
                    RTBText.Text = RTBText.Text & "J"
                Case "1B"
                    RTBText.Text = RTBText.Text & "K"
                Case "1C"
                    RTBText.Text = RTBText.Text & "L"
                Case "1D"
                    RTBText.Text = RTBText.Text & "M"
                Case "1E"
                    RTBText.Text = RTBText.Text & "N"
                Case "1F"
                    RTBText.Text = RTBText.Text & "O"
                Case "20"
                    RTBText.Text = RTBText.Text & "P"
                Case "21"
                    RTBText.Text = RTBText.Text & "Q"
                Case "22"
                    RTBText.Text = RTBText.Text & "R"
                Case "23"
                    RTBText.Text = RTBText.Text & "S"
                Case "24"
                    RTBText.Text = RTBText.Text & "T"
                Case "25"
                    RTBText.Text = RTBText.Text & "U"
                Case "26"
                    RTBText.Text = RTBText.Text & "V"
                Case "27"
                    RTBText.Text = RTBText.Text & "W"
                Case "28"
                    RTBText.Text = RTBText.Text & "X"
                Case "0F"
                    RTBText.Text = RTBText.Text & "Y"
                Case "10"
                    RTBText.Text = RTBText.Text & "Z"

                    'Spezial 1

                Case "00"
                    RTBText.Text = RTBText.Text & "0"
                Case "01"
                    RTBText.Text = RTBText.Text & "1"
                Case "02"
                    RTBText.Text = RTBText.Text & "2"
                Case "03"
                    RTBText.Text = RTBText.Text & "3"
                Case "04"
                    RTBText.Text = RTBText.Text & "4"
                Case "05"
                    RTBText.Text = RTBText.Text & "5"
                Case "06"
                    RTBText.Text = RTBText.Text & "6"
                Case "07"
                    RTBText.Text = RTBText.Text & "7"
                Case "08"
                    RTBText.Text = RTBText.Text & "8"
                Case "09"
                    RTBText.Text = RTBText.Text & "9"
                Case "0A"
                    RTBText.Text = RTBText.Text & "$"
                Case "0B"
                    RTBText.Text = RTBText.Text & "-"
                Case "0C"
                    RTBText.Text = RTBText.Text & "="
                Case "0D"
                    RTBText.Text = RTBText.Text & "<"
                Case "0E"
                    RTBText.Text = RTBText.Text & "<"

                    'Spezial 2
                Case "."
                    RTBHex.Text = RTBHex.Text & "FF "
                Case "FF"
                    RTBText.Text = RTBText.Text & " "

                Case Else
                    RTBText.Text = RTBText.Text & " "
                    Me.Label10.Visible = True
                    'DIE MAIN CODING LINE

            End Select
            If RTBText.TextLength = Anzahl Then
                RTBText.Text = RTBText.Text & vbCrLf
                Anzahl = Anzahl + 24
            End If
            RTBText.Text.Replace(vbCrLf, "")
            If ihex < Me.RTBText.TextLength - 1 Then RTBText.Text = RTBText.Text
            ihex2 += 16
            ihex2 = ihex2 And &HFF
        Next
        RTBText.MaxLength = 504
        If OpenFileDialog1.FileName.Contains("menutext.bin") Then
            MsgBox(Chr(34) & "menutext.bin" & Chr(34) & "successfully loaded.", MsgBoxStyle.Information)
        Else
            If MsgBox("File successfully loaded, but it's not " & Chr(34) & "menutext.bin" & Chr(34) & ". Load again?", MsgBoxStyle.Question Or MsgBoxStyle.YesNo) = MsgBoxResult.No Then
                GoTo Restart
            End If
        End If
        Button5.Enabled = True
        CheckBox1.Enabled = True
        Exit Sub
ErrorExit:
        Me.RTBText.Text = ""
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
    End Sub

    Private Sub RTB1_TextChanged_1(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If Me.RTBHex.Text = "" Then
            Button5.Enabled = False
        Else
            Button5.Enabled = True
        End If
        Dim pos As Integer = RTBText.SelectionStart
        RTBText.Text = RTBText.Text.ToUpper
        RTBText.SelectionStart = pos
    End Sub

    Private Sub RTB2_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RTBHex.TextChanged
        Dim pos As Integer = RTBHex.SelectionStart
        RTBHex.Text = RTBHex.Text.ToUpper
        RTBHex.SelectionStart = pos
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Form5.Visible = True
        Me.Visible = False
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        If Not RTBText.TextLength = 504 Then
            MsgBox("Can't save. The text length must be excactly 504 characters.", MsgBoxStyle.Critical)
            Exit Sub
        End If
        If CheckBox1.Checked = True Then
            My.Computer.FileSystem.WriteAllBytes(Datei & ".bak", ByteDim, False)
        End If
        Dim HexText As String() = RTBHex.Text.Split(" ") 'Split the text by spaces
        Dim bytes(HexText.Length - 2) As Byte 'give the output array the same number of elements as the text
        If Datei = "" Then
            SaveFileDialog1.ShowDialog()
            If SaveFileDialog1.FileName = "" Then
                Exit Sub
            End If
            GoTo continuex
        End If
        'If MsgBox("Do you want to save it over your old menutext.bin [Yes] or in a separat file [No] (The original one will stay untouched)?", MsgBoxStyle.Information Or MsgBoxStyle.YesNoCancel) = MsgBoxResult.Yes Then

        For index As Integer = 0 To HexText.Length - 2
            bytes(index) = "&H" & HexText(index) 'convert to byte
        Next
        Datei = OpenFileDialog1.FileName
        My.Computer.FileSystem.WriteAllBytes(Datei, bytes, False)

        'File.WriteAllText(OpenFileDialog1.FileName, "")
        MsgBox("File saved! (" & OpenFileDialog1.FileName & ")", MsgBoxStyle.Information)
        Exit Sub

continuex:
        For index As Integer = 0 To HexText.Length - 2
            bytes(index) = "&H" & HexText(index) 'convert to byte
        Next
        Datei = SaveFileDialog1.FileName
        My.Computer.FileSystem.WriteAllBytes(Datei, bytes, False)

        'File.WriteAllText(OpenFileDialog1.FileName, "")
        MsgBox("File saved! (" & SaveFileDialog1.FileName & ")", MsgBoxStyle.Information)
        Exit Sub
        'ElseIf MsgBoxResult.No Then
        'SaveFileDialog1.ShowDialog()
        'If SaveFileDialog1.FileName = "" Then
        'Exit Sub
        'End If
        'File.WriteAllText(SaveFileDialog1.FileName, "")
        'Exit Sub
        'Else
        'Exit Sub
        'End If

        'Dim savestring As String
        'savestring = RTBHex.Text
        'savestring = savestring.Replace(" ", "")
        'MsgBox(savestring)
        'Exit Sub
        'SaveFileDialog1.ShowDialog()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        RTBHex.Text = ""
        Dim text1optimzed As String
        text1optimzed = RTBText.Text
        Dim ihex As Integer
        Dim ihex2 As Integer

        For ihex = 0 To text1optimzed.Length - 1 Step 1
            Select Case (text1optimzed.Substring(ihex, 1))
                Case "A"
                    RTBHex.Text = RTBHex.Text & "11 "
                Case "B"
                    RTBHex.Text = RTBHex.Text & "12 "
                Case "C"
                    RTBHex.Text = RTBHex.Text & "13 "
                Case "D"
                    RTBHex.Text = RTBHex.Text & "14 "
                Case "E"
                    RTBHex.Text = RTBHex.Text & "15 "
                Case "F"
                    RTBHex.Text = RTBHex.Text & "16 "
                Case "G"
                    RTBHex.Text = RTBHex.Text & "17 "
                Case "H"
                    RTBHex.Text = RTBHex.Text & "18 "
                Case "I"
                    RTBHex.Text = RTBHex.Text & "19 "
                Case "J"
                    RTBHex.Text = RTBHex.Text & "1A "
                Case "K"
                    RTBHex.Text = RTBHex.Text & "1B "
                Case "L"
                    RTBHex.Text = RTBHex.Text & "1C "
                Case "M"
                    RTBHex.Text = RTBHex.Text & "1D "
                Case "N"
                    RTBHex.Text = RTBHex.Text & "1E "
                Case "O"
                    RTBHex.Text = RTBHex.Text & "1F "
                Case "P"
                    RTBHex.Text = RTBHex.Text & "20 "
                Case "Q"
                    RTBHex.Text = RTBHex.Text & "21 "
                Case "R"
                    RTBHex.Text = RTBHex.Text & "22 "
                Case "S"
                    RTBHex.Text = RTBHex.Text & "23 "
                Case "T"
                    RTBHex.Text = RTBHex.Text & "24 "
                Case "U"
                    RTBHex.Text = RTBHex.Text & "25 "
                Case "V"
                    RTBHex.Text = RTBHex.Text & "26 "
                Case "W"
                    RTBHex.Text = RTBHex.Text & "27 "
                Case "X"
                    RTBHex.Text = RTBHex.Text & "28 "
                Case "Y"
                    RTBHex.Text = RTBHex.Text & "0F "
                Case "Z"
                    RTBHex.Text = RTBHex.Text & "10 "

                    'Spezial 1

                Case "0"
                    RTBHex.Text = RTBHex.Text & "00 "
                Case "1"
                    RTBHex.Text = RTBHex.Text & "01 "
                Case "2"
                    RTBHex.Text = RTBHex.Text & "02 "
                Case "3"
                    RTBHex.Text = RTBHex.Text & "03 "
                Case "4"
                    RTBHex.Text = RTBHex.Text & "04 "
                Case "5"
                    RTBHex.Text = RTBHex.Text & "05 "
                Case "6"
                    RTBHex.Text = RTBHex.Text & "06 "
                Case "7"
                    RTBHex.Text = RTBHex.Text & "07 "
                Case "8"
                    RTBHex.Text = RTBHex.Text & "08 "
                Case "9"
                    RTBHex.Text = RTBHex.Text & "09 "
                Case "$"
                    RTBHex.Text = RTBHex.Text & "0A "
                Case "-"
                    RTBHex.Text = RTBHex.Text & "0B "
                Case "="
                    RTBHex.Text = RTBHex.Text & "0C "
                Case "<"
                    RTBHex.Text = RTBHex.Text & "0D "
                Case "<"
                    RTBHex.Text = RTBHex.Text & "0E "

                    'Spezial 2

                Case " "
                    RTBHex.Text = RTBHex.Text & "FF "


                Case Else
                    RTBHex.Text = RTBHex.Text & "FF "
                    Me.Label10.Visible = True
                    'DIE MAIN CODING LINE

            End Select
            RTBHex.Text.Replace(vbCrLf, "")
            If ihex < Me.RTBHex.TextLength - 1 Then RTBHex.Text = RTBHex.Text
            ihex2 += 16
            ihex2 = ihex2 And &HFF

        Next
        Exit Sub


ErrorExit:
        Me.RTBText.Text = ""
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
        Exit Sub
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        RTBText.Text = ""
        Dim text1optimzed As String
        text1optimzed = RTBHex.Text
        text1optimzed = text1optimzed.Replace(" ", "")
        Dim ihex As Integer
        Dim ihex2 As Integer
        For ihex = 0 To text1optimzed.Length - 2 Step 2
            Select Case (text1optimzed.Substring(ihex, 2))
                Case "11"
                    RTBText.Text = RTBText.Text & "A"
                Case "12"
                    RTBText.Text = RTBText.Text & "B"
                Case "13"
                    RTBText.Text = RTBText.Text & "C"
                Case "14"
                    RTBText.Text = RTBText.Text & "D"
                Case "15"
                    RTBText.Text = RTBText.Text & "E"
                Case "16"
                    RTBText.Text = RTBText.Text & "F"
                Case "17"
                    RTBText.Text = RTBText.Text & "G"
                Case "18"
                    RTBText.Text = RTBText.Text & "H"
                Case "19"
                    RTBText.Text = RTBText.Text & "I"
                Case "1A"
                    RTBText.Text = RTBText.Text & "J"
                Case "1B"
                    RTBText.Text = RTBText.Text & "K"
                Case "1C"
                    RTBText.Text = RTBText.Text & "L"
                Case "1D"
                    RTBText.Text = RTBText.Text & "M"
                Case "1E"
                    RTBText.Text = RTBText.Text & "N"
                Case "1F"
                    RTBText.Text = RTBText.Text & "O"
                Case "20"
                    RTBText.Text = RTBText.Text & "P"
                Case "21"
                    RTBText.Text = RTBText.Text & "Q"
                Case "22"
                    RTBText.Text = RTBText.Text & "R"
                Case "23"
                    RTBText.Text = RTBText.Text & "S"
                Case "24"
                    RTBText.Text = RTBText.Text & "T"
                Case "25"
                    RTBText.Text = RTBText.Text & "U"
                Case "26"
                    RTBText.Text = RTBText.Text & "V"
                Case "27"
                    RTBText.Text = RTBText.Text & "W"
                Case "28"
                    RTBText.Text = RTBText.Text & "X"
                Case "0F"
                    RTBText.Text = RTBText.Text & "Y"
                Case "10"
                    RTBText.Text = RTBText.Text & "Z"

                    'Spezial 1

                Case "00"
                    RTBText.Text = RTBText.Text & "0"
                Case "01"
                    RTBText.Text = RTBText.Text & "1"
                Case "02"
                    RTBText.Text = RTBText.Text & "2"
                Case "03"
                    RTBText.Text = RTBText.Text & "3"
                Case "04"
                    RTBText.Text = RTBText.Text & "4"
                Case "05"
                    RTBText.Text = RTBText.Text & "5"
                Case "06"
                    RTBText.Text = RTBText.Text & "6"
                Case "07"
                    RTBText.Text = RTBText.Text & "7"
                Case "08"
                    RTBText.Text = RTBText.Text & "8"
                Case "09"
                    RTBText.Text = RTBText.Text & "9"
                Case "0A"
                    RTBText.Text = RTBText.Text & "$"
                Case "0B"
                    RTBText.Text = RTBText.Text & "-"
                Case "0C"
                    RTBText.Text = RTBText.Text & "="
                Case "0D"
                    RTBText.Text = RTBText.Text & "<"
                Case "0E"
                    RTBText.Text = RTBText.Text & "<"

                    'Spezial 2

                Case "FF"
                    RTBText.Text = RTBText.Text & " "

                Case Else
                    RTBText.Text = RTBText.Text & " "
                    Me.Label10.Visible = True
                    'DIE MAIN CODING LINE

            End Select
            RTBText.Text.Replace(vbCrLf, "")
            If ihex < Me.RTBText.TextLength - 1 Then RTBText.Text = RTBText.Text
            ihex2 += 16
            ihex2 = ihex2 And &HFF
        Next
    End Sub

    Private Sub Button2_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        TBText.Text = "0"
        RTBHex.Text = ""
        Button5.Enabled = True
        Dim text1optimzed As String
        text1optimzed = RTBText.Text.Replace(".", " ")
        Dim ihex As Integer
        Dim ihex2 As Integer

        For ihex = 0 To text1optimzed.Length - 1 Step 1
            Select Case (text1optimzed.Substring(ihex, 1))
                Case "A"
                    RTBHex.Text = RTBHex.Text & "11 "
                Case "B"
                    RTBHex.Text = RTBHex.Text & "12 "
                Case "C"
                    RTBHex.Text = RTBHex.Text & "13 "
                Case "D"
                    RTBHex.Text = RTBHex.Text & "14 "
                Case "E"
                    RTBHex.Text = RTBHex.Text & "15 "
                Case "F"
                    RTBHex.Text = RTBHex.Text & "16 "
                Case "G"
                    RTBHex.Text = RTBHex.Text & "17 "
                Case "H"
                    RTBHex.Text = RTBHex.Text & "18 "
                Case "I"
                    RTBHex.Text = RTBHex.Text & "19 "
                Case "J"
                    RTBHex.Text = RTBHex.Text & "1A "
                Case "K"
                    RTBHex.Text = RTBHex.Text & "1B "
                Case "L"
                    RTBHex.Text = RTBHex.Text & "1C "
                Case "M"
                    RTBHex.Text = RTBHex.Text & "1D "
                Case "N"
                    RTBHex.Text = RTBHex.Text & "1E "
                Case "O"
                    RTBHex.Text = RTBHex.Text & "1F "
                Case "P"
                    RTBHex.Text = RTBHex.Text & "20 "
                Case "Q"
                    RTBHex.Text = RTBHex.Text & "21 "
                Case "R"
                    RTBHex.Text = RTBHex.Text & "22 "
                Case "S"
                    RTBHex.Text = RTBHex.Text & "23 "
                Case "T"
                    RTBHex.Text = RTBHex.Text & "24 "
                Case "U"
                    RTBHex.Text = RTBHex.Text & "25 "
                Case "V"
                    RTBHex.Text = RTBHex.Text & "26 "
                Case "W"
                    RTBHex.Text = RTBHex.Text & "27 "
                Case "X"
                    RTBHex.Text = RTBHex.Text & "28 "
                Case "Y"
                    RTBHex.Text = RTBHex.Text & "0F "
                Case "Z"
                    RTBHex.Text = RTBHex.Text & "10 "

                    'Spezial 1

                Case "0"
                    RTBHex.Text = RTBHex.Text & "00 "
                Case "1"
                    RTBHex.Text = RTBHex.Text & "01 "
                Case "2"
                    RTBHex.Text = RTBHex.Text & "02 "
                Case "3"
                    RTBHex.Text = RTBHex.Text & "03 "
                Case "4"
                    RTBHex.Text = RTBHex.Text & "04 "
                Case "5"
                    RTBHex.Text = RTBHex.Text & "05 "
                Case "6"
                    RTBHex.Text = RTBHex.Text & "06 "
                Case "7"
                    RTBHex.Text = RTBHex.Text & "07 "
                Case "8"
                    RTBHex.Text = RTBHex.Text & "08 "
                Case "9"
                    RTBHex.Text = RTBHex.Text & "09 "
                Case "$"
                    RTBHex.Text = RTBHex.Text & "0A "
                Case "-"
                    RTBHex.Text = RTBHex.Text & "0B "
                Case "="
                    RTBHex.Text = RTBHex.Text & "0C "
                Case "<"
                    RTBHex.Text = RTBHex.Text & "0D "
                Case "<"
                    RTBHex.Text = RTBHex.Text & "0E "

                    'Spezial 2
                Case "."
                    RTBHex.Text = RTBHex.Text & "FF "
                Case " "
                    RTBHex.Text = RTBHex.Text & "FF "


                Case Else
                    RTBHex.Text = RTBHex.Text & "FF "
                    Me.Label10.Visible = True
                    'DIE MAIN CODING LINE

            End Select
            RTBHex.Text.Replace(vbCrLf, "")
            If ihex < Me.RTBHex.TextLength - 1 Then RTBHex.Text = RTBHex.Text
            ihex2 += 16
            ihex2 = ihex2 And &HFF

        Next
        Button5.Enabled = True
        Exit Sub


ErrorExit:
        Me.RTBText.Text = ""
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Critical, "Error")
        Exit Sub
    End Sub

    Private Sub RRTBText_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If Me.RTBText.Text = "" Then
            Button2.Enabled = False
        Else
            Button2.Enabled = True
        End If
        Dim pos As Integer = RTBText.SelectionStart
        RTBText.Text = RTBText.Text.ToUpper()
        RTBText.SelectionStart = pos
        Exit Sub
        laenge += 1
        If laenge = 25 Then
            RTBText.Text = RTBText.Text & vbCrLf
            'SendKeys.SendWait(Chr(13))
            laenge = 0
        End If
    End Sub

    Private Sub RRTBText_TextChanged_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RTBText.TextChanged
        TBText.Text = "1"
        Button5.Enabled = False
        Dim pos As Integer = RTBText.SelectionStart
        If RTBText.TextLength = 0 Then
            Me.Button2.Enabled = False
        End If
        If RTBText.TextLength >= 1 Then
            Me.Button2.Enabled = True
        End If
        RTBText.Text = RTBText.Text.ToUpper
        RTBText.Text = RTBText.Text.Replace(" ", ".")
        RTBText.SelectionStart = pos
    End Sub

    Private Sub Form9_Deactivate(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Deactivate
        If Form5.CheckBox1.Checked = True Then
            Me.Opacity = 0.9F
        End If
    End Sub

    Private Sub Form9_Activated(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Activated
        Me.Opacity = 1.0F
    End Sub
End Class