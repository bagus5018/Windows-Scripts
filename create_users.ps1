### This script will import a list of users from a csv file to the active directory Users OU

#import required modules
Import-Module ActiveDirectory

#variables
$Path = "OU=Users,OU=DMC,DC=dmc,DC=local"
$CSV_Location = Get-ChildItem -path $PSScriptRoot\userlist.csv

#This section will import csv file from the location in $CSV_Loc
$UserList = Import-CSV $CSV_Location

#for loop assigns csv cells to user parameters
foreach ($User in $UserList)
{
$First = $User.First_Name
$Last = $User.Last_Name
$Name = $User.User_Name
$Badge = $User.badge

#create users with specified information
New-ADUser -Path $Path -DisplayName $Name  -Name $Name -GivenName $First -Surname $Last -Description "User" -EmployeeID $
}