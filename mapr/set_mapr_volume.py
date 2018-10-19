from subprocess import call

min_size = 100000000000  # 100GB

# get all volumes to disks.txt
f = open("disks.txt","w")
call(["lsblk","-b"],stdout=f)
f.close()

# extract volume biggers than 100GB
with open('disks.txt') as f:
    lines = f.readlines()

call(["rm","-f","disks.txt"])


available_disks = []
eligible = None
for line in lines:
    fields = filter(None,line.split(" "))
    try:
       name = fields[0]
       size = int(fields[3])
       type = fields[5]
    except:
       continue
    if type != "part" and eligible:
        available_disks.append(eligible)
    if size > min_size and type == "disk":
        eligible = name
    else:
        eligible = None

if len(available_disks) < 1:
    print("No disk available")
else:
    call(["sed","-i","s/CHANGEMEDISK/\/dev\/" + available_disks[0] + "/g","mapr/group_vars/all"])

