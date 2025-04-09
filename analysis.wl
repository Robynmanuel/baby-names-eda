(* ::Package:: *)

data= SemanticImport["C:\\Users\\Akande\\Downloads\\Popular_Baby_Names.csv"];


baby=data;


baby//Dimensions


GatherBy[baby, #Ethnicity&]


hispanicData=GatherBy[Select[baby,#Ethnicity=="HISPANIC"&],#Gender&]
