Public Class Form8

    Private Sub Button1_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Me.TextBox1.Text = "" Then
            MsgBox("You must insert Text, before you can convert it! *rolleyes*", MsgBoxStyle.Critical, "Error")
            TextBox1.Focus()
            Exit Sub
        End If
        TextBox1.Text = TextBox1.Text.ToUpper
        Me.Label8.Visible = True
        Me.ProgressBar1.Visible = True
        Me.ProgressBar1.Value = 0
        Me.Label10.Visible = False
        Me.Label8.Text = "Generating..."
        Timer1.Enabled = True
    End Sub

    Private Sub TextBox1_TextChanged_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        Dim pos As Integer = TextBox1.SelectionStart
        If Me.TextBox1.TextLength = 0 Then
            Me.Button1.Enabled = False
        End If
        If Me.TextBox1.TextLength >= 1 Then
            Me.Button1.Enabled = True
        End If
        TextBox1.Text = TextBox1.Text.ToUpper
        TextBox1.SelectionStart = pos
    End Sub

    Private Sub Timer1_Tick_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        On Error GoTo ErrorExit
        Timer1.Enabled = False
        Me.Label8.Text = "Done!"
        Me.TextBox1.Enabled = True
        Me.Label5.Visible = True
        Me.TextBox2.Text = ""

        'DIE MAIN CODING LINE
        If Me.RadioButton2.Checked = True Then
            GoTo HexView
        Else
            GoTo ListView
        End If

ListView:
        Dim i As Integer
        Dim i2 As Integer
        For i = 0 To Me.TextBox1.TextLength - 1 Step 1
            Select Case (Me.TextBox1.Text.Substring(i, 1))
                Case "A"
                    TextBox2.Text = TextBox2.Text & "11 = A"
                Case "B"
                    TextBox2.Text = TextBox2.Text & "12 = B"
                Case "C"
                    TextBox2.Text = TextBox2.Text & "13 = C"
                Case "D"
                    TextBox2.Text = TextBox2.Text & "14 = D"
                Case "E"
                    TextBox2.Text = TextBox2.Text & "15 = E"
                Case "F"
                    TextBox2.Text = TextBox2.Text & "16 = F"
                Case "G"
                    TextBox2.Text = TextBox2.Text & "17 = G"
                Case "H"
                    TextBox2.Text = TextBox2.Text & "18 = H"
                Case "I"
                    TextBox2.Text = TextBox2.Text & "19 = I"
                Case "J"
                    TextBox2.Text = TextBox2.Text & "1A = J"
                Case "K"
                    TextBox2.Text = TextBox2.Text & "1B = K"
                Case "L"
                    TextBox2.Text = TextBox2.Text & "1C = L"
                Case "M"
                    TextBox2.Text = TextBox2.Text & "1D = M"
                Case "N"
                    TextBox2.Text = TextBox2.Text & "1E = N"
                Case "O"
                    TextBox2.Text = TextBox2.Text & "1F = O"
                Case "P"
                    TextBox2.Text = TextBox2.Text & "20 = P"
                Case "Q"
                    TextBox2.Text = TextBox2.Text & "21 = Q"
                Case "R"
                    TextBox2.Text = TextBox2.Text & "22 = R"
                Case "S"
                    TextBox2.Text = TextBox2.Text & "23 = S"
                Case "T"
                    TextBox2.Text = TextBox2.Text & "24 = T"
                Case "U"
                    TextBox2.Text = TextBox2.Text & "25 = U"
                Case "V"
                    TextBox2.Text = TextBox2.Text & "26 = V"
                Case "W"
                    TextBox2.Text = TextBox2.Text & "27 = W"
                Case "X"
                    TextBox2.Text = TextBox2.Text & "28 = X"
                Case "Y"
                    TextBox2.Text = TextBox2.Text & "0F = Y"
                Case "Z"
                    TextBox2.Text = TextBox2.Text & "10 = Z"

                    'Spezial 1

                Case "0"
                    TextBox2.Text = TextBox2.Text & "00 = 0"
                Case "1"
                    TextBox2.Text = TextBox2.Text & "01 = 1"
                Case "2"
                    TextBox2.Text = TextBox2.Text & "02 = 2"
                Case "3"
                    TextBox2.Text = TextBox2.Text & "03 = 3"
                Case "4"
                    TextBox2.Text = TextBox2.Text & "04 = 4"
                Case "5"
                    TextBox2.Text = TextBox2.Text & "05 = 5"
                Case "6"
                    TextBox2.Text = TextBox2.Text & "06 = 6"
                Case "7"
                    TextBox2.Text = TextBox2.Text & "07 = 7"
                Case "8"
                    TextBox2.Text = TextBox2.Text & "08 = 8"
                Case "9"
                    TextBox2.Text = TextBox2.Text & "09 = 9"
                Case "$"
                    TextBox2.Text = TextBox2.Text & "0A = $"
                Case "-"
                    TextBox2.Text = TextBox2.Text & "0B = -"
                Case "="
                    TextBox2.Text = TextBox2.Text & "0C = ="
                Case "<"
                    TextBox2.Text = TextBox2.Text & "0D = <-"
                Case "<-"
                    TextBox2.Text = TextBox2.Text & "0E = <-"

                    'Spezial 2

                Case " "
                    TextBox2.Text = TextBox2.Text & "FF = Space"

                Case Else
                    TextBox2.Text = TextBox2.Text & "FF = Space"
                    Me.Label10.Visible = True
                    'DIE MAIN CODING LINE

            End Select
            TextBox2.Text.Replace(vbCrLf, "")
            If i < Me.TextBox1.TextLength - 1 Then TextBox2.Text = TextBox2.Text & vbCrLf
            i2 += 16
            i2 = i2 And &HFF

        Next
        Exit Sub

