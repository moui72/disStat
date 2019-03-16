import csv

rows = []
colnames = []
with open('mar5.data.csv', mode='r') as csv_file:
    csv_reader = csv.DictReader(csv_file)
    line_count = 0
    cols = ["V", "OBJ", "PP1"]

    for row in csv_reader:
        prosody = ""
        line_count += 1

        if row["STRONG"] in cols:
            prosody += row["STRONG"] + " > "

        for i in range(0, len(cols)):
            if (row[cols[i]] == "YES"
                    and cols[i] not in prosody):
                prosody += cols[i] + " "

        if (row["WEAK"] in cols and row["WEAK"] not in prosody):
            prosody += " > " + row["WEAK"]

        prosody = prosody.replace(">  >", ">")
        prosody = prosody.replace("  ", " ")
        prosody = prosody.strip()
        if len(prosody) > 0:
            if (prosody[0] == ">"):
                prosody = prosody[1:]
            if (prosody[-1] == ">"):
                prosody = prosody[:-1]
        row["prosody"] = prosody
        print row["prosody"]
        if(len(colnames) < 1):
            colnames = row.keys()
        rows.append(row.values())

with open('working_data_pyout.csv', 'wb') as csvfile:
    wrtr = csv.writer(csvfile, delimiter=',', quotechar='"',
                      quoting=csv.QUOTE_MINIMAL)
    wrtr.writerow(colnames)
    for row in rows:
        wrtr.writerow(row)

print 'Processed {} lines.'.format(line_count)
