file = open("./materials/normalForms.txt")
data = file.readlines()
for line in data:
    table_name = line.split("(")[0]
    attr1 = line.split(",")[0].split("(")[1]
    attr2 = line.split(",")[1].split(" ")[1].replace(")","")

    frtb = attr1.replace('_id', '')
    frtb2 = attr2.replace('_id', '')

    query = "CREATE TABLE "+table_name+" ("+attr1+" NUMBER, "+attr2+" NUMBER, CONSTRAINT "+table_name+"_primary PRIMARY KEY ( "+attr1+", "+attr2+"), CONSTRAINT "+table_name+"_foreign FOREIGN KEY ( "+attr1+" ) REFERENCES "+frtb+" ("+attr1+"), CONSTRAINT "+table_name+"_foreign_2 FOREIGN KEY ( "+attr2+" ) REFERENCES "+frtb2+"("+attr2+"));"
    print(query)
