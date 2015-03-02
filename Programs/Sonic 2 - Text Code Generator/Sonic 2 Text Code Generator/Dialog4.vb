Imports System.Windows.Forms

Public Class Dialog4

    Private Sub OK_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.DialogResult = System.Windows.Forms.DialogResult.OK
        Me.Close()
    End Sub

    Private Sub Cancel_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.Close()
    End Sub

    Private Sub ListBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBox1.SelectedIndexChanged
        TextBox1.Font = New Font("Courier New", 12, FontStyle.Regular)
        TextBox1.ForeColor = SystemColors.WindowText

        Select Case (ListBox1.SelectedIndex)
            Case 0
                TextBox1.Text = "byte_B55C:"
            Case 1
                TextBox1.Text = "byte_BCE9:"
            Case 2
                TextBox1.Text = "byte_97CA:"
            Case 3
                TextBox1.Text = "byte_874A:"
            Case 4
                TextBox1.Text = "CopyrightText:"
        End Select
    End Sub

    Private Sub OK_Button_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK_Button.Click
        Me.Close()
    End Sub
End Class
