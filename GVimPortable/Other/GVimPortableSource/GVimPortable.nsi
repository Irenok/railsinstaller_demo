;Copyright (C) 2006-2007 Roland Kammerer
;heavily based on the work of John T. Haller (www.portableapps.com)
;Website: http://portablegvim.sf.net


; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.


!define FULLNAME "GVim Portable"
!define NAME "GVimPortable"
!define APP "GVim"
!define VER "0.0.0.1"
!define WEBSITE "portablegvim.sf.net"
!define DEFAULTEXE "gvim.exe"
!define DEFAULTAPPDIR "vim\vim71"
!define DEFAULTSETTINGSPATH "settings"
!define DEFAULTSETTINGSFILE "vimrc"

;=== Program Details
Name "${NAME}"
OutFile "${NAME}.exe"
Caption "${FULLNAME} - editing made portable"
VIProductVersion "${VER}"
VIAddVersionKey FileDescription "${FULLNAME}"
VIAddVersionKey LegalCopyright "GPL"
VIAddVersionKey Comments "Allows ${APP} to be run from a removable drive.  For additional details, visit ${WEBSITE}"
VIAddVersionKey CompanyName ""
VIAddVersionKey OriginalFilename "${NAME}.exe"
VIAddVersionKey FileVersion "${VER}"

;=== Runtime Switches
CRCCheck On
WindowIcon Off
SilentInstall Silent
AutoCloseWindow True

;=== Include
!include "GetParameters.nsh"

;=== Program Icon
Icon "${NAME}.ico"

Var PROGRAMDIRECTORY
Var SETTINGSDIRECTORY
var FALLBACK
Var SETTINGSFILE
Var ADDITIONALPARAMETERS
Var EXECSTRING
Var PROGRAMEXECUTABLE
Var INIPATH
Var DISABLESPLASHSCREEN
;Var ISDEFAULTDIRECTORY
Var SECONDARYLAUNCH


