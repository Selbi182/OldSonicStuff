Imports System.IO
Public Class Dialog3

    Private Sub OK_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK_Button.Click
        Me.Close()
    End Sub

    Private Sub Dialog3_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        If CheckBox1.Checked = True Then
            File.WriteAllText("S1TCG settings.txt", "1")
        Else
            File.WriteAllText("S1TCG settings.txt", "0")
        End If
    End Sub

    Private Sub Dialog3_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim TCCHelp_string As String
        If Not File.Exists("S1TCG settings.txt") Then
            File.WriteAllText("S1TCG settings.txt", "0")
        End If
        TCCHelp_string = File.ReadAllText("S1TCG settings.txt")
        If TCCHelp_string = "1" Then
            CheckBox1.Checked = True
        End If
    End Sub
    Private Sub Dialog3_Deactivate(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Deactivate
        If Form5.CheckBox1.Checked = True Then
            Me.Opacity = 0.9F
        End If
    End Sub

    Private Sub Dialog3_Activated(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Activated
        Me.Opacity = 1.0F
    End Sub
End Class
