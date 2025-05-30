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


lowrankFemales=Select[finalfemales, #Ethnicity=="HISPANIC" &&#Gender=="FEMALE" &&#Rank >77&]


BarChart[Tooltip[#["Rank"],#["Child's First Name"]<>" (Rank "<>ToString[#["Rank"]]<>")"]&
/@lowrankFemales,ChartStyle->"Rainbow",
AxesLabel->{"Name","Rank"},
PlotLabel->"The lowest rankings for Female Baby Names in the year 2011",ImageSize->Large]


data2012=Select[femalesorted,#["Ethnicity"]=="HISPANIC"&&#["Gender"]=="FEMALE"&&#["Year of Birth"]==2012&];


final2012females=DeleteDuplicatesBy[data2012,#["Child's First Name"]&];


highrank2012females= Select[final2012females, #Ethnicity=="HISPANIC"&&#Gender=="FEMALE"&&#Rank<20&]


BarChart[Tooltip[#["Rank"],#["Child's First Name"]<>" (Rank "<>ToString[#["Rank"]]<>")"]&
/@highrank2012females,ChartStyle->"Rainbow",
AxesLabel->{"Name","Rank"},PlotLabel->"The highest rankings for Female Baby Names in the year 2011",ImageSize->Large]
