Public Class Dialog3

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click, Button6.Click
        Dialog2.Show()
        Dialog2.RadioButton1.Checked = False
        Dialog2.RadioButton3.Checked = True
        Dialog2.RadioButton2.Checked = False
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dialog2.Show()
        Dialog2.RadioButton1.Checked = True
        Dialog2.RadioButton3.Checked = False
        Dialog2.RadioButton2.Checked = False
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click, Button7.Click
        Dialog2.Show()
        Dialog2.RadioButton1.Checked = False
        Dialog2.RadioButton3.Checked = False
        Dialog2.RadioButton2.Checked = True
    End Sub

    Private Sub OK_Button_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK_Button.Click
        Me.Close()
    End Sub
End Class
