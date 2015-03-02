Public Class Dialog4
    Private Sub OK_Button_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK_Button.Click
        Me.Close()
    End Sub

    Private Sub Dialog4_Deactivate(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Deactivate
        If Form5.CheckBox1.Checked = True Then
            Me.Opacity = 0.9F
        End If
    End Sub

    Private Sub Dialog4_Activated(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Activated
        Me.Opacity = 1.0F
    End Sub
End Class
