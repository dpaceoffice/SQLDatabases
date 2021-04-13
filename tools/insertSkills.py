from csv import reader
# open file in read mode

with open('skill270.csv', 'r') as read_obj:
    # pass the file object to reader() to get the reader object
    csv_reader = reader(read_obj)
    # Iterate over each row in the csv using reader object
    count = 0
    for row in csv_reader:
        # row variable is a list that represents a row in csv
        skill_id = count
        title = row
        s_desc = 'NULL'
        s_level = 0
        string = 'INSERT INTO skill VALUES ('+str(skill_id)+', \''+str(title[0])+'\', \''+s_desc+'\', \''+str(s_level)+'\');'
        print(string)
        count += 1