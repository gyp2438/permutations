︠9c456373-7764-4461-b004-71e407ebad13s︠
load("rajchgot.sage")
︡d3d52ec2-d36f-4221-ba3e-19ac3b886796︡{"done":true}
︠05640c62-a2e2-4def-8206-6dc73bb3ffeds︠
raj(Permutation([2,7,6,4,8,3,1,9,5]))
︡65d05f0f-1809-4a80-adae-388acfb17d6f︡{"stdout":"24\n"}︡{"done":true}
︠816553cb-417b-4801-85cd-a9fa6b8417c4s︠
n= 9
u = Permutations(n).random_element()
v = Permutations(n).random_element()
︡3d36f7f6-fa20-47ed-b369-1d6540c65299︡{"done":true}
︠2eafdcfb-f33c-4741-8e7e-bd56209eae7cs︠
rajchgot_code(u)
︡03e122ee-d36e-418d-bb4d-952b13def23a︡{"stdout":"[6, 5, 5, 4, 3, 1, 2, 0, 0]\n"}︡{"done":true}
︠fc2d6e54-7940-48e5-9450-2fef24ac4eb3s︠
rajchgot_code(v)
︡956a19f1-3c33-4604-9911-458c093e93ba︡{"stdout":"[8, 6, 6, 5, 2, 3, 1, 0, 0]\n"}︡{"done":true}
︠2680aeab-00c2-4c76-b337-7b48a7375aeas︠
rajchgot_code(u*v)
︡2da6924c-05fa-4899-b61b-46237485eda0︡{"stdout":"[3, 6, 2, 2, 3, 3, 0, 0, 0]\n"}︡{"done":true}
︠5f594531-7bec-426b-afd5-febc7fe47109s︠
raj_stat(u)
︡9a94f33d-9fe1-4faa-aa5a-2b3799111f70︡{"stdout":"26\n"}︡{"done":true}
︠e6b37a69-af6b-41cf-b606-2650bfabea55s︠
raj_stat(v)
︡3057d9d5-8922-4a15-8da6-fe9dd5d4a7d4︡{"stdout":"31\n"}︡{"done":true}
︠7efbf139-5f15-4986-bf5a-c7bf45113714s︠
raj_stat(u*v)
︡ef0ca857-857a-40ea-ad1c-b3c8efebf072︡{"stdout":"19\n"}︡{"done":true}
︠6eebb87a-079c-48ac-a45f-42a194c15978︠

︡9abd0f4c-1994-48d9-ab9e-0f6957a9aff9︡
︠e9d240cd-abfc-41d3-9544-9e1a31bfcec6s︠
P = Permutations(5)
︡38ca4064-5264-487d-872e-35f790052216︡{"done":true}
︠834eae67-49a2-4ea8-be10-3ad44ba70ff2s︠
w = Permutation([3,1,5,2,4])
︡e5dd5078-9eac-45f9-ba18-0ecdfc96aee7︡{"done":true}
︠98f007f7-6bb4-4050-8758-9cc7e0b24c17s︠
len(w)
w(1)
︡e9720a9e-5e6e-4cf4-935b-c40d8102cda9︡{"stdout":"5\n"}︡{"stdout":"3\n"}︡{"done":true}
︠985be5b1-dc26-4ccd-b88c-28eb31610821s︠
def rajchgot_code(w):
    n = len(w)
    # For each j, stores the length of the longest increasing subsequence starting at index j (0-indexed)
    lis_starting_at = [-1]*n
    for ni in range(len(w)):
        i = n - ni # i is 1-indexed, so w(i) is the ith value of w
        rest = 0
        for j in range(i,n+1):
            if w(j) > w(i):
                rest = max(rest, lis_starting_at[j-1])
        lis_starting_at[i-1] = 1 + rest
    return [n - i - lis_starting_at[i] for i in range(n)]


def raj_stat(w):
    return(sum([i for i in rajchgot_code(w)]))

def raj_poly(n):
    q = var('q')
    return(sum([q^(raj_stat(w)) for w in Permutations(n)]))

