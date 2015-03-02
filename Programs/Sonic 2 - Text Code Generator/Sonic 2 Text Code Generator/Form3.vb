Public Class Form3
    Dim FadeOut As Integer

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Form1.Show()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Form2.Show()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dialog4.Show()
    End Sub


    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
        Dialog3.Show()
    End Sub

    Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button7.Click
        Me.Close()

        'Timer1.Enabled = True (What the fuck was I smoking when I made this?)
    End Sub

    Private Sub Button8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button8.Click
        Dialog2.Show()
    End Sub

    Private Sub Form5_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        'Timer1.Enabled = True
        'If FadeOut = 1 Then
        'e.Cancel = False
        'Else
        'e.Cancel = True
        'End If
        'Exit Sub
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        If Me.Opacity = 0.0F Then
            Timer1.Enabled = False
            FadeOut = 1
            Me.Close()
        End If
        Me.Opacity -= 0.015F
        Form1.Opacity -= 0.035F
        Form2.Opacity -= 0.035F
        Dialog2.Opacity -= 0.035F
        Dialog3.Opacity -= 0.035F
        Dialog4.Opacity -= 0.035F
    End Sub
End Class