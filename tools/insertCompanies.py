from csv import reader
# open file in read mode

file = open("./tools/materials/indeed100.txt")
data = file.readlines()
count = 0
for line in data:
    line = line.split(',')
    company_column = line[3]
    web_column = line[2]
    summary_column = line[7]
    cname = company_column[company_column.find("company="):company_column.find(",")]
    website = web_column[web_column.find("href="):web_column.find(",")]
    cdesc = summary_column[summary_column.find("summary="):summary_column.find("]")]
    industryId = '451020'
    sub_industryId = '45102010'
    string = 'INSERT INTO company VALUES ('+str(count)+', \''+cname.strip("company=")+'\', \''+cdesc.strip("summary=")+'\', '+str(industryId)+', '+str(sub_industryId)+', \''+website.strip("website=")+'\');'
    print(string)
    count += 1