Section "Main"
	;=== Find the INI file, if there is one
		IfFileExists "$EXEDIR\${NAME}.ini" "" CheckSubINI
			StrCpy "$INIPATH" "$EXEDIR"
			Goto ReadINI

	CheckSubINI:
		IfFileExists "$EXEDIR\${NAME}\${NAME}.ini" "" CheckSubSubINI
			StrCpy "$INIPATH" "$EXEDIR\${NAME}"
			Goto ReadINI

	CheckSubSubINI:
		IfFileExists "$EXEDIR\PortableApps\${NAME}\${NAME}.ini" "" CheckPortableAppsINI
			StrCpy "$INIPATH" "$EXEDIR\PortableApps\${NAME}"
			Goto ReadINI

	CheckPortableAppsINI:
		IfFileExists "$EXEDIR\Data\${NAME}\${NAME}.ini" ""  NoINI
			StrCpy "$INIPATH" "$EXEDIR\Data\${NAME}"
			Goto ReadINI

	ReadINI:
		;=== Read the parameters from the INI file
		ReadINIStr $0 "$INIPATH\${NAME}.ini" "${NAME}" "${APP}Directory"
		StrCpy "$PROGRAMDIRECTORY" "$EXEDIR\$0"
		ReadINIStr $0 "$INIPATH\${NAME}.ini" "${NAME}" "SettingsDirectory"
		StrCpy "$SETTINGSDIRECTORY" "$EXEDIR\$0"
		ReadINIStr $0 "$INIPATH\${NAME}.ini" "${NAME}" "SettingsFile"
		StrCpy "$SETTINGSFILE" "$0"

		;=== Check that the above required parameters are present
		IfErrors NoINI

		ReadINIStr $0 "$INIPATH\${NAME}.ini" "${NAME}" "AdditionalParameters"
		StrCpy "$ADDITIONALPARAMETERS" $0
		ReadINIStr $0 "$INIPATH\${NAME}.ini" "${NAME}" "${APP}Executable"
		StrCpy "$PROGRAMEXECUTABLE" $0
		ReadINIStr $0 "$INIPATH\${NAME}.ini" "${NAME}" "DisableSplashScreen"
		StrCpy "$DISABLESPLASHSCREEN" $0

	;CleanUpAnyErrors:
		;=== Any missing unrequired INI entries will be an empty string, ignore associated errors
		ClearErrors

		;=== Correct PROGRAMEXECUTABLE if blank
		StrCmp $PROGRAMEXECUTABLE "" "" EndINI
			StrCpy "$PROGRAMEXECUTABLE" "${DEFAULTEXE}"
			Goto EndINI

	NoINI:
		;=== No INI file, so we'll use the defaults
		StrCpy "$ADDITIONALPARAMETERS" ""
		StrCpy "$PROGRAMEXECUTABLE" "${DEFAULTEXE}"
		StrCpy "$DISABLESPLASHSCREEN" "false"
		StrCpy "$SETTINGSFILE" "${DEFAULTSETTINGSFILE}"

		IfFileExists "$EXEDIR\App\${DEFAULTAPPDIR}\${DEFAULTEXE}" "" CheckPortableProgramDIR
			StrCpy "$PROGRAMDIRECTORY" "$EXEDIR\App\${DEFAULTAPPDIR}"
			StrCpy "$SETTINGSDIRECTORY" "$EXEDIR\Data\${DEFAULTSETTINGSPATH}"
			StrCpy "$FALLBACK" "$EXEDIR\App\DefaultData\${DEFAULTSETTINGSPATH}"
			;StrCpy "$ISDEFAULTDIRECTORY" "true"
			GoTo EndINI

		CheckPortableProgramDIR:
			IfFileExists "$EXEDIR\${NAME}\App\${DEFAULTAPPDIR}\${DEFAULTEXE}" "" CheckPortableAppsDIR
			StrCpy "$PROGRAMDIRECTORY" "$EXEDIR\${NAME}\App\${DEFAULTAPPDIR}"
			StrCpy "$SETTINGSDIRECTORY" "$EXEDIR\${NAME}\Data\${DEFAULTSETTINGSPATH}"
			StrCpy "$FALLBACK" "$EXEDIR\${NAME}\App\DefaultData\${DEFAULTSETTINGSPATH}"
			GoTo EndINI

		CheckPortableAppsDIR:
			IfFileExists "$EXEDIR\PortableApps\${NAME}\App\${DEFAULTAPPDIR}\${DEFAULTEXE}" "" CheckPortableAppsSplitDIR
			StrCpy "$PROGRAMDIRECTORY" "$EXEDIR\PortableApps\${NAME}\App\${DEFAULTAPPDIR}"
			StrCpy "$SETTINGSDIRECTORY" "$EXEDIR\PortableApps\${NAME}\Data\${DEFAULTSETTINGSPATH}"
			StrCpy "$FALLBACK" "$EXEDIR\PortableApps\${NAME}\App\DefaultData\${DEFAULTSETTINGSPATH}"
			GoTo EndINI

		CheckPortableAppsSplitDIR:
			IfFileExists "$EXEDIR\Apps\${NAME}\${DEFAULTAPPDIR}\${DEFAULTEXE}" "" NoProgramEXE
			StrCpy "$PROGRAMDIRECTORY" "$EXEDIR\Apps\${NAME}\${DEFAULTAPPDIR}"
			StrCpy "$SETTINGSDIRECTORY" "$EXEDIR\Data\${NAME}\${DEFAULTSETTINGSPATH}"
			StrCpy "$FALLBACK" "$EXEDIR\Apps\${NAME}\DefaultData\${DEFAULTSETTINGSPATH}"

	
	EndINI:
		IfFileExists "$PROGRAMDIRECTORY\$PROGRAMEXECUTABLE" FoundProgramEXE

	NoProgramEXE:
		;=== Program executable not where expected
		MessageBox MB_OK|MB_ICONEXCLAMATION `$PROGRAMEXECUTABLE was not found.  Please check your configuration`
		Abort
		
	FoundProgramEXE:
		;=== Check if already running
		FindProcDLL::FindProc "$PROGRAMEXECUTABLE"
		Pop $R0                     
		StrCmp $R0 "1" "" CheckForSettings
			StrCpy $SECONDARYLAUNCH "true"
	
	CheckForSettings:
		IfFileExists "$SETTINGSDIRECTORY\$SETTINGSFILE" SettingsFound
		;=== No settings found
		StrCpy "$SETTINGSDIRECTORY" $FALLBACK
		StrCpy "$SETTINGSFILE" "${DEFAULTSETTINGSFILE}"
		GoTo SettingsFound

	SettingsFound:

	;DisplaySplash:
		StrCmp $DISABLESPLASHSCREEN "true" GetPassedParameters
			;=== Show the splash screen before processing the files
			InitPluginsDir
			File /oname=$PLUGINSDIR\splash.jpg "${NAME}.jpg"	
			;newadvsplash::show /NOUNLOAD 2000 200 0 -1 /L $PLUGINSDIR\splash.jpg
			newadvsplash::show /NOUNLOAD 1300 200 0 -1 /L $PLUGINSDIR\splash.jpg
			
	GetPassedParameters:
		;=== Get any passed parameters
		Call GetParameters
		Pop $0
		StrCmp "'$0'" "''" "" LaunchProgramParameters

		;=== No parameters
		StrCpy $EXECSTRING `"$PROGRAMDIRECTORY\$PROGRAMEXECUTABLE" -n -f -u "$SETTINGSDIRECTORY\$SETTINGSFILE"`
		Goto AdditionalParameters

	LaunchProgramParameters:
		StrCpy $EXECSTRING `"$PROGRAMDIRECTORY\$PROGRAMEXECUTABLE" -n -f -u "$SETTINGSDIRECTORY\$SETTINGSFILE" $0`

	AdditionalParameters:
		StrCmp $ADDITIONALPARAMETERS "" LaunchNow

		;=== Additional Parameters
		StrCpy $EXECSTRING `$EXECSTRING $ADDITIONALPARAMETERS`

	LaunchNow:
		StrCmp $SECONDARYLAUNCH "true" StartProgramAndExit
		
	;StartProgramNow:
		ExecWait $EXECSTRING
		
	CheckRunning:
		Sleep 2000
		FindProcDLL::FindProc "$PROGRAMEXECUTABLE"
		Pop $R0                     
		StrCmp $R0 "1" CheckRunning TheEnd
	
	StartProgramAndExit:
		Exec $EXECSTRING
		Goto TheEnd
	
	TheEnd:
SectionEnd

