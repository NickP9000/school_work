import requests
"""
United Kingdom : 39548
Russian Federation : 35749
United States of America : 28719
Germany : 26241
Netherlands : 20643
Ukraine : 11856
Italy : 9707
India : 8488
Brazil : 5126
Malaysia : 4854
Mexico : 3306
Colombia : 2649
Chile : 2641
Canada : 1475
Peru : 1465
Australia : 1207
Pakistan : 323
Japan : 135
China : 40
Afghanistan : 0
Albania : 0
Algeria : 0
Andorra : 0
Angola : 0
Antigua and Barbuda : 0
Argentina : 0
Armenia : 0
Austria : 0
Azerbaijan : 0
Bahamas : 0
Bahrain : 0
Bangladesh : 0
Barbados : 0
Belarus : 0
Belgium : 0
Belize : 0
Benin : 0
Bhutan : 0
Bolivia : 0
Bosnia and Herzegovina : 0
Botswana : 0
Brunei Darussalam : 0
Bulgaria : 0
Burkina Faso : 0
Burundi : 0
Cambodia : 0
Cameroon : 0
Cape Verde : 0
Central African Republic : 0
Chad : 0
Comoros : 0
Congo (Brazzaville) : 0
Congo (Kinshasa) : 0
Costa Rica : 0
Croatia : 0
Cuba : 0
Cyprus : 0
Czech Republic : 0
Côte d'Ivoire : 0
Denmark : 0
Djibouti : 0
Dominica : 0
Dominican Republic : 0
Ecuador : 0
Egypt : 0
El Salvador : 0
Equatorial Guinea : 0
Eritrea : 0
Estonia : 0
Ethiopia : 0
Fiji : 0
Finland : 0
France : 0
Gabon : 0
Gambia : 0
Georgia : 0
Ghana : 0
Greece : 0
Grenada : 0
Guatemala : 0
Guinea : 0
Guinea-Bissau : 0
Guyana : 0
Haiti : 0
Holy See (Vatican City State) : 0
Honduras : 0
Hungary : 0
Iceland : 0
Indonesia : 0
Iran, Islamic Republic of : 0
Iraq : 0
Ireland : 0
Israel : 0
Jamaica : 0
Jordan : 0
Kazakhstan : 0
Kenya : 0
Kiribati : 0
Korea (South) : 0
Kuwait : 0
Kyrgyzstan : 0
Lao PDR : 0
Latvia : 0
Lebanon : 0
Lesotho : 0
Liberia : 0
Libya : 0
Liechtenstein : 0
Lithuania : 0
Luxembourg : 0
Macedonia, Republic of : 0
Madagascar : 0
Malawi : 0
Maldives : 0
Mali : 0
Malta : 0
Marshall Islands : 0
Mauritania : 0
Mauritius : 0
Micronesia, Federated States of : 0
Moldova : 0
Monaco : 0
Mongolia : 0
Montenegro : 0
Morocco : 0
Mozambique : 0
Myanmar : 0
Namibia : 0
Nepal : 0
New Zealand : 0
Nicaragua : 0
Niger : 0
Nigeria : 0
Norway : 0
Oman : 0
Palau : 0
Palestinian Territory : 0
Panama : 0
Papua New Guinea : 0
Paraguay : 0
Philippines : 0
Poland : 0
Portugal : 0
Qatar : 0
Republic of Kosovo : 0
Romania : 0
Rwanda : 0
Saint Kitts and Nevis : 0
Saint Lucia : 0
Saint Vincent and Grenadines : 0
Samoa : 0
San Marino : 0
Sao Tome and Principe : 0
Saudi Arabia : 0
Senegal : 0
Serbia : 0
Seychelles : 0
Sierra Leone : 0
Singapore : 0
Slovakia : 0
Slovenia : 0
Solomon Islands : 0
Somalia : 0
South Africa : 0
South Sudan : 0
Spain : 0
Sri Lanka : 0
Sudan : 0
Suriname : 0
Swaziland : 0
Sweden : 0
Switzerland : 0
Syrian Arab Republic (Syria) : 0
Taiwan, Republic of China : 0
Tajikistan : 0
Tanzania, United Republic of : 0
Thailand : 0
Timor-Leste : 0
Togo : 0
Tonga : 0
Trinidad and Tobago : 0
Tunisia : 0
Turkey : 0
Uganda : 0
United Arab Emirates : 0
Uruguay : 0
Uzbekistan : 0
Vanuatu : 0
Venezuela (Bolivarian Republic) : 0
Viet Nam : 0
Yemen : 0
Zambia : 0
Zimbabwe : 0
"""
response = requests.get("https://api.covid19api.com/summary")
data = response.json()
data = data["Countries"]

#for record in data["Countries"]:
    #print(record["Country"],":",record["NewConfirmed"])

def mergeSort(alist):
    #print("Splitting ",alist)
    if len(alist)>1:
        mid = len(alist)//2
        lefthalf = alist[:mid]
        righthalf = alist[mid:]
        
        #print("\tLeft half:",lefthalf)
        #print("\tRight half:",lefthalf)

        mergeSort(lefthalf)
        mergeSort(righthalf)

        i=0
        j=0
        k=0
        while i < len(lefthalf) and j < len(righthalf):
            if lefthalf[i]["NewConfirmed"] >= righthalf[j]["NewConfirmed"]:
                alist[k]=lefthalf[i]
                i=i+1
            else:
                alist[k]=righthalf[j]
                j=j+1
            k=k+1

        while i < len(lefthalf):
            alist[k]=lefthalf[i]
            i=i+1
            k=k+1

        while j < len(righthalf):
            alist[k]=righthalf[j]
            j=j+1
            k=k+1

mergeSort(data)
for record in data:
    print(record["Country"],":",record["NewConfirmed"])