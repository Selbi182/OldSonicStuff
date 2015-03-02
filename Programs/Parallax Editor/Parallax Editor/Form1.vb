Imports MainMemory.BitmapBits

Public Class Form1
    Public bits As BitmapBits
    Dim bits2 As BitmapBits
    Dim line As Integer = 0
    Dim pictureload As Short = 1
    Dim tosavearray(0) As String
    Dim nudminusone As Integer = 0
    Dim imgxsize As Integer = 0
    Dim s2lvl As Short = 0


    Private Sub PictureBox1_MouseDown(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles PictureBox1.MouseDown
        If pictureload = 1 Then
retry:
            If OpenFileDialog1.ShowDialog() = Windows.Forms.DialogResult.Cancel Then Exit Sub
            ReloadImage(1)
            If bits.Height < 224 Then
                MsgBox("The image must have a vertical height of 224 ($E0) pixels or more!", MsgBoxStyle.Critical)
                GoTo retry
            End If
            PictureBox1.BackgroundImage = Nothing
            LoadImage()
            imgxsize = Math.Min(bits.Width - 1, 319)
            pictureload = 0
            GroupBox1.Enabled = True
            RadioButton1.Enabled = True
            RadioButton2.Enabled = True
            Button1.Enabled = True
            Button5.Visible = False
            TextBox2.Enabled = True
            CreateLines()
            SaveArray()
        End If
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ComboBox1.SelectedIndex = 0
        SaveArray()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Clipboard.Clear()
        Clipboard.SetText(TextBox1.Text)
        TextBox1.Focus()
        TextBox1.SelectAll()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        ComboBox1.Items.Add(ComboBox1.Items.Count + 1)
        SaveArray_NewEntry()
        Button4.Enabled = True
        Dim totalsize As Integer = 0
        For i = 0 To tosavearray.GetUpperBound(0) - 1
            totalsize += tosavearray(i).Split(";")(0)
        Next
        ComboBox1.SelectedIndex = ComboBox1.Items.Count - 1
        NumericUpDown1.Value = Math.Min(224 - totalsize, 20)
        TrackBar1.Value = 1
        RadioButton1.Checked = True
        CreateLines()
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        tosavearray(ComboBox1.SelectedIndex) = Nothing
        For i = ComboBox1.SelectedIndex To tosavearray.GetUpperBound(0) - 1
            tosavearray(i) = tosavearray(i + 1)
        Next
        ReDim Preserve tosavearray(tosavearray.GetUpperBound(0) - 1)

        ComboBox1.Items.Remove(ComboBox1.Items.Count)
        If ComboBox1.Text = "" Then ComboBox1.SelectedIndex = ComboBox1.Items.Count - 1
        If ComboBox1.Items.Count = 1 Then Button4.Enabled = False
        LoadArrayEntry()
        CreateLines(1)
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim typearray(2) As String
        typearray(0) = "$FFFFCC00"
        typearray(1) = "$FFFFF700"
        typearray(2) = "$FFFFF708"
        If RadioButton4.Checked = True Then
            typearray(0) = "$FFFFE000"
            typearray(1) = "$FFFFEE00"
            typearray(2) = "$FFFFEE08"
        End If
        Dim totalsize As Integer = 0
        For i = 0 To tosavearray.GetUpperBound(0)
            totalsize += tosavearray(i).Split(";")(0)
        Next
        If totalsize < 223 Then
            If MsgBox("You didn't fill the entire screen. Continue anyway?", MsgBoxStyle.Exclamation Or MsgBoxStyle.YesNo) = MsgBoxResult.No Then Exit Sub
        End If

        TextBox1.Text = "		lea	(" & typearray(0) & ").w,a1	; load beginning address of horizontal scroll buffer to a1"

        For i = 0 To tosavearray.GetUpperBound(0)
            TextBox1.Text += vbCrLf & vbCrLf & _
                            "		move.w	(" & typearray(1) & ").w,d0	; load FG screen's X position" & vbCrLf & _
                            "		neg.w	d0			; negate (positive to negative)" & vbCrLf & _
                            "		swap	d0			; send to the left side of d0" & vbCrLf & _
                            "		move.w	(" & typearray(2) & ").w,d0	; load BG screen's X position" & vbCrLf & _
                            "		neg.w	d0			; negate (positive to negative)" & vbCrLf

            If Not tosavearray(i).Split(";")(1) = 0 Then
                If tosavearray(i).Split(";")(2) = False Then
                    TextBox1.Text += "		asr.w	#" & tosavearray(i).Split(";")(1) & ",d0			; divide by " & (2 ^ tosavearray(i).Split(";")(1)) & " (Slow down the scroll position)" & vbCrLf
                Else
                    TextBox1.Text += "		asl.w	#" & tosavearray(i).Split(";")(1) & ",d0			; multiply by " & (2 ^ tosavearray(i).Split(";")(1)) & " (Speed up the scroll position)" & vbCrLf
                End If
            Else
                TextBox1.Text += "	;	No Speed Change" & vbCrLf
            End If

            TextBox1.Text += "		move.w	#" & tosavearray(i).Split(";")(0) + 1 & "-1,d1		; set number of scan lines to dump (minus 1 for dbf)" & vbCrLf

            TextBox1.Text += TextBox2.Text.Replace("#", i + 1) & ":" & vbCrLf
            TextBox1.Text += "		move.l	d0,(a1)+		; dump both the FG and BG scanline position to buffer" & vbCrLf
            TextBox1.Text += "		dbf	d1," & TextBox2.Text.Replace("#", i + 1) & "	; repeat d1 number of scanlines"
        Next

        TextBox1.Enabled = True
        Button2.Enabled = True
    End Sub

    Public Sub LoadArrayEntry() Handles ComboBox1.SelectedIndexChanged
        If ComboBox1.Enabled = True Then
            Dim splitarray() As String = tosavearray(ComboBox1.SelectedIndex).Split(";")
            nudminusone = splitarray(0)
            NumericUpDown1.Value = nudminusone + 1
            TrackBar1.Value = splitarray(1)
            RadioButton2.Checked = splitarray(2)
            If RadioButton2.Checked = False Then RadioButton1.Checked = True
            If TrackBar1.Value = 0 Then
                Label4.Text = "0"
                RadioButton1.Enabled = False
                RadioButton2.Enabled = False
                Exit Sub
            Else
                RadioButton1.Enabled = True
                RadioButton2.Enabled = True
            End If
            If RadioButton1.Checked = True Then
                Label4.Text = "-" & TrackBar1.Value
            Else
                Label4.Text = "+" & TrackBar1.Value
            End If
        End If
    End Sub

    Private Sub NumericUpDown1_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NumericUpDown1.ValueChanged
        If pictureload = 0 Then
            Dim totalsize As Integer = 0
            For i = 0 To tosavearray.GetUpperBound(0)
                If Not i = ComboBox1.SelectedIndex Then
                    totalsize += tosavearray(i).Split(";")(0)
                End If
            Next
            Button3.Enabled = True
            If totalsize + NumericUpDown1.Value >= 224 Then
                NumericUpDown1.Value = 224 - totalsize
                Button3.Enabled = False
            End If
            CreateLines()
        End If
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Dialog1.ShowDialog()
        PictureBox1.Image = bits.ToBitmap(Imaging.PixelFormat.Format32bppArgb)
        bits2 = New BitmapBits(bits)
        PictureBox1.BackgroundImage = Nothing
        s2lvl = 1
        LoadImage()
        imgxsize = Math.Min(bits.Width - 1, 319)
        pictureload = 0
        GroupBox1.Enabled = True
        RadioButton1.Enabled = True
        RadioButton2.Enabled = True
        Button1.Enabled = True
        TextBox2.Enabled = True
        Button5.Visible = False
        CreateLines()
        SaveArray()
    End Sub






    Public Sub SaveArray()
        tosavearray(ComboBox1.SelectedIndex) = nudminusone & ";"
        tosavearray(ComboBox1.SelectedIndex) += TrackBar1.Value & ";"
        tosavearray(ComboBox1.SelectedIndex) += RadioButton2.Checked.ToString
    End Sub

    Public Sub SaveArray_NewEntry()
        SaveArray()
        ReDim Preserve tosavearray(ComboBox1.Items.Count - 1)
        tosavearray(ComboBox1.Items.Count - 1) = nudminusone & ";"
        tosavearray(ComboBox1.Items.Count - 1) += TrackBar1.Value & ";"
        tosavearray(ComboBox1.Items.Count - 1) += RadioButton2.Checked.ToString
    End Sub

    Public Sub CreateLines(Optional ByVal makeitbla As Short = 0)
        If pictureload = 0 Then
            If makeitbla = 0 Then nudminusone = NumericUpDown1.Value - 1
            SaveArray()
            ReloadImage()
            Dim startlinesetter As Integer = 0
            Dim makecolor(2) As Integer
            For i = 0 To tosavearray.GetUpperBound(0)
                If Not tosavearray.GetUpperBound(0) = 0 AndAlso Not i = 0 Then
                    startlinesetter = 0
                    For i2 = 0 To i - 1
                        startlinesetter += tosavearray(i2).Split(";")(0)
                    Next
                End If

                makecolor(0) = 0
                makecolor(2) = 0
                If Not tosavearray(i).Split(";")(1) = 0 Then
                    If tosavearray(i).Split(";")(2) = True Then makecolor(0) = Math.Max(Math.Min(CInt(tosavearray(i).Split(";")(1)) * 64, 255), 0)
                    If tosavearray(i).Split(";")(2) = False Then makecolor(2) = Math.Max(Math.Min(CInt(tosavearray(i).Split(";")(1)) * 64, 255), 0)
                End If
                makecolor(1) = Math.Min(512 - CInt(tosavearray(i).Split(";")(1)) * 64, 255)

                CreateColorBlock(startlinesetter, tosavearray(i).Split(";")(0), makecolor)
                Dim asjhdbau As Integer = Math.Min(CInt(tosavearray(i).Split(";")(1)), 255)
            Next
            LoadImage()
        End If
    End Sub

    Public Sub CreateColorBlock(ByVal startline As Integer, ByVal blocksize As Integer, ByVal ParamArray colorlimit() As Integer)
        For i = 0 To imgxsize
            bits.Pixels(i, startline) = Color.FromArgb(255, colorlimit(0), colorlimit(1), colorlimit(2))
        Next
        For i = 0 To imgxsize
            bits.Pixels(i, Math.Min(startline + blocksize, 223)) = Color.FromArgb(255, colorlimit(0), colorlimit(1), colorlimit(2))
        Next

        For iY = startline To Math.Min(startline + blocksize + 1, 223)
            For iX = 0 To imgxsize
                bits.Pixels(iX, iY) = Color.FromArgb(255, Math.Min(bits.Pixels(iX, iY).R, colorlimit(0)), Math.Min(bits.Pixels(iX, iY).G, colorlimit(1)), Math.Min(bits.Pixels(iX, iY).B, colorlimit(2)))
            Next
        Next
    End Sub

    Public Sub LoadImage()
        PictureBox1.Image = bits.ToBitmap(Imaging.PixelFormat.Format32bppArgb)
    End Sub

    Public Sub ReloadImage(Optional ByVal loadimg As Short = 0)
        If s2lvl = 1 Then
            bits = New BitmapBits(bits2)
        Else
            If OpenFileDialog1.FileName.EndsWith(".png") Then
                bits = New BitmapBits(GrayScale(New System.Drawing.Bitmap(New Bitmap(OpenFileDialog1.FileName))))
            Else
                bits = New BitmapBits(GrayScale(New Bitmap(OpenFileDialog1.FileName)))
            End If
        End If
        If loadimg = 0 Then LoadImage()
    End Sub

    Public Function GrayScale(ByVal Image As Image) As Image
        Dim ImgAttr As New Imaging.ImageAttributes()
        Dim ColorMatrix As New Imaging.ColorMatrix(New Single()() {New Single() {0.299, 0.299, 0.299, 0, 0}, New Single() {0.587, 0.587, 0.587, 0, 0}, New Single() {0.114, 0.114, 0.114, 0, 0}, New Single() {0, 0, 0, 1, 0}, New Single() {0, 0, 0, 0, 1}})
        ImgAttr.SetColorMatrix(ColorMatrix)
        Dim NewBitmap = New Bitmap(Image.Width, Image.Height, System.Drawing.Imaging.PixelFormat.Format32bppArgb)
        NewBitmap.SetResolution(Image.HorizontalResolution, Image.VerticalResolution)
        Dim NewGraphics As Graphics = Graphics.FromImage(NewBitmap)
        NewGraphics.DrawImage(Image, New Rectangle(0, 0, NewBitmap.Width, NewBitmap.Height), 0, 0, Image.Width, Image.Height, GraphicsUnit.Pixel, ImgAttr)
        NewGraphics.Dispose()
        ImgAttr.Dispose()
        Return NewBitmap
    End Function

    Private Sub TrackBar_RadioButtons(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TrackBar1.Scroll, TrackBar1.ValueChanged, RadioButton1.CheckedChanged, RadioButton2.CheckedChanged
        If GroupBox1.Enabled = True Then SaveArray()
        If TrackBar1.Value = 0 Then
            Label4.Text = "0"
            RadioButton1.Enabled = False
            RadioButton2.Enabled = False
            Exit Sub
        Else
            RadioButton1.Enabled = True
            RadioButton2.Enabled = True
        End If
        If RadioButton1.Checked = True Then
            Label4.Text = "-" & TrackBar1.Value
        Else
            Label4.Text = "+" & TrackBar1.Value
        End If
        CreateLines()
    End Sub
End Class
