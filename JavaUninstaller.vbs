'*******************************************************************************
'     Program: Install.vbs
'      Author: Mick Pletcher
'        Date: 26 April 2012
'    Modified: 28 Feb 2013, Chris Cassun
'	Added new versions (to u14)
'	Commented out application install (deployed via gpo)
'    Modified: 1 Mar 2013, Chris Cassun
'	Added msiexec log file creation
'    Modified: 4 Mar 2013, Chris Cassun
'	Added new versions (to 7u16)
'    Modified: 22 Apr 2013, Chris Cassun
'	Added new versions (to 7u20)
'    Modified: 20 Jun 2013, Chris Cassun
'	Added new versions (to 7u24)
'
'     Program: Java Runtime Environment
'     Version: 7u15
' Description: This will uninstall previous versions and then installs
'			   the current version
'			   1) Define the relative installation path
'			   2) Create the Log Folder
'			   3) Uninstall all previous versions
'			   4) Install Current Version
'			   5) Cleanup Global Variables
'*******************************************************************************
Option Explicit

REM Define Constants
CONST TempFolder    = "c:\temp\"
CONST LogFolderName = "JavaRuntime"

REM Define Global Variables
DIM Architecture : Set Architecture = Nothing
DIM LogFolder    : LogFolder        = TempFolder & LogFolderName & "\"
DIM RelativePath : Set RelativePath = Nothing

REM Define the relative installation path
DefineRelativePath()
REM Create the Log Folder
CreateLogFolder()
REM Determine Architecture
DetermineArchitecture()
REM Uninstall all Previous Versions
Uninstall()
'	Commented out installs as they are pushed via GP - 1 Mar 2013 - Chris Cassun
REM Installx86
'Installx86()
If Architecture = "x64" Then
	REM Installx64 
'	Installx64()
End If
REM Cleanup Global Variables
GlobalVariableCleanup()

'*******************************************************************************
'*******************************************************************************

