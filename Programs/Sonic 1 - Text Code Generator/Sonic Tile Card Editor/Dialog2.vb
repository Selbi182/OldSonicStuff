Imports System.Windows.Forms

Public Class Dialog2

    Private Sub OK_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK_Button.Click
        Me.Close()
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        Dim url As String
        url = "http://sonicresearch.org/"
        Try
            Process.Start(url)
        Catch ex As Exception
            MsgBox("Error: " & Err.Description & vbCrLf & "URL: " & url, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub LinkLabel2_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs)
        Dim url As String
        url = "mailto:SelbiX@web.de"
        Try
            Process.Start(url)
        Catch ex As Exception
            MsgBox("Error: " & Err.Description & vbCrLf & "URL: " & url, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub LinkLabel3_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel3.LinkClicked
        Dim url As String
        url = "http://sonicresearch.org/forums/index.php?showuser=469"
        Try
            Process.Start(url)
        Catch ex As Exception
            MsgBox("Error: " & Err.Description & vbCrLf & "URL: " & url, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub LinkLabel4_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel4.LinkClicked
        Dim url As String
        url = "mailto:Shadow93X@googlemail.de"
        Try
            Process.Start(url)
        Catch ex As Exception
            MsgBox("Error: " & Err.Description & vbCrLf & "URL: " & url, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub LinkLabel5_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel5.LinkClicked
        Dim url As String
        url = "http://info.sonicretro.org/SCHG:Sonic_the_Hedgehog/Text_Editing"
        Try
            Process.Start(url)
        Catch ex As Exception
            MsgBox("Error: " & Err.Description & vbCrLf & "URL: " & url, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub LinkLabel2_LinkClicked_1(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel2.LinkClicked
        Dim url As String
        url = "http://forum.vb-paradise.de/"
        Try
            Process.Start(url)
        Catch ex As Exception
            MsgBox("Error: " & Err.Description & vbCrLf & "URL: " & url, MsgBoxStyle.Critical)
        End Try
    End Sub
End Class