︡4473abf2-3e9a-4e58-b8eb-754d4a638716︡{"done":true}
︠8c6a3dbf-438d-452e-ba8f-68f50d03c755s︠
def maj_code(w):
    des_indices = []
    for i in range(len(w)-1):
        if w(i+1) > w(i+2):
            des_indices.append(i)
    return [len([x for x in des_indices if x >= i]) for i in range(len(w))]
︡fd7824e8-8ad3-4852-a0dc-4f6ed35adcd5︡{"done":true}
︠827af956-0674-438b-a1e7-df845e1fb708s︠
ma7
︡7367fb2e-a810-49fd-8c8f-0119a1feb1d7︡{"stdout":"[2, 1, 1, 0, 0]\n"}︡{"done":true}
︠3c9c75f3-c7ad-4c24-88cc-b98550468960s︠
rajchgot_code(w)
︡e9332165-9392-425d-a74c-5b9822272491︡{"stdout":"[3, 1, 2, 0, 0]\n"}︡{"done":true}
︠14ddc15a-232a-4d60-94ed-cc04c7b01343︠
def raj_inv_sum(pi):
    raj = sum(rajchgot_code(pi))
    inv = pi.number_of_inversions()
    return raj-inv

def raj_inv(pi):
    raj = rajchgot_code

def raj_maj(pi):
    raj = rajchgot_code(pi)[0]
    maj = maj_code(pi)[0]
    return raj - maj



︡d5fb4473-57f8-43f2-b683-4cc17d2108f0︡{"done":true}
︠4e7a60b4-82d0-4d2b-b434-c244d97643ads︠
rajchgot_code(w)
︡2fb6f542-221f-4158-b9df-10480bcbf536︡{"stdout":"[3, 1, 2, 0, 0]\n"}︡{"done":true}
︠21ac2e16-e011-44d9-be5d-afeb211e2d73︠

︡ff85f39b-34e2-475c-9d78-2de7966c0e72︡
︠c5c0cd00-043b-4e32-b010-72d552a89077︠
︡6f989fa0-900a-44ea-a5e1-0d0a82efd0b4︡
︠e89f2e21-3d00-4e62-a9d0-c2009d45f69d︠
︡e1e18ac6-003f-49c0-b12a-1ba311d89cdf︡
︠20973b6b-38db-4792-ab3c-8196b6c499a6︠
︡1d303996-2276-4686-9a13-063da09bacae︡
︠7b2941be-a7d7-4706-bd83-5ab5877f4c97︠
︡c44a0fdb-bc69-4bf7-9880-8c4b53380be2︡
︠f3345edd-ff5d-4892-a12e-28672d03d865︠
︡0ea74602-eb1f-4497-9f98-ca4e4994488a︡
︠48e341fb-0b59-40bb-9b72-be6b5aa8459e︠
︡c78ee8f3-3acc-4389-bb70-0c94e284d763︡
︠e5a7ef37-fdd3-47f1-bf7b-882e91340fcf︠
︡85aee37d-4904-44cb-a8b9-f95afe6bfbd0︡
︠b6d00f4c-0d11-4314-aebd-1830b9914b5a︠
lem
︡5103a80c-d40e-4807-b9f5-674435fd33e0︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'code1' is not defined\n"}︡{"done":true}
︠9f6b84db-aa2c-4771-a34c-1b202590ca63s︠
test
︡fc8ea89b-5740-4167-a8d6-cc2f7e010a8f︡{"stdout":"[[[1, 2, 3, 4], 0], [[1, 2, 4, 3], 2], [[1, 3, 2, 4], 1], [[1, 3, 4, 2], 1], [[1, 4, 2, 3], 1], [[1, 4, 3, 2], 2], [[2, 1, 3, 4], 0], [[2, 1, 4, 3], 2], [[2, 3, 1, 4], 0], [[2, 3, 4, 1], 0], [[2, 4, 1, 3], 1], [[2, 4, 3, 1], 1], [[3, 1, 2, 4], 0], [[3, 1, 4, 2], 1], [[3, 2, 1, 4], 0], [[3, 2, 4, 1], 0], [[3, 4, 1, 2], 0], [[3, 4, 2, 1], 0], [[4, 1, 2, 3], 0], [[4, 1, 3, 2], 1], [[4, 2, 1, 3], 0], [[4, 2, 3, 1], 0], [[4, 3, 1, 2], 0], [[4, 3, 2, 1], 0]]\n"}︡{"done":true}
︠28a1d075-2027-4ac4-b042-7cce4de8957ds︠
for stat in test:
    if stat[1]==2:
        print(stat)
