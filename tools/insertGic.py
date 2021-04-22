from numpy import nan
import pandas as pd

df = pd.read_excel('tools\materials\GICS_map2018.xlsx', sheet_name=1)

gics = dict(
    IndustryId = 0,
    title = '',
    subId = 0,
    desc = ''
)

class Config:
    inid = 0
    title = ''
    subid = 0
    desc = ''

def formatInsert(gics):
    string = 'INSERT INTO gics VALUES ('+str(gics['IndustryId'])+', '+str(gics['subId'])+', \''+str(gics['title'])+'\', \''+str(gics['desc'])+'\');'
    print(string)

config = Config()
row = 0
for id in df["Industry"]:
    if(not pd.isna(id)):
        config.inid = id
        config.title = df['Unnamed: 1'][row]
        config.subid = df['Sub-Industry'][row]
        config.desc = df['Unnamed: 3'][row]
    else:
        config.subid = df['Sub-Industry'][row]
        config.desc = df['Unnamed: 3'][row]
    gics['IndustryId'] = int(config.inid)
    gics['title'] = str(config.title)
    gics['subId'] = int(config.subid)
    gics['desc'] = str(config.desc)
    formatInsert(gics)
    row += 1
