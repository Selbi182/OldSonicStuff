Imports System.IO
Public Class Form1

    Dim f As New Form2
    Dim z As String
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Me.Label5.Visible = True
        f.Show()
        Me.Visible = False
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If Me.CheckBox1.Checked = True Then
            Me.Button2.Enabled = True
            Me.CheckBox1.Enabled = False
        End If
    End Sub

    Private Sub OpenFileDialog1_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles OpenFileDialog1.FileOk

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.OpenFileDialog1.Filter = "sonic1.asm|sonic1.asm"
        Me.OpenFileDialog1.ShowDialog()
        If Me.OpenFileDialog1.FileName = "" Then
            Exit Sub
        End If
        MsgBox(Me.OpenFileDialog1.FileName)
        'f.TextBox1.Text = Me.OpenFileDialog1.FileName
        f.TextBox2.Text = File.ReadAllText(Me.OpenFileDialog1.FileName)
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Dim s1tcg As New Form3
        s1tcg.Show()
        Me.Visible = False
    End Sub

    Private Sub Form1_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        Form2.Close()
        Form3.Visible = True
    End Sub
End Class
