import sys

with open(sys.argv[1], "r") as in_file:
    data = in_file.read()
    data_into_list = data.split(",")

with open(sys.argv[2], "w") as out_file:
    out_file.write("{\n")
    for ss in data_into_list:
        if ss.startswith('set'):
            ss_split = ss.split(" ")
            ss0 = ss_split[0].replace("set(NWX_","\"")
            ss1 = ss_split[1].replace("v","")
            ss1 = ss1.replace(")","\",")
            ss1 = ss1.replace("x","13.8")
            if "]" in ss1:
                out_file.write(ss0.lower()+"\":\""+ss1.replace(",]",""))
            else:
                out_file.write(ss0.lower()+"\":\""+ss1+"\n")
    out_file.write("}")