Sub DefineRelativePath()

	REM Get File Name with full relative path
	RelativePath = WScript.ScriptFullName
	REM Remove file name, leaving relative path only
	RelativePath = Left(RelativePath, InStrRev(RelativePath, "\"))

End Sub

'*******************************************************************************

Sub CreateLogFolder()

	REM Define Local Objects
	DIM FSO : Set FSO = CreateObject("Scripting.FileSystemObject")

	If NOT FSO.FolderExists(TempFolder) then
		FSO.CreateFolder(TempFolder)
	End If
	If NOT FSO.FolderExists(LogFolder) then
		FSO.CreateFolder(LogFolder)
	End If

	REM Cleanup Local Variables
	Set FSO = Nothing

End Sub

'*******************************************************************************

Sub DetermineArchitecture()

	REM Define Local Objects
	DIM WshShell : Set WshShell = CreateObject("WScript.Shell")

	REM Define Local Variables
	DIM OsType : OsType = WshShell.RegRead("HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\PROCESSOR_ARCHITECTURE")

	If OsType = "x86" then
		Architecture = "x86"
	elseif OsType = "AMD64" then
		Architecture = "x64"
	end if
	
	REM Cleanup Local Variables
	Set WshShell = Nothing
	Set OsType   = Nothing
	
End Sub

'*******************************************************************************

Sub Uninstall()

	REM Define Local Objects
	DIM oShell : SET oShell = CreateObject("Wscript.Shell")

	REM Define Local Variables
	DIM Parameters      : Parameters      = Chr(32) & "/qb- /norestart /LE*V " & LogFolder & "uninstall.log"
	DIM Uninstall01     : Uninstall01     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160010}" & Parameters
	DIM Uninstall02     : Uninstall02     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160020}" & Parameters
	DIM Uninstall03     : Uninstall03     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160030}" & Parameters
	DIM Uninstall04     : Uninstall04     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160040}" & Parameters
	DIM Uninstall05     : Uninstall05     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160050}" & Parameters
	DIM Uninstall06     : Uninstall06     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160060}" & Parameters
	DIM Uninstall07     : Uninstall07     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160070}" & Parameters
	DIM Uninstall08     : Uninstall08     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160080}" & Parameters
	DIM Uninstall09     : Uninstall09     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160090}" & Parameters
	DIM Uninstall10     : Uninstall10     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160060}" & Parameters
	DIM Uninstall11     : Uninstall11     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160110}" & Parameters
	DIM Uninstall12     : Uninstall12     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160120}" & Parameters
	DIM Uninstall13     : Uninstall13     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160130}" & Parameters
	DIM Uninstall14     : Uninstall14     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160140}" & Parameters
	DIM Uninstall15     : Uninstall15     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160150}" & Parameters
	DIM Uninstall16     : Uninstall16     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160160}" & Parameters
	DIM Uninstall17     : Uninstall17     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160170}" & Parameters
	DIM Uninstall18     : Uninstall18     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160180}" & Parameters
	DIM Uninstall19     : Uninstall19     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160190}" & Parameters
	DIM Uninstall20     : Uninstall20     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160200}" & Parameters
	DIM Uninstall21     : Uninstall21     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160210}" & Parameters
	DIM Uninstall22     : Uninstall22     = "msiexec.exe /x {3248F0A8-6813-11D6-A77B-00B0D0160220}" & Parameters
	DIM Uninstall23     : Uninstall23     = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83216023FF}" & Parameters
	DIM Uninstall23x64  : Uninstall23x64  = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86416023FF}" & Parameters
	DIM Uninstall24     : Uninstall24     = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83216024FF}" & Parameters
	DIM Uninstall24x64  : Uninstall24x64  = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86416024FF}" & Parameters
	DIM Uninstall25     : Uninstall25     = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83216025FF}" & Parameters
	DIM Uninstall25x64  : Uninstall25x64  = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86416025FF}" & Parameters
	DIM Uninstall26     : Uninstall26     = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83216026FF}" & Parameters
	DIM Uninstall26x64  : Uninstall26x64  = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86416026FF}" & Parameters
	DIM Uninstall27     : Uninstall27     = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83216027FF}" & Parameters
	DIM Uninstall27x64  : Uninstall27x64  = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86416027FF}" & Parameters
	DIM Uninstall28     : Uninstall28     = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83216028FF}" & Parameters
	DIM Uninstall28x64  : Uninstall28x64  = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86416028FF}" & Parameters
	DIM Uninstall29     : Uninstall29     = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83216029FF}" & Parameters
	DIM Uninstall29x64  : Uninstall29x64  = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86416029FF}" & Parameters
	DIM Uninstall30     : Uninstall30     = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83216030FF}" & Parameters
	DIM Uninstall30x64  : Uninstall30x64  = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86416030FF}" & Parameters
	DIM Uninstall31     : Uninstall31     = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83216031FF}" & Parameters
	DIM Uninstall31x64  : Uninstall31x64  = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86416031FF}" & Parameters
	DIM Uninstall7_1    : Uninstall7_1    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217001FF}" & Parameters
	DIM Uninstall7_1x64 : Uninstall7_1x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417001FF}" & Parameters
	DIM Uninstall7_2    : Uninstall7_2    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217002FF}" & Parameters
	DIM Uninstall7_2x64 : Uninstall7_2x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417002FF}" & Parameters
	DIM Uninstall7_3    : Uninstall7_3    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217003FF}" & Parameters
	DIM Uninstall7_3x64 : Uninstall7_3x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417003FF}" & Parameters
	DIM Uninstall7_4    : Uninstall7_4    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217004FF}" & Parameters
	DIM Uninstall7_4x64 : Uninstall7_4x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417004FF}" & Parameters
	DIM Uninstall7_5    : Uninstall7_5    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217005FF}" & Parameters
	DIM Uninstall7_5x64 : Uninstall7_5x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417005FF}" & Parameters
	DIM Uninstall7_6    : Uninstall7_6    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217006FF}" & Parameters
	DIM Uninstall7_6x64 : Uninstall7_6x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417006FF}" & Parameters
	DIM Uninstall7_7    : Uninstall7_7    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217007FF}" & Parameters
	DIM Uninstall7_7x64 : Uninstall7_7x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417007FF}" & Parameters
	DIM Uninstall7_8    : Uninstall7_8    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217008FF}" & Parameters
	DIM Uninstall7_8x64 : Uninstall7_8x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417008FF}" & Parameters
	DIM Uninstall7_9    : Uninstall7_9    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217009FF}" & Parameters
	DIM Uninstall7_9x64 : Uninstall7_9x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417009FF}" & Parameters
	DIM Uninstall7_10    : Uninstall7_10    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217010FF}" & Parameters
	DIM Uninstall7_10x64 : Uninstall7_10x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417010FF}" & Parameters
	DIM Uninstall7_11    : Uninstall7_11    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217011FF}" & Parameters
	DIM Uninstall7_11x64 : Uninstall7_11x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417011FF}" & Parameters
	DIM Uninstall7_12    : Uninstall7_12    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217012FF}" & Parameters
	DIM Uninstall7_12x64 : Uninstall7_12x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417012FF}" & Parameters
	DIM Uninstall7_13    : Uninstall7_13    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217013FF}" & Parameters
	DIM Uninstall7_13x64 : Uninstall7_13x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417013FF}" & Parameters
	DIM Uninstall7_14    : Uninstall7_14    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217014FF}" & Parameters
	DIM Uninstall7_14x64 : Uninstall7_14x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417014FF}" & Parameters
	DIM Uninstall7_15    : Uninstall7_15    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217015FF}" & Parameters
	DIM Uninstall7_15x64 : Uninstall7_15x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417015FF}" & Parameters
	DIM Uninstall7_16    : Uninstall7_16    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217016FF}" & Parameters
	DIM Uninstall7_16x64 : Uninstall7_16x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417016FF}" & Parameters
	DIM Uninstall7_17    : Uninstall7_17    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217017FF}" & Parameters
	DIM Uninstall7_17x64 : Uninstall7_17x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417017FF}" & Parameters
	DIM Uninstall7_18    : Uninstall7_18    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217018FF}" & Parameters
	DIM Uninstall7_18x64 : Uninstall7_18x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417018FF}" & Parameters
	DIM Uninstall7_19    : Uninstall7_19    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217019FF}" & Parameters
	DIM Uninstall7_19x64 : Uninstall7_19x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417019FF}" & Parameters
	DIM Uninstall7_20    : Uninstall7_20    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217020FF}" & Parameters
	DIM Uninstall7_20x64 : Uninstall7_20x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417020FF}" & Parameters
	DIM Uninstall7_20    : Uninstall7_21    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217021FF}" & Parameters
	DIM Uninstall7_20x64 : Uninstall7_21x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417021FF}" & Parameters
	DIM Uninstall7_20    : Uninstall7_22    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217022FF}" & Parameters
	DIM Uninstall7_20x64 : Uninstall7_22x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417022FF}" & Parameters
	DIM Uninstall7_20    : Uninstall7_23    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217023FF}" & Parameters
	DIM Uninstall7_20x64 : Uninstall7_23x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417023FF}" & Parameters
	DIM Uninstall7_20    : Uninstall7_24    = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F83217024FF}" & Parameters
	DIM Uninstall7_20x64 : Uninstall7_24x64 = "msiexec.exe /x {26A24AE4-039D-4CA4-87B4-2F86417024FF}" & Parameters

	oShell.Run Uninstall01, 7, True
	oShell.Run Uninstall02, 7, True
	oShell.Run Uninstall03, 7, True
	oShell.Run Uninstall04, 7, True
	oShell.Run Uninstall05, 7, True
	oShell.Run Uninstall06, 7, True
	oShell.Run Uninstall07, 7, True
	oShell.Run Uninstall08, 7, True
	oShell.Run Uninstall09, 7, True
	oShell.Run Uninstall10, 7, True
	oShell.Run Uninstall11, 7, True
	oShell.Run Uninstall12, 7, True
	oShell.Run Uninstall13, 7, True
	oShell.Run Uninstall14, 7, True
	oShell.Run Uninstall15, 7, True
	oShell.Run Uninstall16, 7, True
	oShell.Run Uninstall17, 7, True
	oShell.Run Uninstall18, 7, True
	oShell.Run Uninstall19, 7, True
	oShell.Run Uninstall20, 7, True
	oShell.Run Uninstall21, 7, True
	oShell.Run Uninstall22, 7, True
	oShell.Run Uninstall23, 7, True
	oShell.Run Uninstall23x64, 7, True
	oShell.Run Uninstall24, 7, True
	oShell.Run Uninstall24x64, 7, True
	oShell.Run Uninstall25, 7, True
	oShell.Run Uninstall25x64, 7, True
	oShell.Run Uninstall26, 7, True
	oShell.Run Uninstall26x64, 7, True
	oShell.Run Uninstall27, 7, True
	oShell.Run Uninstall27x64, 7, True
	oShell.Run Uninstall28, 7, True
	oShell.Run Uninstall28x64, 7, True
	oShell.Run Uninstall29, 7, True
	oShell.Run Uninstall29x64, 7, True
	oShell.Run Uninstall30, 7, True
	oShell.Run Uninstall30x64, 7, True
	oShell.Run Uninstall31, 7, True
	oShell.Run Uninstall31x64, 7, True
	oShell.Run Uninstall7_1, 7, True
	oShell.Run Uninstall7_1x64, 7, True
	oShell.Run Uninstall7_2, 7, True
	oShell.Run Uninstall7_2x64, 7, True
	oShell.Run Uninstall7_3, 7, True
	oShell.Run Uninstall7_3x64, 7, True
	oShell.Run Uninstall7_4, 7, True
	oShell.Run Uninstall7_4x64, 7, True
	oShell.Run Uninstall7_5, 7, True
	oShell.Run Uninstall7_5x64, 7, True
	oShell.Run Uninstall7_6, 7, True
	oShell.Run Uninstall7_6x64, 7, True
	oShell.Run Uninstall7_7, 7, True
	oShell.Run Uninstall7_7x64, 7, True
	oShell.Run Uninstall7_8, 7, True
	oShell.Run Uninstall7_8x64, 7, True
	oShell.Run Uninstall7_9, 7, True
	oShell.Run Uninstall7_9x64, 7, True
	oShell.Run Uninstall7_10, 7, True
	oShell.Run Uninstall7_10x64, 7, True
	oShell.Run Uninstall7_11, 7, True
	oShell.Run Uninstall7_11x64, 7, True
	oShell.Run Uninstall7_12, 7, True
	oShell.Run Uninstall7_12x64, 7, True
	oShell.Run Uninstall7_13, 7, True
	oShell.Run Uninstall7_13x64, 7, True
	oShell.Run Uninstall7_14, 7, True
	oShell.Run Uninstall7_14x64, 7, True
	oShell.Run Uninstall7_15, 7, True
	oShell.Run Uninstall7_15x64, 7, True
	oShell.Run Uninstall7_16, 7, True
	oShell.Run Uninstall7_16x64, 7, True
	oShell.Run Uninstall7_17, 7, True
	oShell.Run Uninstall7_17x64, 7, True
	oShell.Run Uninstall7_18, 7, True
	oShell.Run Uninstall7_18x64, 7, True
	oShell.Run Uninstall7_19, 7, True
	oShell.Run Uninstall7_19x64, 7, True
	oShell.Run Uninstall7_20, 7, True
	oShell.Run Uninstall7_20x64, 7, True
	oShell.Run Uninstall7_21, 7, True
	oShell.Run Uninstall7_21x64, 7, True
	oShell.Run Uninstall7_22, 7, True
	oShell.Run Uninstall7_22x64, 7, True
	oShell.Run Uninstall7_23, 7, True
	oShell.Run Uninstall7_23x64, 7, True
	oShell.Run Uninstall7_24, 7, True
	oShell.Run Uninstall7_24x64, 7, True

	REM Cleanup Local Variables
	Set oShell          = Nothing
	Set Parameters      = Nothing
	Set Uninstall01     = Nothing
	Set Uninstall02     = Nothing
	Set Uninstall03     = Nothing
	Set Uninstall04     = Nothing
	Set Uninstall05     = Nothing
	Set Uninstall06     = Nothing
	Set Uninstall07     = Nothing
	Set Uninstall08     = Nothing
	Set Uninstall09     = Nothing
	Set Uninstall10     = Nothing
	Set Uninstall11     = Nothing
	Set Uninstall12     = Nothing
	Set Uninstall13     = Nothing
	Set Uninstall14     = Nothing
	Set Uninstall15     = Nothing
	Set Uninstall16     = Nothing
	Set Uninstall17     = Nothing
	Set Uninstall18     = Nothing
	Set Uninstall19     = Nothing
	Set Uninstall20     = Nothing
	Set Uninstall21     = Nothing
	Set Uninstall22     = Nothing
	Set Uninstall23     = Nothing
	Set Uninstall23x64  = Nothing
	Set Uninstall24     = Nothing
	Set Uninstall24x64  = Nothing
	Set Uninstall25     = Nothing
	Set Uninstall25x64  = Nothing
	Set Uninstall26     = Nothing
	Set Uninstall26x64  = Nothing
	Set Uninstall27     = Nothing
	Set Uninstall27x64  = Nothing
	Set Uninstall28     = Nothing
	Set Uninstall28x64  = Nothing
	Set Uninstall29     = Nothing
	Set Uninstall29x64  = Nothing
	Set Uninstall30     = Nothing
	Set Uninstall30x64  = Nothing
	Set Uninstall31     = Nothing
	Set Uninstall31x64  = Nothing
	Set Uninstall7_1    = Nothing
	Set Uninstall7_1x64 = Nothing
	Set Uninstall7_2    = Nothing
	Set Uninstall7_2x64 = Nothing
	Set Uninstall7_3    = Nothing
	Set Uninstall7_3x64 = Nothing
	Set Uninstall7_4    = Nothing
	Set Uninstall7_4x64 = Nothing
	Set Uninstall7_5    = Nothing
	Set Uninstall7_5x64 = Nothing
	Set Uninstall7_6    = Nothing
	Set Uninstall7_6x64 = Nothing
	Set Uninstall7_7    = Nothing
	Set Uninstall7_7x64 = Nothing
	Set Uninstall7_8    = Nothing
	Set Uninstall7_8x64 = Nothing
	Set Uninstall7_9    = Nothing
	Set Uninstall7_9x64 = Nothing
	Set Uninstall7_10    = Nothing
	Set Uninstall7_10x64 = Nothing
	Set Uninstall7_11    = Nothing
	Set Uninstall7_11x64 = Nothing
	Set Uninstall7_12    = Nothing
	Set Uninstall7_12x64 = Nothing
	Set Uninstall7_13    = Nothing
	Set Uninstall7_13x64 = Nothing
	Set Uninstall7_14    = Nothing
	Set Uninstall7_14x64 = Nothing
	Set Uninstall7_15    = Nothing
	Set Uninstall7_15x64 = Nothing
	Set Uninstall7_16    = Nothing
	Set Uninstall7_16x64 = Nothing
	Set Uninstall7_17    = Nothing
	Set Uninstall7_17x64 = Nothing
	Set Uninstall7_18    = Nothing
	Set Uninstall7_18x64 = Nothing
	Set Uninstall7_19    = Nothing
	Set Uninstall7_19x64 = Nothing
	Set Uninstall7_20    = Nothing
	Set Uninstall7_20x64 = Nothing
	Set Uninstall7_21    = Nothing
	Set Uninstall7_21x64 = Nothing
	Set Uninstall7_22    = Nothing
	Set Uninstall7_22x64 = Nothing
	Set Uninstall7_23    = Nothing
	Set Uninstall7_23x64 = Nothing
	Set Uninstall7_24    = Nothing
	Set Uninstall7_24x64 = Nothing

