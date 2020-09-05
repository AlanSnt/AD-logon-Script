'******************************************************************
'                  Fichier logon.vbs
'                  Version 1.0
'******************************************************************
' Déclaration des variables
Option Explicit
Dim colDrives
Dim objNetwork
Dim objShell,grouplistD,ADSPath,userPath,listGroup
On Error Resume Next

' *****************************************************
' Affectation des variables
' *****************************************************

Set objShell = WScript.CreateObject( "WScript.Shell" )
Set objNetwork = CreateObject("Wscript.Network")

WScript.sleep 1000    

' *****************************************************
' Début des Mappages des disques et imprimantes
' *****************************************************

'##### DISQUE RESEAU 1 ######
on error resume next
if isMember("NOM-DU-GROUPE") then
    objNetwork.RemoveNetworkDrive "V:", true, true
    objNetwork.MapNetworkDrive "V:", "\\chemin_souhaité"
end if

WScript.sleep 1000

'##### IMPRIMANTE 1 #####
on error resume next
if isMember("NOM-DU-GROUPE") then
    objNetwork.AddWindowsPrinterConnection "\\chemin_souhaité\imprimante"
    ' METTRE L'IMPRIMANTE EN TANT QUE IMPRIMANTE PAR DEFAUT
    WScript.sleep 1000
    objNetwork.SetDefaultPrinter "\\chemin_souhaité\imprimante"
end if

WScript.sleep 1000

' *****************************************************
' Déclaration des fonctions 
' *****************************************************

' *****************************************************
' La fonction vérifie si le groupe demandé est possédé par le USER
Function IsMember(groupName)
    If IsEmpty(groupListD) then
        Set groupListD = CreateObject("Scripting.Dictionary")
        groupListD.CompareMode = 1
        ADSPath = EnvString("userdomain") & "/" & EnvString("username")
        Set userPath = GetObject("WinNT://" & ADSPath & ",user")
        For Each listGroup in userPath.Groups
            groupListD.Add listGroup.Name, "-"
        Next
    End if
    IsMember = CBool(groupListD.Exists(groupName))
End Function
' *****************************************************
 
' *****************************************************
' Récupère des variable d'environement, tel que le user ou le domaine
Function EnvString(variable)
    variable = "%" & variable & "%"
    EnvString = objShell.ExpandEnvironmentStrings(variable)
End Function
' *****************************************************
 
' Nettoyage du script
Set objShell = Nothing