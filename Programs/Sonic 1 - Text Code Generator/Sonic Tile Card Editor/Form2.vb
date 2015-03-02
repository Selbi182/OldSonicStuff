Public Class Form2

    Private Sub Form2_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        Form1.Visible = True
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim x As Long
        x = Me.TextBox2.Text.IndexOf(Me.TextBox1.Text)
        'MsgBox(x)
        If x = -1 Then
            MsgBox("Text nicht gefunden" & vbCrLf & Me.TextBox1.Text, MsgBoxStyle.Critical)
            Exit Sub

        End If
        Me.TextBox2.Select()
        Me.TextBox2.SelectAll()
        'MsgBox(1)
        Me.TextBox2.SelectionStart = x
        Me.TextBox2.SelectionLength = Me.TextBox1.TextLength

    End Sub
End Class