End Sub

'*******************************************************************************

Sub Installx86()

	REM Define Local Objects
	DIM oShell : SET oShell = CreateObject("Wscript.Shell")

	REM Define Local Variables
	DIM File       : File       = Chr(32) & RelativePath & "x86\jre1.7.0_15.msi"
	DIM Parameters : Parameters = Chr(32) & "/qb- ADDLOCAL=ALL IEXPLORER=1 MOZILLA=1 SYSTRAY=1 JAVAUPDATE=1 JU=0 AUTOUPDATECHECK=1 /norestart"
	DIM Install    : Install    = "msiexec.exe /i" & File & Parameters

	oShell.Run Install, 1, True

	REM Cleanup Local Variables
	Set File       = Nothing
	Set Install    = Nothing
	Set oShell     = Nothing
	Set Parameters = Nothing

End Sub

'*******************************************************************************

Sub Installx64()

	REM Define Local Objects
	DIM oShell : SET oShell = CreateObject("Wscript.Shell")

	REM Define Local Variables
	DIM File       : File       = Chr(32) & RelativePath & "x64\jre1.7.0_15.msi"
	DIM Parameters : Parameters = Chr(32) & "/qb- ADDLOCAL=ALL IEXPLORER=1 MOZILLA=1 SYSTRAY=1 JAVAUPDATE=1 JU=0 AUTOUPDATECHECK=1 /norestart"
	DIM Install    : Install    = File & Parameters

	oShell.Run Install, 1, True

	REM Cleanup Local Variables
	Set File       = Nothing
	Set Install    = Nothing
	Set oShell     = Nothing
	Set Parameters = Nothing

End Sub

'*******************************************************************************

Sub GlobalVariableCleanup()

	Set Architecture = Nothing
	Set LogFolder    = Nothing
	Set RelativePath = Nothing

End Sub