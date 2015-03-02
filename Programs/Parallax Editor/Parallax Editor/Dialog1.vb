Imports MainMemory.BitmapBits
Imports S2LVL.LevelLoader.LevelLoader

Public Class Dialog1
    Dim bits As BitmapBits

    Private Sub OK_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK_Button.Click
        Form1.bits = New BitmapBits(PictureBox1.Image)
        Me.Close()
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        bits = New BitmapBits(New System.Drawing.Bitmap(New Bitmap(S2LVL.LevelLoader.LevelLoader.LoadLevel(Me, False))))
        PictureBox1.Image = bits.ToBitmap(Imaging.PixelFormat.Format32bppArgb)

        PictureBox1.Enabled = True
        NumericUpDown1.Enabled = True
        NumericUpDown1.Maximum = PictureBox1.Image.Height - 224
        OK_Button.Enabled = True
    End Sub

    Private Sub NumericUpDown1_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NumericUpDown1.ValueChanged
        If PictureBox1.Enabled = True Then
            Dim bits2 As BitmapBits
            bits2 = New BitmapBits(bits)
            bits.Crop(0, Math.Max(NumericUpDown1.Value - 1, 0), 320, NumericUpDown1.Value + 223)
            PictureBox1.Image = bits.ToBitmap(Imaging.PixelFormat.Format32bppArgb)
            bits = New BitmapBits(bits2)
        End If
    End Sub
End Class
