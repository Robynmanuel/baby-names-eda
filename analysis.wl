(* ::Package:: *)

data= SemanticImport["C:\\Users\\Akande\\Downloads\\Popular_Baby_Names.csv"];


baby=data;


baby//Dimensions


GatherBy[baby, #Ethnicity&]


hispanicData=GatherBy[Select[baby,#Ethnicity=="HISPANIC"&],#Gender&]


femalehispanicData=Select[baby,#Ethnicity=="HISPANIC"&& #Gender=="FEMALE"&];


femalesorted=SortBy[femalehispanicData,#["Year Of Birth"]&];


data2011=Select[femalesorted,#["Ethnicity"]=="HISPANIC"&&#["Gender"]=="FEMALE"&&#["Year of Birth"]==2011&];


finalfemales=DeleteDuplicatesBy[data2011,#["Child's First Name"]&];


rankFemales=Select[finalfemales, #Ethnicity=="HISPANIC" &&#Gender=="FEMALE" &&#Rank <20&];


BarChart[Tooltip[#["Rank"],#["Child's First Name"]<>" (Rank "<>ToString[#["Rank"]]<>")"]&/@
rankFemales,ChartStyle->"Rainbow",AxesLabel->{"Name","Rank"},
PlotLabel->"The top 20 rankings for Female Baby Names in the year 2011",ImageSize->Large]
