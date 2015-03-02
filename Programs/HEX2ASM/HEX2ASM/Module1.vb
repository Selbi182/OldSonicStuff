Imports System.IO

Module Module1
    Sub Main()
        Console.WriteLine("===========================================")
        Console.WriteLine("Selbi's HEX to ASM Converter v1.0")
        Console.WriteLine("===========================================")
        Console.WriteLine()
        Console.WriteLine()

        If (My.Application.CommandLineArgs.Count > 0) Then
            'If (1 = 1) Then
            Dim Pfad As String = Split(Environment.CommandLine, """ ")(1).Replace(Chr(34), "")
            'Dim Pfad As String = "C:\Users\Selbi\Desktop\s1erz.bin"
            Dim Bytes As Byte() = My.Computer.FileSystem.ReadAllBytes(Pfad)
            Console.WriteLine("Input file path is:")
            Console.WriteLine(Pfad)
            ' =========================================================
            Console.WriteLine()
            ' =========================================================
            Console.WriteLine("Which type do you want? (1 = Bytes, 2 = Words, 3 = Longwords)")
IllegalType:
            Console.Write("> ")
            Dim TypePressed As ConsoleKeyInfo = Console.ReadKey()
            Dim SaveType As Integer = 0
            If TypePressed.KeyChar = "1" Then
                SaveType = 1
                Console.Write(" (Bytes)")
            End If
            If TypePressed.KeyChar = "2" Then
                SaveType = 2
                Console.Write(" (Words)")
            End If
            If TypePressed.KeyChar = "3" Then
                SaveType = 3
                Console.Write(" (Longwords)")
            End If
            If SaveType = 0 Then
                Console.WriteLine()
                Console.WriteLine("Illegal Value, type again:")
                GoTo IllegalType
            End If
            ' =========================================================
            Console.WriteLine()
            Console.WriteLine()
            ' =========================================================
            Console.WriteLine("Enter number of values per line (1 - 128):")
            Dim NumPerLine As String
WriteAgain:
            Console.Write("> ")
            NumPerLine = Console.ReadLine()
            If Not IsNumeric(NumPerLine) Then
                Console.WriteLine("Illegal Value, type again:")
                GoTo WriteAgain
            End If
            If NumPerLine < 1 Or NumPerLine > 128 Then
                Console.WriteLine("Illegal Value, type again:")
                GoTo WriteAgain
            End If
            ' =========================================================
            Console.WriteLine()
            Dim ReadKey As ConsoleKeyInfo
            ' =========================================================
            Console.WriteLine("Do you want to read from offsets (e.g. $00010000 to $00020000?")
            Console.WriteLine("(Y = Yes, Anything else = No)")
            ReadKey = Console.ReadKey(True)
            Dim OffsetTemp As String = 0
            Dim Offset As Integer = 0
            Dim OffsetEnd As Integer = Bytes.GetUpperBound(0)
            If ReadKey.Key.ToString = "Y" Then
                Console.WriteLine("Enter start offset (hexadecimal!):")
WriteAgainOffset:
                Console.Write("> $")
                OffsetTemp = Console.ReadLine()
                If Not IsHex(OffsetTemp) Then
                    Console.WriteLine("Illegal Value, type again:")
                    GoTo WriteAgainOffset
                End If
                Offset = Convert.ToInt32(OffsetTemp, 16)

                Console.WriteLine("Enter finish offset (hexadecimal!):")
WriteAgainFinOffset:
                Console.Write("> $")
                OffsetTemp = Console.ReadLine()
                If Not IsHex(OffsetTemp) Or Convert.ToInt32(OffsetTemp, 16) < Offset Then
                    Console.WriteLine("Illegal Value, type again:")
                    GoTo WriteAgainFinOffset
                End If
                OffsetEnd = Convert.ToInt32(OffsetTemp, 16)
            Else
                Console.WriteLine("Entire file will be converted!")
            End If
            ' =========================================================
            Console.WriteLine()
            ' =========================================================
            Console.WriteLine("Do you want to have values padded with 0's? (e.g. $035F instead of $35F)?")
            Console.WriteLine("(Y = Yes, Anything else = No)")
            ReadKey = Console.ReadKey(True)
            Dim Zeros As Boolean = False
            If ReadKey.Key.ToString = "Y" Then
                Zeros = True
                Console.WriteLine("Values will be padded with 0's!")
            Else
                Console.WriteLine("Values won't be padded with 0's!")
            End If
            ' =========================================================
            Console.WriteLine()
            ' =========================================================
            Console.WriteLine("Do you want no spaces between values (e.g. $40,$50 instead of $40, $50)?")
            Console.WriteLine("(Y = Yes, Anything else = No)")
            ReadKey = Console.ReadKey(True)
            Dim Spaces As String = ", "
            If ReadKey.Key.ToString = "Y" Then
                Spaces = ","
                Console.WriteLine("No spaces between values!")
            Else
                Console.WriteLine("There will be spaces between values!")
            End If
            ' =========================================================
            Console.WriteLine()
            ' =========================================================
            Console.WriteLine("Do you want offsets to be displayed at the end of the line (e.g. ; $00017A24)?")
            Console.WriteLine("(Y = Yes, Anything else = No)")
            ReadKey = Console.ReadKey(True)
            Dim WriteOffsets As Short = 0
            Dim OffsetAdd As String = ""
            If ReadKey.Key.ToString = "Y" Then
                WriteOffsets = 1
                Console.WriteLine("Offsets will be written!")
            Else
                Console.WriteLine("There will be no offsets!")
            End If
            ' =========================================================
            Console.WriteLine()
            ' =========================================================


            Dim NewLineStart As String = ""
            If SaveType = 1 Then NewLineStart = Chr(9) & Chr(9) & "dc.b" & Chr(9)
            If SaveType = 2 Then NewLineStart = Chr(9) & Chr(9) & "dc.w" & Chr(9)
            If SaveType = 3 Then NewLineStart = Chr(9) & Chr(9) & "dc.l" & Chr(9)
            ' =========================================================
            If SaveType = 2 Then
                If Not Bytes.GetUpperBound(0) Mod 2 = 1 Then
                    ReDim Preserve Bytes(Bytes.GetUpperBound(0) + 1)
                    Bytes(Bytes.GetUpperBound(0)) = Nothing
                End If
            End If
            If SaveType = 3 Then
                If Bytes.GetUpperBound(0) Mod 4 > 0 Then
                    ReDim Preserve Bytes(Bytes.GetUpperBound(0) + (4 - (Bytes.GetUpperBound(0) Mod 4)))
                End If
            End If

            Dim Counter As Integer = 0
            Console.Write("Converting")

            Dim teil As Integer = Bytes.GetUpperBound(0) / 69
            Dim x As Integer = 0
            Dim SavePathTemp As String = Pfad.Substring(0, Pfad.LastIndexOf(".")) & ".asm.tmp"
            Dim StreamSaver As StreamWriter = My.Computer.FileSystem.OpenTextFileWriter(SavePathTemp, False, System.Text.Encoding.ASCII)
            StreamSaver.Write(NewLineStart)

            ' =========================================================
            If SaveType = 2 Then GoTo Words
            If SaveType = 3 Then GoTo Longwords

Bytes:
            For i = Offset To OffsetEnd
                Counter += 1
                If Counter = NumPerLine Then
                    If WriteOffsets = 1 Then OffsetAdd = Chr(9) & "; $" & AddZeros(i - NumPerLine + 1, 8)
                    StreamSaver.Write("$" & AddZeros(Bytes(i), 2) & OffsetAdd & vbCrLf & NewLineStart)
                    Counter = 0
                Else
                    StreamSaver.Write("$" & AddZeros(Bytes(i), 2) & Spaces)
                End If
                If x < i Then
                    Console.Write(".")
                    x += teil
                End If
            Next
            GoTo ConvertingDone

Words:
            For i = Offset To OffsetEnd - 1
                Counter += 1
                If Counter = NumPerLine Then
                    If WriteOffsets = 1 Then OffsetAdd = Chr(9) & "; $" & AddZeros(i - NumPerLine * 2 + 2, 8)
                    StreamSaver.Write("$" & AddZeros(Bytes(i), 2) & AddZeros(Bytes(i), 2) & OffsetAdd & vbCrLf & NewLineStart)
                    Counter = 0
                Else
                    StreamSaver.Write("$" & AddZeros(Bytes(i), 2) & AddZeros(Bytes(i), 2) & Spaces)
                End If
                i += 1
                If x < i Then
                    Console.Write(".")
                    x += teil
                End If
            Next
            GoTo ConvertingDone

Longwords:
            For i = Offset To OffsetEnd - 2
                Counter += 1
                If Counter = NumPerLine Then
                    If WriteOffsets = 1 Then OffsetAdd = Chr(9) & "; $" & AddZeros(i - NumPerLine * 4 + 4, 8)
                    StreamSaver.Write("$" & AddZeros(Bytes(i), 2) & AddZeros(Bytes(i + 1), 2) & AddZeros(Bytes(i + 2), 2) & AddZeros(Bytes(i + 3), 2) & OffsetAdd & vbCrLf & NewLineStart)
                    Counter = 0
                Else
                    StreamSaver.Write("$" & AddZeros(Bytes(i), 2) & AddZeros(Bytes(i + 1), 2) & AddZeros(Bytes(i + 2), 2) & AddZeros(Bytes(i + 3), 2) & Spaces)
                End If
                i += 3
                If x < i Then
                    Console.Write(".")
                    x += teil
                End If
            Next

ConvertingDone:
            StreamSaver.Close()
            ' =========================================================

            Dim RemoveCrap As String = My.Computer.FileSystem.ReadAllText(SavePathTemp)
            My.Computer.FileSystem.DeleteFile(SavePathTemp)

            If Zeros = False Then
RemoveZerosLoop:
                If RemoveCrap.Contains("$0") Then
                    RemoveCrap = RemoveCrap.Replace("$0", "$")
                    GoTo RemoveZerosLoop
                End If
            End If

            If RemoveCrap.EndsWith(", ") Then RemoveCrap = RemoveCrap.Substring(0, RemoveCrap.Length - 2)
            If RemoveCrap.EndsWith(",") Then RemoveCrap = RemoveCrap.Substring(0, RemoveCrap.Length - 1)
            If RemoveCrap.EndsWith(Chr(9)) Then RemoveCrap = RemoveCrap.Substring(0, RemoveCrap.Length - 9)
            Console.WriteLine("   Done!")

            Console.WriteLine()
            Console.WriteLine("Saving...")
            Dim SavePath As String = Pfad.Substring(0, Pfad.LastIndexOf(".")) & ".asm"
            If My.Computer.FileSystem.FileExists(SavePath) Then
                Console.WriteLine("   File already exists. Save anyway? (Y = Yes, Anything else = No)")
                Dim SavePressed As ConsoleKeyInfo = Console.ReadKey(True)
                If SavePressed.Key.ToString = "Y" Then GoTo DoSave
                Console.WriteLine("   File NOT saved!")
                GoTo EndOfProgram
            End If
DoSave:

            My.Computer.FileSystem.WriteAllText(SavePath, RemoveCrap, False)
            Console.WriteLine("   Done!")

            Console.WriteLine()
            Console.WriteLine("---------------------------------------")
            Console.WriteLine()
            Console.WriteLine("Process finished. File has been saved to:")
            Console.WriteLine(SavePath)
        Else
            Console.WriteLine("Input file not found!")
            Console.WriteLine("To use this program, just drag'n'drop a file on it.")
        End If

EndOfProgram:
        Console.WriteLine()
        Console.WriteLine()
        Console.WriteLine("===========================================")
        Console.WriteLine("Press any key to exit . . .")
        Console.WriteLine("===========================================")
        Console.ReadKey()
    End Sub

    Public Function AddZeros(ByVal Text As String, ByVal Length As Integer)
        Text = Hex(Text)
        For i = 0 To Length - Text.Length - 1
            Text = "0" & Text
        Next
        Return Text
    End Function

    Public Function IsHex(ByVal strInput As String) As Boolean
        Dim i As Integer = 1
        Dim StrLength As Integer = Len(strInput)
        IsHex = False
        Do Until i > StrLength
            If Not (Mid$(strInput, i, 1) Like "[0-9a-hA-H]") Then
                Exit Function
            End If
            i = i + 1
        Loop
        IsHex = True
    End Function
End Module