︡21313115-3e40-406d-911e-f31c79305fe0︡{"stdout":"[[1, 2, 4, 3], 2]\n[[1, 4, 3, 2], 2]\n[[2, 1, 4, 3], 2]\n"}︡{"done":true}
︠81d7e477-a8f6-403c-b245-c63dd99dcd42s︠
w.major_index()
︡91dd219f-9e50-4b29-9a95-97e04f16aec0︡{"stdout":"4\n"}︡{"done":true}
︠95ccd679-2989-4e8f-9e78-4c70511b9f83︠
w.to_major_



()
︡3a626d5b-5ec7-499f-99cc-d7415077d5c8︡{"stdout":"[2, 0, 1, 1, 0]\n"}︡{"done":true}
︠2c2c5179-acb1-48bb-b82f-d51551625fc2︠
︡353c7a66-2856-453f-8fda-c142b78ce7e2︡
︠16379e00-13a7-47ec-b7b6-be7bfe58b73es︠
w
︡db175129-3036-40dc-a596-248bf2b6437a︡{"stdout":"[3, 1, 5, 2, 4]\n"}︡{"done":true}
︠3411eb4e-f66c-4a99-b50a-4e5dcb0f633d︠
︡2b16442d-6c11-47d2-bef3-c738ced659b9︡
︠7eb1fc17-6a8d-4608-bc96-93b6bc18a736︠
︡aadcf689-bc43-4d90-b567-1ec3513e579e︡
︠779b5559-086d-4dc6-ba12-2d729bf36f71︠
︡2e8678c8-90ab-41e9-b272-aceaccd7ec5a︡
︠d95fbb41-9c5d-4f33-887d-46382c10060d︠
bb000-7dd2-400e-838f-06c6f93affe5
0729b-18bb-4c65-a621-70e62ea23384
0729b-18bb-4c65-a621-70e62ea23384
 w.to_major_code()
︡454fe000-0c9f-4dab-a381-1b5a16ffba67︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 1, in <listcomp>\nTypeError: unsupported operand type(s) for -: 'function' and 'int'\n"}︡{"done":true}
︠5db93032-c953-4727-b509-b968af404a44s︠
w.to_lehmer_code()

︡20fc9a4d-8888-4185-8b88-f226651bcce9︡{"stdout":"[2, 0, 2, 0, 0]\n"}︡{"done":true}
︠405b716d-685d-4a11-89d7-db328f877c89s︠
w.number_of_inversions()
︡705bdff0-2037-4f47-a6bc-ccecf01c793c︡{"stdout":"4\n"}︡{"done":true}
︠a0a2d4d1-cdd1-451e-987b-1e5c125bdeb8s︠
w.to_major_code()
︡b9bbc617-5a59-4b5d-a541-878b604fde72︡{"stdout":"[2, 0, 1, 1, 0]\n"}︡{"done":true}
︠23870868-6d14-44ef-9be5-37e4e699243c︠


︡687058ce-0f4e-4cfa-9097-11dde32b6dec︡{"done":true}
︠750d7665-e0d2-47ca-ab08-5645dc16a412︠
for s in Permutations(7):
    raj = rajchgot_code(s)
    code = s.to_lehmer_code()
    print("%s => %d" % (str(s), raj[0]-code[0]))
    
for s in Permutations(7):
    raj = rajchgot_code(s)
    code = s.to_lehmer_code()
    print("%s => %d" % (str(s), sum(raj)-sum(code)))









