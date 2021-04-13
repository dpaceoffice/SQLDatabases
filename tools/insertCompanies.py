from csv import reader
# open file in read mode

file = open("./materials/indeed100.txt")
data = file.readlines()
count = 0
for line in data:

    cnameIndex = line.find("company=")
    cname = line[cnameIndex:line.find(",", cnameIndex)].replace('\'','')

    webIndex = line.find("href=")
    website = line[webIndex:line.find(",", webIndex)].replace('\'','')

    sumIndex = line.find("summary=")
    cdesc = line[sumIndex:line.find("]", sumIndex)].replace('\'','')

    industryId = '451020'
    sub_industryId = '45102010'
    string = 'INSERT INTO company VALUES ('+str(count)+', \''+str(cname.strip("company="))+'\', \''+str(cdesc.strip("summary="))+'\', '+str(industryId)+', '+str(sub_industryId)+', \''+str(website.strip("website="))+'\');'
    print(string)
    count += 1