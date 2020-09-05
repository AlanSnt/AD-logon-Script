
<br  />

<p  align="center">

<h3  align="center">AD-logon</h3>  

<p  align="center">

Script de mappage automatique de disques réseaux et imprimantes selon le groupe de l'utilisateur.
<br  />
</p>

</p>

  
  
  

<!-- TABLE OF CONTENTS -->

## SOMMAIRE
  

*  [A propos](#a-propos)
*  [Utilisation](#utilisation)
   * [Disques Réseaux](#disques-réseaux)
   * [Imprimantes Réseaux](#imprimantes-réseaux)
*  [Contact](#contact)

  
  
  

<!-- ABOUT THE PROJECT -->

## A propos

Petit script de logon, pour auto mapper des disques réseaux et imprimantes selon le groupe de l'utilisateur sur des serveurs Active Directory


## Utilisation

Il suffit de remplacer les "NOM-DU-GROUPE" part le nom du groupe souhaité

  ### Disques réseaux
```
'##### DISQUE RESEAU 1 ######

on error resume next

if  isMember("NOM-DU-GROUPE") then
objNetwork.RemoveNetworkDrive "V:", true, true  --> Retire si un lecteur V: existe déja
objNetwork.MapNetworkDrive "V:", "\\chemin_souhaité" --> Ajoute le lecteur réseau voulut
end if

WScript.sleep 1000
```
Evidemment vous pouvez ajouté plusieurs disques pour un seul et même groupe 
Exemple : 
```
'##### DISQUE RESEAU 1 ######

on error resume next

if  isMember("NOM-DU-GROUPE") then
objNetwork.RemoveNetworkDrive "V:", true, true  --> Retire si un lecteur V: existe déja
objNetwork.MapNetworkDrive "V:", "\\chemin_souhaité" --> Ajoute le lecteur réseau voulut

WScript.sleep 1000

objNetwork.RemoveNetworkDrive "H:", true, true  --> Retire si un lecteur H: existe déja
objNetwork.MapNetworkDrive "H:", "\\chemin_souhaité2" --> Ajoute le lecteur réseau voulut

WScript.sleep 1000

objNetwork.RemoveNetworkDrive "K:", true, true  --> Retire si un lecteur K: existe déja
objNetwork.MapNetworkDrive "K:", "\\chemin_souhaité3" --> Ajoute le lecteur réseau voulut
end if

WScript.sleep 1000
```
  ### Imprimantes Réseaux
```
'##### IMPRIMANTE 1 #####
on error resume next
if  isMember("NOM-DU-GROUPE") then
objNetwork.AddWindowsPrinterConnection "\\chemin_souhaité\imprimante" --> Chemin de l'imprimante
' METTRE L'IMPRIMANTE EN TANT QUE IMPRIMANTE PAR DEFAUT
WScript.sleep 1000
objNetwork.SetDefaultPrinter "\\chemin_souhaité\imprimante" --> Définie par défaut l'imprimante
end if

WScript.sleep 1000
```
Evidemment vous pouvez ajouté plusieurs imprimantes pour un seul et même groupe 
Exemple : 
```
'##### IMPRIMANTE 1 #####
on error resume next
if  isMember("NOM-DU-GROUPE") then
objNetwork.AddWindowsPrinterConnection "\\chemin_souhaité\imprimante" --> Chemin de l'imprimante
' METTRE L'IMPRIMANTE EN TANT QUE IMPRIMANTE PAR DEFAUT
WScript.sleep 1000
objNetwork.SetDefaultPrinter "\\chemin_souhaité\imprimante" --> Définie par défaut l'imprimante

WScript.sleep 1000

objNetwork.AddWindowsPrinterConnection "\\chemin_souhaité\imprimante2"--> Chemin de l'imprimante2
end if

WScript.sleep 1000
```

Pour ne pas ajouté une imprimante par défaut, il suffit de supprimer ces lignes :
```
' METTRE L'IMPRIMANTE EN TANT QUE IMPRIMANTE PAR DEFAUT
WScript.sleep 1000
objNetwork.SetDefaultPrinter "\\chemin_souhaité\imprimante"
```

Dans : 
```
'##### IMPRIMANTE 1 #####
on error resume next
if  isMember("NOM-DU-GROUPE") then
objNetwork.AddWindowsPrinterConnection "\\chemin_souhaité\imprimante"
' METTRE L'IMPRIMANTE EN TANT QUE IMPRIMANTE PAR DEFAUT
WScript.sleep 1000
objNetwork.SetDefaultPrinter "\\chemin_souhaité\imprimante"
end if
```

## Contact

  

Citar - [@CitarCil](https://twitter.com/CitarCil) - citarcilofficial@gmail.com



  
  
  
