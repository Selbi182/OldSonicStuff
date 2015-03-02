Public Class Form10

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        TextBox1.Text = TextBox1.Text & Space(48 - TextBox1.TextLength)
        TextBox3.Text = TextBox3.Text & Space(16 - TextBox3.TextLength)
        TextBox2.Text = "Date:		dc.b '" & TextBox3.Text & "' ; Release date" & vbCrLf & _
                "Title_Local:	dc.b '" & TextBox1.Text & "' ; Domestic name" & vbCrLf & _
                "Title_Int:	dc.b '" & TextBox1.Text & "' ; International name"
        Exit Sub
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Clipboard.Clear()
        Clipboard.SetText(Me.TextBox2.Text)
        Me.TextBox2.Focus()
        Me.TextBox2.SelectAll()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Me.Close()
    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        If CheckBox1.Checked = True Then
            Dim pos As Integer = TextBox1.SelectionStart
            If Me.TextBox1.TextLength = 0 Then
                Me.Button1.Enabled = False
            End If
            If Me.TextBox1.TextLength >= 1 Then
                Me.Button1.Enabled = True
            End If
            TextBox1.Text = TextBox1.Text.ToUpper
            TextBox1.SelectionStart = pos
        End If
    End Sub

    Private Sub TextBox3_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox3.TextChanged
        If CheckBox1.Checked = True Then
            Dim pos As Integer = TextBox1.SelectionStart
            If Me.TextBox3.TextLength = 0 Then
                Me.Button1.Enabled = False
            End If
            If Me.TextBox3.TextLength >= 1 Then
                Me.Button1.Enabled = True
            End If
            TextBox3.Text = TextBox3.Text.ToUpper
            TextBox3.SelectionStart = pos
        End If
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If Me.CheckBox1.Checked = True Then
            Dim pos1 As Integer = TextBox1.SelectionStart
            Dim pos3 As Integer = TextBox1.SelectionStart
            TextBox1.Text = TextBox1.Text.ToUpper
            TextBox1.SelectionStart = pos1
            TextBox3.Text = TextBox3.Text.ToUpper
            TextBox3.SelectionStart = pos3
        End If
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        TextBox1.Text = ""
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        TextBox3.Text = ""
    End Sub

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
        TextBox1.Text = "SONIC THE               HEDGEHOG                "
        TextBox2.Text = ""
        TextBox3.Text = "(C)SEGA 1991.APR"
        CheckBox1.Checked = False
    End Sub

    Private Sub Form10_Deactivate(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Deactivate
        If Form5.CheckBox1.Checked = True Then
            Me.Opacity = 0.9F
        End If
    End Sub

    Private Sub Form10_Activated(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Activated
        Me.Opacity = 1.0F
    End Sub
End Class