HexView:
        Dim ihex As Integer
        Dim ihex2 As Integer
        For ihex = 0 To Me.TextBox1.TextLength - 1 Step 1
            Select Case (Me.TextBox1.Text.Substring(ihex, 1))
                Case "A"
                    TextBox2.Text = TextBox2.Text & "11 "
                Case "B"
                    TextBox2.Text = TextBox2.Text & "12 "
                Case "C"
                    TextBox2.Text = TextBox2.Text & "13 "
                Case "D"
                    TextBox2.Text = TextBox2.Text & "14 "
                Case "E"
                    TextBox2.Text = TextBox2.Text & "15 "
                Case "F"
                    TextBox2.Text = TextBox2.Text & "16 "
                Case "G"
                    TextBox2.Text = TextBox2.Text & "17 "
                Case "H"
                    TextBox2.Text = TextBox2.Text & "18 "
                Case "I"
                    TextBox2.Text = TextBox2.Text & "19 "
                Case "J"
                    TextBox2.Text = TextBox2.Text & "1A "
                Case "K"
                    TextBox2.Text = TextBox2.Text & "1B "
                Case "L"
                    TextBox2.Text = TextBox2.Text & "1C "
                Case "M"
                    TextBox2.Text = TextBox2.Text & "1D "
                Case "N"
                    TextBox2.Text = TextBox2.Text & "1E "
                Case "O"
                    TextBox2.Text = TextBox2.Text & "1F "
                Case "P"
                    TextBox2.Text = TextBox2.Text & "20 "
                Case "Q"
                    TextBox2.Text = TextBox2.Text & "21 "
                Case "R"
                    TextBox2.Text = TextBox2.Text & "22 "
                Case "S"
                    TextBox2.Text = TextBox2.Text & "23 "
                Case "T"
                    TextBox2.Text = TextBox2.Text & "24 "
                Case "U"
                    TextBox2.Text = TextBox2.Text & "25 "
                Case "V"
                    TextBox2.Text = TextBox2.Text & "26 "
                Case "W"
                    TextBox2.Text = TextBox2.Text & "27 "
                Case "X"
                    TextBox2.Text = TextBox2.Text & "28 "
                Case "Y"
                    TextBox2.Text = TextBox2.Text & "0F "
                Case "Z"
                    TextBox2.Text = TextBox2.Text & "10 "

                    'Spezial 1

                Case "0"
                    TextBox2.Text = TextBox2.Text & "00 "
                Case "1"
                    TextBox2.Text = TextBox2.Text & "01 "
                Case "2"
                    TextBox2.Text = TextBox2.Text & "02 "
                Case "3"
                    TextBox2.Text = TextBox2.Text & "03 "
                Case "4"
                    TextBox2.Text = TextBox2.Text & "04 "
                Case "5"
                    TextBox2.Text = TextBox2.Text & "05 "
                Case "6"
                    TextBox2.Text = TextBox2.Text & "06 "
                Case "7"
                    TextBox2.Text = TextBox2.Text & "07 "
                Case "8"
                    TextBox2.Text = TextBox2.Text & "08 "
                Case "9"
                    TextBox2.Text = TextBox2.Text & "09 "
                Case "$"
                    TextBox2.Text = TextBox2.Text & "0A "
                Case "-"
                    TextBox2.Text = TextBox2.Text & "0B "
                Case "="
                    TextBox2.Text = TextBox2.Text & "0C "
                Case "<"
                    TextBox2.Text = TextBox2.Text & "0D "
                Case "<-"
                    TextBox2.Text = TextBox2.Text & "0E "

                    'Spezial 2

                Case " "
                    TextBox2.Text = TextBox2.Text & "FF "

                Case Else
                    TextBox2.Text = TextBox2.Text & "FF "
                    Me.Label10.Visible = True
                    'DIE MAIN CODING LINE

            End Select
            TextBox2.Text.Replace(vbCrLf, "")
            If ihex < Me.TextBox1.TextLength - 1 Then TextBox2.Text = TextBox2.Text
            ihex2 += 16
            ihex2 = ihex2 And &HFF

        Next
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

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        TextBox1.Text = "0123456789$-=<<ABCDEFGHIJKLMNOPQRSTUVWXYZ "
    End Sub

    Private Sub Form8_Deactivate(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Deactivate
        If Form5.CheckBox1.Checked = True Then
            Me.Opacity = 0.9F
        End If
    End Sub

    Private Sub Form8_Activated(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Activated
        Me.Opacity = 1.0F
    End Sub
End Class