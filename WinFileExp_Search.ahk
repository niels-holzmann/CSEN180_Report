#Requires AutoHotKey v2.0
Persistent
SetTitleMatchMode(2)

Run('explorer.exe "C:\Users\royal\Documents\Github\Hazard3Vec"') ; Change this for other directories
WinWaitActive("ahk_class CabinetWClass")

Sleep(1000)
Send("^f")
Sleep(500)
Start := A_TickCount
Send("Makefile OR main.c{Enter}") ; Change this to search for other file names + types

SetTimer(CheckResults, 100)

CheckResults() {
	global Start
	if WinExist("ahk_class CabinetWClass")
	{
		try {
			Title := WinGetTitle("ahk_class CabinetWClass")	
			if InStr(Title, "Makefile") or InStr(Title, "main.c") or InStr(Title, "Search Results") {
				End := A_TickCount
				Elapsed := (End - Start) / 1000.0
				MsgBox("Search took " Elapsed " seconds.")
				ExitApp()
			}
		} catch {
			MsgBox("Failed to get search time")
		}
	}
}
