Public Class Dialog2
    Private Sub OK_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK_Button.Click
        Clipboard.Clear()
        Clipboard.SetText(TextBox1.Text)
        TextBox1.Focus()
        TextBox1.SelectAll()
    End Sub

    Private Sub Cancel_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel_Button.Click
        Me.Close()
    End Sub

    Private Sub TextBox1_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox1.KeyDown
        If e.Control = True And Chr(e.KeyCode) = "A" Then
            TextBox1.SelectAll()
        End If
    End Sub

    Private Sub Dialog2_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        Dialog3.Enabled = True
    End Sub

    Private Sub RadioButton1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton1.CheckedChanged
        Me.TextBox1.Text = My.Resources.Setup
        Me.Text = "S2TCG - TitleCards_Setup.asm"
    End Sub

    Private Sub RadioButton3_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton3.CheckedChanged
        Me.TextBox1.Text = My.Resources.Mappings
        Me.Text = "S2TCG - TitleCards_Maps.asm"
    End Sub

    Private Sub RadioButton2_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton2.CheckedChanged
        Me.TextBox1.Text = My.Resources.EOLMappings
        Me.Text = "S2TCG - EOL_Mappings.asm"
    End Sub

    Private Sub Dialog2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.TextBox1.Text = My.Resources.Mappings
        Me.Text = "S2TCG - TitleCards_Maps.asm"
    End Sub
End Class
