Set objFSO = CreateObject("Scripting.FileSystemObject")
objStartFolder = "C:\static\workspace\git\Announcements\data\images"
outFolder = "C:\static\workspace\git\Announcements\data\out"
Dim transitions, transitionIndex
out = outFolder & "\" & datediff("s",#1970/1/1#,now()) & ".out.html"
transitions = Array("fade","slide","convex","concave","zoom")
transitionIndex = 0
files = Array()

Set writer = objFSO.CreateTextFile(out,True)
Set objFolder = objFSO.GetFolder(objStartFolder)
Set colFiles = objFolder.Files
Wscript.Echo UBound(transitions)
For Each objFile in colFiles
	ReDim Preserve files(UBound(files) + 1)
	files(UBound(files)) = objFile.Name
Next

For Each item in files
	transition = transitions(transitionIndex)
	Writer.WriteLine("<section data-background='" & objStartFolder & item & "' data-background-transition='" & transition & "' data-transition='" & transition & "'></section>")
	If transitionIndex >= UBound(transitions) Then
		transitionIndex = 0
	Else transitionIndex = transitionIndex + 1
	End If

Next

writer.Close