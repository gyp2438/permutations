︠df89ff0b-d4a0-4729-afe7-d974f808a4f5s︠
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


def raj(w):
    return(sum([i for i in rajchgot_code(w)]))


def maj_code(w):
    des = w.descents(from_zero=True)
    mcode=[]
    for j in range(len(w)):
        m = [d for d in des if d >= j]
        mcode.append(len(m))
    return mcode
︡3138a64e-60ad-4c4c-83de-d865a584973a︡{"done":true}
︠9b02e299-3919-43bf-81d1-a2454d189dbds︠
def blob_set_partition(w):
    n = len(w)
    s = w.inverse()
    blob_array = []
    already_lassoed = [] # 1-indexed
    while(len(already_lassoed) < n):
        lasso = [] # 1-indexed
        for i in range(len(s)):
            if i + 1 in already_lassoed:
                continue
            eligible = True
            for j in range(i+1, len(s)):
                if j + 1 in already_lassoed:
                    continue
                if s(j+1) > s(i+1):
                    eligible = False
                    break
            if eligible:
                # i must be added to the next lasso
                lasso.append(i + 1)
        for row in lasso:
            already_lassoed.append(row)
        blob_array.append(lasso)
    return blob_array
︡dcd07b92-6955-47f3-9a33-d78b10b540ff︡{"done":true}
︠72021dbe-ed1e-4674-b82e-0b6ff8205310s︠

︡de3da5c3-d71d-4ec9-a18b-2685a0a1d652︡{"done":true}
︠abc0f053-e1aa-47d1-a8f6-129ce5d714ecs︠

︡db3a1809-94d2-471d-ae24-a571a636e0e0︡{"done":true}
︠024b63ba-e840-4ce7-a0ba-e23f1192d7ba︠


︡80c13d9a-9f7f-48c8-87d4-f0581bf6f0a9︡{"done":true}
︠024cebc7-f33f-4050-98ba-1912b794c73as︠
def almost_dom(n):
    almost=[]
    for w in Permutations(n):
        if raj(w)-w.number_of_inversions() == 1:
            almost.append(w)
    return almost

def dom(n):
    almost=[]
    for w in Permutations(n):
        if raj(w)-w.number_of_inversions() == 0:
            almost.append(w)
    return almost

def almost_fw(n):
    almost=[]
    for w in Permutations(n):
        if raj(w)-w.major_index() == 1:
            almost.append(w)
    return almost

#raj-maj <= 1
def almost_fw2(n):
    almost=[]
    for w in Permutations(n):
        if raj(w)-w.major_index() <= 1:
            almost.append(w)
    return almost

def firework(n):
    fw=[]
    for w in Permutations(n):
        if raj(w)-w.major_index() == 0:
            fw.append(w)
    return fw

def func(w):
    rcode = rajchgot_code(w)
    mcode = maj_code(w)
    for i in range(n):
        if rcode[i] != mcode[i]:
            break 
        else:
            #i = w.index(n)
            i=0
#     print(i)
    m=matrix(w)
#     print(m)
    r = list(range(n))
    c = list(range(n))
    r.remove(w[i]-1)
    c.remove(i)

#     print(r)
#     print(c)
    new_m = m.matrix_from_rows_and_columns(r,c)
#    print(new_m)
    sigma = Permutation([list(v).index(1)+1 for v in new_m.columns()])
    return sigma
        
︡7061e65c-ba89-4acd-ae7d-af0a87da6182︡{"done":true}
︠11814cb2-013d-4701-b3bd-06398fa69f68s︠
def a(n):
    return (binomial(2*n-1, n+2) - binomial(2*n-3, n+2))
def b(n):
    return (binomial(2*n-2,n+1) + binomial(2*n-3, n+1))
︡77237109-a2f6-4a5f-a5df-f0d3ce086f6c︡{"done":true}
︠ff08971b-595d-420c-ac10-f6d8ff23addcs︠
for i in range(2,10):
    print(a(i-1))
︡35e8e1b4-5380-49cb-b87a-0ae2106a1ee2︡{"stdout":"1\n0\n1\n7\n35\n156\n660\n2717\n"}︡{"done":true}
︠cef362cf-658b-43c9-be8b-3d1cf55644e1s︠
for i in range(2,10):
    print(b(i-1))
︡66cfb667-dd30-4f66-99f9-065b82c15cba︡{"stdout":"1\n0\n1\n7\n35\n156\n660\n2717\n"}︡{"done":true}
︠10d2c2c8-4207-4318-adfe-fc64fb12f526s︠
5*len(firework(4)) - len(firework(5)) == len(almost_fw(5))
︡8f6ac2a5-7118-487b-8066-f6800fb6b4bb︡{"stdout":"True\n"}︡{"done":true}
︠c57387bf-8fa2-42a0-a3a3-e701ae2e10bas︠
w =dom(5)[1]
︡ca2d961e-6970-4238-a84f-dc8e29f7c632︡{"done":true}
︠e4737161-d881-40b2-bede-f977bcd77421s︠
w.to_matrix()
︡745b2bbd-0cfa-4572-b149-8ac873158e1c︡{"stdout":"[0 1 0 0 0]\n[1 0 0 0 0]\n[0 0 1 0 0]\n[0 0 0 1 0]\n[0 0 0 0 1]\n"}︡{"done":true}
︠4a095ca3-6e90-4f5c-94c5-06102f5ca3c8s︠
almost_dom(5)[-1].to_matrix()
︡2c41fbec-ac19-4c4a-9b78-b6e17efb4750︡{"stdout":"[0 0 1 0 0]\n[0 0 0 0 1]\n[0 0 0 1 0]\n[0 1 0 0 0]\n[1 0 0 0 0]\n"}︡{"done":true}
︠1818c7df-7579-40eb-b9b0-34de4b78b546s︠
len(dom(5))
len(dom(6))
len(almost_dom(6))
︡512759b8-9b11-4589-bc2e-5e9f370a10da︡{"stdout":"42\n"}︡{"stdout":"132"}︡{"stdout":"\n"}︡{"stdout":"156"}︡{"stdout":"\n"}︡{"done":true}
︠31efc170-4ae7-4d17-8798-1096e668c88fs︠
288/42
︡adf00d17-292b-4224-8cd0-f502b2325812︡{"stdout":"48/7\n"}︡{"done":true}
︠d35c74c2-f565-4a45-a02c-74144f0933c2s︠
Permutation([1,4,3,2]).to_lehmer_code()
rajchgot_code(Permutation([1,4,3,2]))
︡24687e3c-1ab5-46c3-9692-09d35b7a98b3︡{"stdout":"[0, 2, 1, 0]\n"}︡{"stdout":"[2, 2, 1, 0]\n"}︡{"done":true}
︠d04e461e-ef02-446c-b514-94ccd8de913es︠
dom(3)
︡7b095b17-a656-4b92-b22f-5a2797adba62︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'dom' is not defined\n"}︡{"done":true}︡
︠5aac2e75-4db4-470c-bc97-6ecb79196d94s︠
almost_dom(4)
︡26b4cdf7-9d62-46fb-a3eb-73d4d63094f2︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'almost_dom' is not defined\n"}︡{"done":true}︡
︠d4b32580-fa24-4658-96ef-1ff0775c8da4s︠
catalan_number(5)
︡6c1295d0-46b0-4f4e-8864-99cbe88a9c94︡{"stdout":"42\n"}︡{"done":true}
︠a0409718-ec9e-4713-9385-3e6474936922s︠
for i in range(2,7):
    print(len(dom(i)), len(almost_dom(i+1)))
︡c77affe7-73f2-4270-8bee-5c7a9c9a7f8f︡{"stdout":"2 1\n5 7\n14 35\n42"}︡{"stdout":" 156\n132"}︡{"stdout":" 660\n"}︡{"done":true}
︠04882045-1581-445e-8d56-e5a5d36cf9a6s︠

len(dom(6))
︡b0b5645c-6b0d-4cb8-ba53-aa9f16f5e966︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'dom' is not defined\n"}︡{"done":true}︡
︠50d9e965-2bdf-4f50-ba9c-44b8fcc5c05a︠

︡77063053-eae9-4078-aa91-e9a01bb8b507︡
︠e6ce9677-8abe-417b-9227-a93144cd993es︠
n=5
Al_dom = almost_dom(n)
︡57a7ecab-bc7e-4797-bd74-76df7daf2de0︡{"stderr":"Error in lines 2-2\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'almost_dom' is not defined\n"}︡{"done":true}︡
︠495d2295-a7b2-4091-90ed-140246db7fe2︠

︡b492c2ec-ab26-4a70-9fc8-28e3b6ce759d︡
︠4c713727-74a5-497e-a356-a44493e21452s︠
w = Permutation([1,3,2,5,4])
w.to_lehmer_code()
rajchgot_code(w)
︡dfd28829-5e85-493d-bc17-54649d1bfb5e︡{"stdout":"[0, 1, 0, 1, 0]\n"}︡{"stdout":"[2, 2, 1, 1, 0]\n"}︡{"done":true}
︠71a16283-a46a-4b38-a42d-f7c137b7116cs︠
for w in Al_dom:
    print(w, w.to_lehmer_code(), rajchgot_code(w))
︡ed0f552f-39f0-41db-8dad-b0e3316d6078︡{"stdout":"[1, 3, 2, 4, 5] [0, 1, 0, 0, 0] [1, 1, 0, 0, 0]\n[1, 3, 4, 2, 5] [0, 1, 1, 0, 0] [1, 1, 1, 0, 0]\n[1, 3, 4, 5, 2] [0, 1, 1, 1, 0] [1, 1, 1, 1, 0]\n[1, 4, 2, 3, 5] [0, 2, 0, 0, 0] [1, 2, 0, 0, 0]\n[1, 5, 2, 3, 4] [0, 3, 0, 0, 0] [1, 3, 0, 0, 0]\n[2, 4, 1, 3, 5] [1, 2, 0, 0, 0] [2, 2, 0, 0, 0]\n[2, 4, 3, 1, 5] [1, 2, 1, 0, 0] [2, 2, 1, 0, 0]\n[2, 4, 3, 5, 1] [1, 2, 1, 1, 0] [2, 2, 1, 1, 0]\n[2, 4, 5, 1, 3] [1, 2, 2, 0, 0] [2, 2, 2, 0, 0]\n[2, 4, 5, 3, 1] [1, 2, 2, 1, 0] [2, 2, 2, 1, 0]\n[2, 5, 1, 3, 4] [1, 3, 0, 0, 0] [2, 3, 0, 0, 0]\n[2, 5, 3, 1, 4] [1, 3, 1, 0, 0] [2, 3, 1, 0, 0]\n[2, 5, 3, 4, 1] [1, 3, 1, 1, 0] [2, 3, 1, 1, 0]\n[3, 1, 4, 2, 5] [2, 0, 1, 0, 0] [2, 1, 1, 0, 0]\n[3, 1, 4, 5, 2] [2, 0, 1, 1, 0] [2, 1, 1, 1, 0]\n[3, 4, 1, 5, 2] [2, 2, 0, 1, 0] [2, 2, 1, 1, 0]\n[3, 5, 1, 2, 4] [2, 3, 0, 0, 0] [3, 3, 0, 0, 0]\n[3, 5, 2, 1, 4] [2, 3, 1, 0, 0] [3, 3, 1, 0, 0]\n[3, 5, 2, 4, 1] [2, 3, 1, 1, 0] [3, 3, 1, 1, 0]\n[3, 5, 4, 1, 2] [2, 3, 2, 0, 0] [3, 3, 2, 0, 0]\n[3, 5, 4, 2, 1] [2, 3, 2, 1, 0] [3, 3, 2, 1, 0]\n[4, 1, 3, 2, 5] [3, 0, 1, 0, 0] [3, 1, 1, 0, 0]\n[4, 1, 3, 5, 2] [3, 0, 1, 1, 0] [3, 1, 1, 1, 0]\n[4, 1, 5, 2, 3] [3, 0, 2, 0, 0] [3, 1, 2, 0, 0]\n[4, 2, 5, 1, 3] [3, 1, 2, 0, 0] [3, 2, 2, 0, 0]\n[4, 2, 5, 3, 1] [3, 1, 2, 1, 0] [3, 2, 2, 1, 0]\n[4, 3, 1, 5, 2] [3, 2, 0, 1, 0] [3, 2, 1, 1, 0]\n[4, 5, 1, 3, 2] [3, 3, 0, 1, 0] [3, 3, 1, 1, 0]\n[5, 1, 3, 2, 4] [4, 0, 1, 0, 0] [4, 1, 1, 0, 0]\n[5, 1, 3, 4, 2] [4, 0, 1, 1, 0] [4, 1, 1, 1, 0]\n[5, 1, 4, 2, 3] [4, 0, 2, 0, 0] [4, 1, 2, 0, 0]\n[5, 2, 4, 1, 3] [4, 1, 2, 0, 0] [4, 2, 2, 0, 0]\n[5, 2, 4, 3, 1] [4, 1, 2, 1, 0] [4, 2, 2, 1, 0]\n[5, 3, 1, 4, 2] [4, 2, 0, 1, 0] [4, 2, 1, 1, 0]\n[5, 4, 1, 3, 2] [4, 3, 0, 1, 0] [4, 3, 1, 1, 0]\n"}︡{"done":true}
︠4a8d4b14-e0ed-4f61-9b92-70690b9dc66a︠
)w
︡7c543f6e-8e9e-4852-a00d-65b9d5756117︡{"stdout":"[1, 3, 2, 4]\n"}︡{"done":true}
︠e0f4df51-b2a3-4780-969b-750f023c841bs︠
#check
n*len(Bn1) - len(Bn) == len(almost_firework)
︡1345e6b8-2a05-4068-8201-828cedeb2eba︡{"stdout":"True\n"}︡{"done":true}
︠aab74cb1-281a-426f-9247-005d54bdcc11︠
for fw in Bn1:
    i=0
    for w in all_almost_fw:
        if func(w) == fw:
            i=i+1 
    if i!=8:
        print(fw,w)
        break
print('Done')
︡fb808d94-a689-4e7f-be8c-f20a25e34fd1︡
︠e07f94a7-12d2-4de5-a697-e4467f9d8659s︠

print(all(raj(func(w)) - func(w).major_index() ==0 for w in all_almost_fw))
︡1e029390-1f0a-427c-b21f-7cf6eaf2d126︡{"stdout":"True"}︡{"stdout":"\n"}︡{"done":true}
︠acbbefe3-f08e-4520-8935-6a44afd3ac1e︠

︡4d264d32-2f8d-4f6d-9f31-4b9073e7742e︡
︠9296e032-66d4-4a5a-be1b-b30b2be90659s︠
test=Permutation([1,5,2,3,4,7,6])
func(test)
rajchgot_code(test)
maj_code(w)
︡3a670029-4cd4-4a56-a013-031e96c02396︡{"stdout":"[1, 2, 3, 4, 6, 5]\n"}︡{"stdout":"[2, 4, 1, 1, 1, 1, 0]\n"}︡{"stdout":"[5, 4, 4, 3, 2, 1, 0]\n"}︡{"done":true}
︠fcf394bc-fd00-4837-8c05-c354e629e72f︠

︡aa098364-b184-4f4c-8bd5-d993621f175b︡{"stdout":"[1, 2, 3, 4, 6, 5]\n"}︡{"done":true}
︠1914aa8e-e4a6-4905-b707-fc3a4755946es︠
for w in almost_firework:
    if func(w) == Bn1[1]:
        print(w, [rajchgot_code(w)[j]- maj_code(w)[j] for j in range(n)], func(w))
︡d4f9d5d8-0ac3-409c-9498-14c5f5580e09︡{"stdout":"[1, 2, 3, 7, 4, 6, 5] [0, 0, 0, 1, 0, 0, 0] [1, 2, 3, 4, 6, 5]\n[1, 2, 5, 3, 4, 7, 6] [0, 0, 1, 0, 0, 0, 0] [1, 2, 3, 4, 6, 5]\n[1, 2, 6, 3, 4, 7, 5] [0, 0, 1, 0, 0, 0, 0] [1, 2, 3, 4, 6, 5]\n[1, 4, 2, 3, 5, 7, 6] [0, 1, 0, 0, 0, 0, 0] [1, 2, 3, 4, 6, 5]\n[3, 1, 2, 4, 5, 7, 6]"}︡{"stdout":" [1, 0, 0, 0, 0, 0, 0] [1, 2, 3, 4, 6, 5]\n"}︡{"done":true}
︠9458360f-e4ed-48e3-90b8-0767687b017as︠

︡06309cf3-1aa4-43bf-b152-031755640712︡{"done":true}
︠9a4f6283-a43d-4c82-b61b-44ca1e0460f0s︠
for w in all_almost_fw:
    if func(w) == Bn1[-10]:
        print(w, raj(w)-w.major_index(), func(w))
︡e6b017f6-caff-4a4a-800d-301b356802f2︡{"stdout":"[1, 6, 5, 2, 7, 4, 3]"}︡{"stdout":" 0 [5, 4, 1, 6, 3, 2]\n[2, 6, 5, 1, 7, 4, 3]"}︡{"stdout":" 0 [5, 4, 1, 6, 3, 2]\n[3, 6, 5, 1, 7, 4, 2]"}︡{"stdout":" 0 [5, 4, 1, 6, 3, 2]\n[4, 6, 5, 1, 7, 3, 2]"}︡{"stdout":" 0 [5, 4, 1, 6, 3, 2]\n[5, 6, 4, 1, 7, 3, 2]"}︡{"stdout":" 0 [5, 4, 1, 6, 3, 2]\n[6, 5, 4, 1, 7, 3, 2] 0 [5, 4, 1, 6, 3, 2]\n[7, 5, 4, 1, 6, 3, 2]"}︡{"stdout":" 1 [5, 4, 1, 6, 3, 2]\n"}︡{"done":true}
︠268af53f-261f-4686-978b-9102e6fe95f4s︠
len(almost_firework)
len(fw)
︡fd1db537-c0be-48d9-8b10-58fed9703900︡{"stdout":"544\n"}︡{"stdout":"52\n"}︡{"done":true}
︠f96eb13e-1e6a-4e22-be1b-2675bd25e0cbs︠
n*len(fw) - len(firework(n))
︡02af190e-63f7-4ff0-8faf-95c85ad5dfd5︡{"stdout":"544"}︡{"stdout":"\n"}︡{"done":true}
︠c38489be-b221-4945-8b00-43e09854664fs︠
add([x^raj(w) for w in Permutations(4)])
︡b7cc4a8f-f413-42e0-bcd6-611981d41693︡{"stdout":"x^6 + 6*x^5 + 6*x^4 + 6*x^3 + 3*x^2 + x + 1\n"}︡{"done":true}
︠1682e1c0-bf45-42e5-97c2-649564c82915s︠
def F(n):
    return add([x^raj(w) for w in Permutations(n)])
︡2a7c84c1-d5cb-4671-ab4a-436675dee380︡{"done":true}
︠bbb7b28a-2f6c-4665-8913-1612cdb1bfdas︠
def G(n):
    return add([x^(raj(w)-len(w.inversions())) for w in Permutations(n)])
︡76e3d542-8f52-48e3-b54a-94b3e3f4c10b︡{"done":true}
︠09d2291e-d560-4b64-a415-8666e1933a13s︠
def H(n):
    return add([x^(raj(w)-w.major_index()) for w in Permutations(n)])
︡0fd57ee5-3e01-4259-be41-45869316dde2︡{"done":true}
︠c63213ee-b945-45d6-9849-75e5c31df77ds︠
G(2)
︡f5ece6cf-ac7b-4134-a812-ae9e2a7d7130︡{"stdout":"2\n"}︡{"done":true}
︠2029f208-dd00-42c8-8590-940e075f34efs︠
def a(n):
    return catt(n+1)*n*(1+3*n)/(6+2*n)
︡faae25f1-4cc5-41b4-9e11-b91f44cf1a51︡{"done":true}
︠a61ed0ab-bde5-4637-9ce7-70a55587618bs︠
def catt(n):
    return binomial(2*n,n)/(n+1)
︡f394c841-f537-4322-ad35-9a5662ba05e1︡{"done":true}
︠aed8a67d-648d-4302-b749-95293c4e2936s︠
a(2)
︡b0e7eca3-c5cc-409d-b2c2-b89b6ac5f791︡{"stdout":"7\n"}︡{"done":true}
︠4829c752-68fb-4699-9f9b-e68afeb57ff0s︠
G(3)
︡b3f8e6e9-437e-49c9-b24b-7201bef6176e︡{"stdout":"x + 5\n"}︡{"done":true}
︠3be7da30-79da-4a11-988e-79c6939e3b10s︠
G(4)
︡e50c2e42-2667-4d26-abf9-3902c4dd34a2︡{"stdout":"3*x^2 + 7*x + 14\n"}︡{"done":true}
︠45410977-99a8-43c5-bcf2-4ebbf42ae15as︠
a(3)
︡4d150006-68b6-45fd-97d5-14a157f6fb72︡{"stdout":"35\n"}︡{"done":true}
︠32b18a46-362a-4fa2-8e89-9579fa85fabas︠
G(5)
︡00cc6f83-1fb9-4ffd-abbe-e94f3872b873︡{"stdout":"3*x^4 + 12*x^3 + 28*x^2 + 35*x + 42\n"}︡{"done":true}
︠bccdbdf6-710d-46cc-a6d9-fb91fb52598bs︠
G(6)
︡47f645ba-a030-482e-83a3-1e38b6b75057︡{"stdout":"x^7 + 12*x^6 + 32*x^5 + 84*x^4 + 132*x^3 + 171*x^2 + 156*x + 132\n"}︡{"done":true}
︠f4522735-6da3-48ad-829f-b45779f6e751s︠
G(7)
︡2da17468-c31c-4344-a915-d9f28e419200︡{"stdout":"4*x^10 + 23*x^9 + 78*x^8 + 188*x^7 + 387*x^6 + 607*x^5 + 849*x^4 + 922*x^3 + 893*x^2 + 660*x + 429"}︡{"stdout":"\n"}︡{"done":true}
︠28878096-45f5-4857-9b6a-0a95c952ff73s︠
G(5)
H(2)
︡a8774e10-f5ad-46b8-bc96-845523fca3aa︡{"stdout":"3*x^4 + 12*x^3 + 28*x^2 + 35*x + 42\n"}︡{"stdout":"2\n"}︡{"done":true}
︠e80d14f5-bed8-4e6b-bbfb-1142328bcb97s︠
H(3)
︡1a453d5d-1568-4134-9ff3-72eb320ca574︡{"stdout":"x + 5\n"}︡{"done":true}
︠3d6ca1c3-a608-408c-a244-68d542e12856s︠
H(4)
︡d10e2395-50a7-4429-8197-d9761804ad41︡{"stdout":"4*x^2 + 5*x + 15\n"}︡{"done":true}
︠4125dc8b-45f7-4a31-9401-2903fdf53649s︠
H(5)
︡b41ed962-9e6d-4a2d-918d-060eb98b9112︡{"stdout":"5*x^4 + 16*x^3 + 24*x^2 + 23*x + 52\n"}︡{"done":true}
︠68c605fc-1965-4e3f-a609-29fd5b6dfb05s︠
H(6)
︡7505f865-5f8c-4c0e-9025-d2ce0ebda631︡{"stdout":"2*x^7 + 28*x^6 + 35*x^5 + 102*x^4 + 113*x^3 + 128*x^2 + 109*x + 203"}︡{"stdout":"\n"}︡{"done":true}
︠054ec450-87e8-4cab-9014-27d964649754s︠
H(7)
︡8a61db65-98c6-449e-acae-4c32f5b3c741︡{"stdout":"14*x^10 + 59*x^9 + 167*x^8 + 240*x^7 + 417*x^6 + 598*x^5 + 746*x^4 + 689*x^3 + 689*x^2 + 544*x + 877"}︡{"stdout":"\n"}︡{"done":true}
︠0c1c08ea-cded-4fd5-951a-0dc5c4751cccs︠
H(8)
︡e43ce375-39b2-4442-9c81-c3bc9eb5ca5f︡{"stdout":"34*x^14 + 122*x^13 + 442*x^12 + 633*x^11 + 1456*x^10 + 1970*x^9 + 2912*x^8 + 3295*x^7 + 4808*x^6 + 4737*x^5 + 4885*x^4 + 4165*x^3 + 3845*x^2 + 2876*x + 4140"}︡{"stdout":"\n"}︡{"done":true}
︠17157a62-e9b0-498a-bb69-071cacbbeef8︠

︡513e45d0-1f23-4573-a299-14ac8c1a9a46︡
︠08e5d56d-0501-4cf6-947e-c7558d03ff68s︠
G(2).diff(x).subs(x=1)
︡c8060e48-c787-445c-885d-7d526e8d6d5c︡{"stdout":"0\n"}︡{"done":true}
︠05d5d2f4-d313-4397-a12d-f87a73c5a401s︠
G(3).diff(x).subs(x=1)
︡fd2aab2a-1eb1-4e76-a6bc-618e00ade9e1︡{"stdout":"1\n"}︡{"done":true}
︠1a9bfd31-5b15-4015-863f-8e776e369661s︠
G(4).diff(x).subs(x=1)
︡5892f3b3-1503-4bbf-ae7a-997130fe5232︡{"stdout":"13\n"}︡{"done":true}
︠0bfb2c76-c0a8-4904-86a8-4f5d34bcdecas︠
G(5).diff(x).subs(x=1)
︡aac8140d-80ce-4bb0-9837-bd3f2a07947f︡{"stdout":"139\n"}︡{"done":true}
︠2f611a30-c05e-4951-8b30-b8f7b373b3a5s︠
G(6).diff(x).subs(x=1)
︡cb8dceaf-e82b-4972-9f72-9bfa047ae388︡{"stdout":"1469\n"}︡{"done":true}
︠7d78fa22-1fd7-4452-8fa6-5f1750117a40︠

︡92a0c253-7c35-49bf-a4c3-e1369ae5abd1︡
︠25c24524-8f1e-400e-8015-9fdff3335b8b︠

︡4de72dcd-d313-4522-9d4b-43d15579bc61︡
︠8432aea5-fcea-45fe-aed2-795f385623d4︠

︡0bfd3a3c-d98a-45ed-8374-90e5989d1650︡
︠7a3fa3bd-3eed-49b6-b190-6ac5d361081d︠

︡329c8001-50fe-4339-a8b4-a5bb4e9cfe18︡
︠80d71f5c-0c9b-47d1-97d7-75db28a411b7s︠
add([x^(raj(w)-len(w.inversions())) for w in Permutations(3)])
︡63041be7-a1bd-4db3-a9fe-7e5b91512760︡{"stdout":"x + 5\n"}︡{"done":true}
︠7f5d635c-0638-46a5-8312-eee9e6247fa5s︠
add([x^(raj(w)-w.major_index()) for w in Permutations(3)])
︡6ceb9fca-3983-4838-9f3b-9dde9088dad0︡{"stdout":"x + 5\n"}︡{"done":true}
︠ccd11622-74e8-42e3-8251-45dec6ca0c8bs︠
add([x^(raj(w)-w.major_index()) for w in Permutations(4)])
︡40ce4c53-a1bd-4e4e-83ee-3e0cab97aba0︡{"stdout":"4*x^2 + 5*x + 15\n"}︡{"done":true}
︠1fa2306b-89ad-4d9d-a59e-66e45564635e︠

︡fe387fd1-db28-4cb7-8834-5e266314cade︡
︠f399e32f-09f3-46cd-9fb2-4fb32619251es︠
add([x^(raj(w)-w.major_index()) for w in Permutations(5)])
︡4569f303-b168-4725-a949-8fb4a1881f61︡{"stdout":"5*x^4 + 16*x^3 + 24*x^2 + 23*x + 52\n"}︡{"done":true}
︠69fe95a0-ba4c-4227-8f50-301fc5e66e3ds︠
add([x^(raj(w)-w.major_index()) for w in Permutations(6)])
︡24a0d6a4-5201-4f52-b6b4-8142d42bc371︡{"stdout":"2*x^7 + 28*x^6 + 35*x^5 + 102*x^4 + 113*x^3 + 128*x^2 + 109*x + 203\n"}︡{"done":true}
︠6b946057-a7a1-49b9-96c4-c5088541f988s︠
add([x^(raj(w)-w.major_index()) for w in Permutations(7)])
︡70899d6f-da6d-4b67-9f11-8375f4647d44︡{"stdout":"14*x^10 + 59*x^9 + 167*x^8 + 240*x^7 + 417*x^6 + 598*x^5 + 746*x^4 + 689*x^3 + 689*x^2 + 544*x + 877"}︡{"stdout":"\n"}︡{"done":true}
︠cbdceded-d0f4-45a2-86f0-7c156894568es︠
add([x^(raj(w)-w.major_index()) for w in Permutations(8)])
︡3be44966-8e02-45de-85cb-ffc13f6a1302︡{"stdout":"34*x^14 + 122*x^13 + 442*x^12 + 633*x^11 + 1456*x^10 + 1970*x^9 + 2912*x^8 + 3295*x^7 + 4808*x^6 + 4737*x^5 + 4885*x^4 + 4165*x^3 + 3845*x^2 + 2876*x + 4140"}︡{"stdout":"\n"}︡{"done":true}
︠38119d2c-1d89-49a1-bde3-221ab8e342d5s︠
add([x^(raj(w)-len(w.inversions())) for w in Permutations(4)])
︡17cfdfa7-847e-45cd-a9cd-6b9632946cfa︡{"stdout":"3*x^2 + 7*x + 14\n"}︡{"done":true}
︠22973ed7-7baf-403b-bb17-eb2459a29df6s︠
add([x^(raj(w)-len(w.inversions())) for w in Permutations(5)])
︡daf9dd77-1199-4c8c-a901-8961038cf6ae︡{"stdout":"3*x^4 + 12*x^3 + 28*x^2 + 35*x + 42\n"}︡{"done":true}
︠439417d3-9b53-49d9-9764-c488cc275425s︠
add([x^(raj(w)-len(w.inversions())) for w in Permutations(6)])
︡48fe10a1-10a7-4988-8a9f-2569560e686e︡{"stdout":"x^7 + 12*x^6 + 32*x^5 + 84*x^4 + 132*x^3 + 171*x^2 + 156*x + 132\n"}︡{"done":true}
︠f68b7564-17fc-4141-abb2-eeaaa45b6dbbs︠
add([x^(raj(w)-len(w.inversions())) for w in Permutations(7)])
︡55045a81-8854-47b0-bb27-121638ed05c9︡{"stdout":"4*x^10 + 23*x^9 + 78*x^8 + 188*x^7 + 387*x^6 + 607*x^5 + 849*x^4 + 922*x^3 + 893*x^2 + 660*x + 429"}︡{"stdout":"\n"}︡{"done":true}
︠31d598e0-f521-4557-84fa-37b0978d8667s︠
add([x^(raj(w)-len(w.inversions())) for w in Permutations(8)])
︡1e4b454d-842e-4863-81bb-4be56c997b84︡{"stdout":"6*x^14 + 33*x^13 + 131*x^12 + 342*x^11 + 811*x^10 + 1559*x^9 + 2644*x^8 + 3852*x^7 + 5141*x^6 + 5853*x^5 + 6094*x^4 + 5392*x^3 + 4315*x^2 + 2717*x + 1430"}︡{"stdout":"\n"}︡{"done":true}
︠e962b809-e818-4e00-878e-a122c0b15eeas︠
add([x^(raj(w)-len(w.inversions())) for w in Permutations(9)])
︡d606bb04-248b-4b77-9677-4ef217a29aa2︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 1, in <listcomp>\n  File \"\", line 2, in raj\n  File \"/ext/sage/9.6/local/var/lib/sage/venv-python3.10.3/lib/python3.10/site-packages/sage/misc/functional.py\", line 576, in symbolic_sum\n    return sum(expression, *args)\n  File \"src/cysignals/signals.pyx\", line 310, in cysignals.signals.python_check_interrupt\nKeyboardInterrupt\n"}︡{"done":true}
︠03f3ef90-3156-4d1b-b96e-e664b6e163f5s︠
156/2
︡93f4d8b7-9a34-41d8-9ec2-a522c3e2f097︡{"stdout":"78\n"}︡{"done":true}
︠3d58778e-55e6-483f-9745-a176c0aa7da1s︠

2717/14
︡1c524458-a80b-48c0-a5ea-bf96b8464ec7︡{"stdout":"2717/14\n"}︡{"done":true}
︠aafb5819-8a11-4982-9cf4-76193095c85fs︠
len(all)
︡11515d04-69a8-4334-902f-100c6b368c58︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nTypeError: object of type 'builtin_function_or_method' has no len()\n"}︡{"done":true}
︠853d5def-3780-4aa6-8de3-f17dae6c7c16s︠
all
︡53fefc2a-5761-4c80-be8b-016a96055f49︡{"stdout":"<built-in function all>\n"}︡{"done":true}
︠beffd439-cc3e-4a61-9373-3ba5b330cd58s︠
i=0
for s in all:
    if s == [3,1]:
        i= i+1
︡4cedd2ce-9c4f-49d7-937a-94dfc47a3fdc︡{"stderr":"Error in lines 2-4\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nTypeError: 'builtin_function_or_method' object is not iterable\n"}︡{"done":true}
︠da9a43a8-c4ee-4dc2-879d-5edf65a3e9ads︠
i
︡f80840d0-40ab-45c3-890f-136e71c6b588︡{"stdout":"0\n"}︡{"done":true}
︠c921c36b-d18f-4a1d-8867-d92a7bcf78c7s︠
def fireworks_phi(w):
    B = blob_set_partition(w)
    return Permutation([y for lasso in B[::-1] for y in lasso[::-1]])

# Does not assume sp is sorted
def fireworks_of_blob(sp):
    unsorted_blob = [sorted(list(s)) for s in sp]
    sorted_blob = sorted(unsorted_blob, key=lambda ls: -max(ls))
    return Permutation([y for lasso in sorted_blob[::-1] for y in lasso[::-1]])
︡4ae53236-2768-4c1a-bdfd-95df0c621b6c︡{"done":true}
︠d13c8d91-ec80-41c4-a343-881c9b271137s︠

︡97e2d13a-3d83-4052-a676-68c5ec11f91d︡{"done":true}
︠d5e7a710-b7fc-45bb-a26f-bc69fc268aecs︠
# trying to get sum q^raj(w) over fireworks permutations
def FP(n):
    tot = 0
    for pi in SetPartitions(n):
        tot += x^(raj(fireworks_of_blob(pi)))
    return tot

def FP2(n):
    tot = 0
    for pi in SetPartitions(n):
        tot += x^(raj(fireworks_of_blob(pi).inverse()))
    return tot

︡2bd98cac-ea57-4d78-a3bd-600fdfa43bed︡{"done":true}
︠36c57487-b586-47cc-ae2c-7433233f04b9s︠
@cached_function
def qBell(n):
    if n== 0:
        return 1
    else:
        return add([x^(i)*binomial(n-1,i)*qBell(i) for i in range(n)]).expand()
︡09f02361-54d1-432d-81fd-64a01d8c831e︡{"done":true}
︠950e66d2-f1d4-46ab-8c1d-b983a7c49684s︠

qBell(3).expand()
︡d54d84f7-aa42-4e60-a017-56ce3e78a7aa︡{"stdout":"x^3 + x^2 + 2*x + 1\n"}︡{"done":true}
︠a568fec6-1f69-4a69-a110-11fb89140cf9s︠
FP(3)
︡bce3a103-9555-42e2-9074-67611c0067c8︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'FP' is not defined\n"}︡{"done":true}︡
︠bfdd18ba-d6c3-4268-bade-5300a3b0ae14s︠
def FPstat(n):
    tot = 0
    for pi in SetPartitions(n):
        print('%s  =>  %s' % (pi, binomial(n,2)-raj(fireworks_of_blob(pi))))
#        print(pi, binomial(n,2)-raj(fireworks_of_blob(pi)))
    #return tot
︡c9f99f3f-6a13-469b-aead-4fdfaacdc096︡{"done":true}
︠e85d20e2-c1e7-427b-a8b3-36e0e3dfdbd0s︠
raj(Permutation([5,1,6,4,3,8,9,7,2]))
︡1917a7b2-a19b-4b9a-a673-6751b0c70eca︡{"stdout":"23\n"}︡{"done":true}
︠e29ff557-6d2f-4a3b-a435-be317f461ebcs︠

︡b358895f-f9ae-4392-9e0d-302d9528ec7b︡{"done":true}
︠6ad3ccbc-3d53-4fb9-a154-bcdff2599411︠
︡3c1347a6-8375-43bb-9334-fd9e2ddc1918︡
︠56a3a271-9749-4e5e-8920-d465b64b4f07s︠
rajchgot_code(Permutation([4,8,1,2,5,7,6,3]).inverse())
︡67d3daa6-c46e-41fc-8344-257e2fbb6e3d︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'rajchgot_code' is not defined\n"}︡{"done":true}︡
︠dbe7c438-6ecf-4af6-86da-0a98a005beb7s︠
FPstat(2)
︡d2636c48-4287-4d13-9773-9671c30eea35︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 4, in FPstat\nNameError: name 'raj' is not defined\n"}︡{"done":true}︡
︠78e3946f-084c-470c-bc4f-3ef458948c45s︠
FPstat(4)
︡9918085e-650b-4b14-876a-89f3db3e2459︡{"stdout":"{{1, 2, 3, 4}}  =>  0\n{{1, 2, 3}, {4}}  =>  3\n{{1, 2, 4}, {3}}  =>  1\n{{1, 2}, {3, 4}}  =>  2\n{{1, 2}, {3}, {4}}  =>  5\n{{1, 3, 4}, {2}}  =>  1\n{{1, 3}, {2, 4}}  =>  2\n{{1, 3}, {2}, {4}}  =>  4\n{{1, 4}, {2, 3}}  =>  2\n{{1}, {2, 3, 4}}  =>  1\n{{1}, {2, 3}, {4}}  =>  4\n{{1, 4}, {2}, {3}}  =>  3\n{{1}, {2, 4}, {3}}  =>  3\n{{1}, {2}, {3, 4}}  =>  3\n{{1}, {2}, {3}, {4}}  =>  6\n"}︡{"done":true}
︠84e28c05-2471-49de-a7e0-cae7738974dfs︠
FPstat(4)
︡ab30814d-fc9f-4658-9925-e3866b5b56d7︡{"stdout":"{{1, 2, 3, 4}}  =>  0\n{{1, 2, 3}, {4}}  =>  3\n{{1, 2, 4}, {3}}  =>  1\n{{1, 2}, {3, 4}}  =>  2\n{{1, 2}, {3}, {4}}  =>  5\n{{1, 3, 4}, {2}}  =>  1\n{{1, 3}, {2, 4}}  =>  2\n{{1, 3}, {2}, {4}}  =>  4\n{{1, 4}, {2, 3}}  =>  2\n{{1}, {2, 3, 4}}  =>  1\n{{1}, {2, 3}, {4}}  =>  4\n{{1, 4}, {2}, {3}}  =>  3\n{{1}, {2, 4}, {3}}  =>  3\n{{1}, {2}, {3, 4}}  =>  3\n{{1}, {2}, {3}, {4}}  =>  6\n"}︡{"done":true}
︠1419d12f-00e9-4739-a1e6-b545a2b5b0d5s︠
FPstat2(4)
︡38f3b8c0-bc33-4419-96d8-d782bab92fa7︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'FPstat2' is not defined\n"}︡{"done":true}
︠3cb47e8d-6c47-4651-9e95-2a45119965e7s︠

︡13fba1c5-8065-4432-9f45-aaabd210d05b︡{"done":true}
︠c106b1ae-ef19-48b3-8102-b43268f34a21s︠
FP(7)
︡879ea18c-0946-4648-a7c8-8b2df4fe89f6︡{"stdout":"x^21 + 6*x^20 + 15*x^19 + 35*x^18 + 55*x^17 + 71*x^16 + 90*x^15 + 101*x^14 + 100*x^13 + 89*x^12 + 82*x^11 + 68*x^10 + 53*x^9 + 38*x^8 + 26*x^7 + 20*x^6 + 12*x^5 + 7*x^4 + 4*x^3 + 2*x^2 + x + 1"}︡{"stdout":"\n"}︡{"done":true}
︠1f8ef75e-f212-4530-aa97-1738b88f79f4s︠
SetPartitions(4)[0]
︡95017ade-d1f7-4b45-aa68-05d8463951b9︡{"stdout":"{{1, 2, 3, 4}}\n"}︡{"done":true}
︠48595d41-9cc9-4804-a96b-efdd399b5bce︠
︡012e552e-ba8c-46d8-b624-1ff9673324f6︡
︠2c98a7ca-23ad-467c-87d3-ae320ed12d82s︠
fw=[]
for pi in SetPartitions(4):
    fw.append(fireworks_of_blob(pi))
    
︡52f72bd3-aaf1-4251-84fa-7fa498718c36︡{"done":true}
︠2a33270d-234e-48b5-906b-4a46cad9501ds︠
for w in fw:
    w.major_index() == raj(w)
︡ee49a2fe-7815-4896-bb3e-1fd55f37c8d9︡{"stdout":"True\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\n"}︡{"done":true}
︠a2aa0758-9030-4e5e-9117-7e2b4ecf07c7s︠
for w in fw:
    print(raj(w), raj(w.inverse()))
︡04290bc4-a666-461b-9d88-ee19b089d5b8︡{"stdout":"6 6\n3 3\n5 5\n4 4\n1 1\n5 5\n4 4\n2 2\n4 4\n5 5\n2 2\n3 3\n3 3\n3 3\n0 0\n"}︡{"done":true}
︠4e197bbc-f2f7-48c5-9bbd-f992957ca323︠

︡fa7b1b4f-dfbf-43e4-8e4c-f1dccb56c003︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 2, in fireworks_phi\n  File \"\", line 2, in blob_set_partition\nTypeError: object of type 'sage.rings.integer.Integer' has no len()\n"}︡{"done":true}
︠d9a2747a-0c2f-4a33-89d8-fd1feccc8499s︠
w=SetPartitions(5).random_element()

︡bb8fd4fd-5f3c-4b72-8f0a-cee7b9abe0ee︡{"done":true}
︠e34ed2da-a306-401e-a2ba-426166021cc0s︠
w
︡6f0574b6-711b-4878-9610-180738933afd︡{"stdout":"{{1, 4}, {2}, {3, 5}}\n"}︡{"done":true}
︠a193c73a-5e3e-46a3-9fee-8fdbe956603es︠
SetPartition(blob_set_partition(Permutation([4,6,2,3,5,7,9,1,8])))
︡c3255a27-01bf-4fb3-b6a0-f9820858a44b︡{"stdout":"{{1, 7}, {2}, {3, 4}, {5, 6}, {8, 9}}\n"}︡{"done":true}
︠562f08bf-d27b-4d53-8e55-1379c5db6bca︠



s_of_blob(_)
︡53b4df60-b180-4920-b283-3ee936294897︡{"stdout":"[2, 4, 3, 6, 5, 7, 1, 9, 8]\n"}︡{"done":true}
︠0821d6b4-be54-4d25-ab4a-62fd09fffe62s︠
p=Permutation([4,6,2,3,5,7,9,1,8])
w=fireworks_phi(p)
raj(w)
︡b354e8c3-1464-4afc-9593-5b42c48d6cab︡{"stdout":"20\n"}︡{"done":true}
︠61f5f463-c812-4b11-b07a-11a79ef16cbds︠
w.imajor_index()

︡e3e3d289-d335-4d95-b008-31a39221d830︡{"stdout":"17\n"}︡{"done":true}
︠f5ce49c8-372f-4e39-b002-105ee597c584s︠
w.major_index()
︡46529ffd-129d-4452-a33b-89b5df1b012b︡{"stdout":"20\n"}︡{"done":true}
︠49cde26d-2f5f-454a-a946-7e9c080ca301︠

︡264e70f9-8eaa-419d-b4e8-503fd6370b97︡
︠db028a29-25f9-409e-a9bf-e6f72343f58e︠
︡81b8d5b4-15c3-4d2b-a085-8bb36093a600︡
︠9d4a9544-1437-4e5d-b7ac-19e89e6853d3︠
︡70a15d25-613b-4990-8440-3db499543e1b︡
︠e8803850-24cb-49b0-b672-87d8671e1475s︠
binomial(9,2) 
︡fd848d88-efab-4edf-925d-5361d2727eb8︡{"stdout":"36\n"}︡{"done":true}
︠4529274f-2de6-4712-a4fd-e437edf093d4s︠
blob_set_partition(_)
︡e809097b-321f-4ce4-b374-c74bed6460a6︡{"stdout":"[[8, 9], [1, 7], [5, 6], [3, 4], [2]]\n"}︡{"done":true}
︠1f0fdb54-09c7-4319-9ef4-55ad46442293s︠
firework_sets = {}
for n in [2,3,4]:
    for w in Permutations(n):
        f = tuple(fireworks_phi(w))
        if f in firework_sets:
            firework_sets[f].append(w)
        else:
            firework_sets[f] = [w]
    for (f,w) in firework_sets.items():
        print("%s => %d" % (list(f), len(w)))
︡08491a95-3c3f-4374-aaad-bedb1a40ac84︡{"stdout":"[1, 2] => 1"}︡{"stdout":"\n[2, 1] => 1\n[1, 2] => 1\n[2, 1] => 1\n[1, 2, 3] => 1\n[1, 3, 2] => 2\n[2, 1, 3] => 1\n[2, 3, 1] => 1\n[3, 2, 1] => 1\n[1, 2] => 1\n[2, 1] => 1\n[1, 2, 3] => 1\n[1, 3, 2] => 2\n[2, 1, 3] => 1\n[2, 3, 1] => 1\n[3, 2, 1] => 1\n[1, 2, 3, 4] => 1\n[1, 2, 4, 3] => 3\n[1, 3, 2, 4] => 2\n[1, 3, 4, 2] => 1\n[1, 4, 3, 2] => 3\n[2, 1, 3, 4] => 1\n[2, 1, 4, 3] => 3\n[2, 3, 1, 4] => 1\n[2, 3, 4, 1] => 1\n[2, 4, 3, 1] => 2\n[3, 1, 4, 2] => 2\n[3, 2, 1, 4] => 1\n[3, 2, 4, 1] => 1\n[3, 4, 2, 1] => 1\n[4, 3, 2, 1] => 1\n"}︡{"done":true}︡
︠644a36c9-eb27-4bf1-b306-cb3b55516ac4s︠
element_repr = lambda X: str(sorted([sorted(s) for s in X])).replace("[","{").replace("]","}")

for (f,w) in firework_sets.items():
    print("%s => %d" % (element_repr(blob_set_partition(Permutation(list(f)))), len(w)))
︡378e1064-4021-4dc9-8872-655a189298e5︡{"stdout":"{{1}, {2}} => 1\n{{1, 2}} => 1\n{{1}, {2}, {3}} => 1\n{{1}, {2, 3}} => 2\n{{1, 2}, {3}} => 1\n{{1, 3}, {2}} => 1\n{{1, 2, 3}} => 1\n{{1}, {2}, {3}, {4}} => 1\n{{1}, {2}, {3, 4}} => 3\n{{1}, {2, 3}, {4}} => 2\n{{1}, {2, 4}, {3}} => 1\n{{1}, {2, 3, 4}} => 3\n{{1, 2}, {3}, {4}} => 1\n{{1, 2}, {3, 4}} => 3\n{{1, 3}, {2}, {4}} => 1\n{{1, 4}, {2}, {3}} => 1\n{{1, 3, 4}, {2}} => 2\n{{1, 3}, {2, 4}} => 2\n{{1, 2, 3}, {4}} => 1\n{{1, 4}, {2, 3}} => 1\n{{1, 2, 4}, {3}} => 1\n{{1, 2, 3, 4}} => 1\n"}︡{"done":true}
︠5ef8a0a4-29b9-47e3-83b1-406602fc3d80s︠

def mp00080(sp):
    return sp.to_permutation()

def mp00062(w):
    from sage.combinat.permutation import from_major_code
    return from_major_code(w.to_lehmer_code())

def to_blob(w):
    return SetPartition(blob_set_partition(w))

def findstat_map(sp):
    return mp00062(mp00080(sp))
︡f31b7408-1d44-4013-adb8-555f9464bd41︡{"done":true}
︠e76ee819-c99a-442e-b48c-4afb5802d76ds︠
w = Permutation([4,6,2,3,5,7,9,1,8])
f = fireworks_phi(w)
f
to_blob(w)
findstat_map(to_blob(w))
︡bbbb9ed5-211d-4307-b481-dc073e7680f4︡{"stdout":"[2, 4, 3, 6, 5, 7, 1, 9, 8]\n"}︡{"stdout":"{{1, 7}, {2}, {3, 4}, {5, 6}, {8, 9}}\n"}︡{"stdout":"[3, 6, 2, 4, 5, 1, 9, 7, 8]\n"}︡{"done":true}
︠b1c5add3-e271-4a55-9d23-266a389c6d37s︠
w = Permutations(13).random_element()
w
︡e890455e-8fa8-4c64-838b-aef2fa874967︡{"stdout":"[1, 9, 11, 10, 12, 6, 4, 7, 3, 13, 5, 8, 2]\n"}︡{"done":true}
︠2e938b41-082a-4816-95cb-25d2d77a277cs︠
f = fireworks_phi(w)
f
to_blob(w)
findstat_map(to_blob(w))
︡1ff7d2c1-dfa1-4e7b-8835-0e5bcb640098︡{"stdout":"[1, 9, 11, 10, 6, 4, 3, 12, 7, 5, 13, 8, 2]\n"}︡{"stdout":"{{1}, {2, 8, 13}, {3, 4, 6, 10, 11}, {5, 7, 12}, {9}}\n"}︡{"stdout":"[11, 6, 2, 9, 4, 5, 7, 13, 3, 12, 10, 1, 8]\n"}︡{"done":true}
︠1051f921-8cd6-4ddf-9dff-bb54ac8284abs︠
sp
︡219aa978-88b7-4b98-8825-c48980e702fe︡{"stdout":"{{1, 7}, {2}, {3, 4}, {5, 6}, {8, 9}}\n"}︡{"done":true}
︠8863f1f8-9837-4218-8636-cd7fcd08811es︠
mp00080(sp)
︡e5734859-6335-4a20-b4db-003ae17d64ae︡{"stdout":"[7, 2, 4, 3, 6, 5, 1, 9, 8]\n"}︡{"done":true}
︠cecf595d-9511-46a6-ba3a-d635fc8cf344s︠
mp00062(mp00080(sp))
︡ab6f2ec1-d8b4-4be8-81c5-28857f514860︡{"stdout":"[3, 6, 2, 4, 5, 1, 9, 7, 8]\n"}︡{"done":true}
︠a75bc93e-7367-4526-ab0c-70a8d4c0b2d2s︠
fireworks_phi(mp00062(mp00080(sp))).to_matrix()
︡79576216-2a92-4d09-aca2-3ea3fffb4853︡{"stdout":"[0 0 0 0 0 1 0 0 0]\n[0 1 0 0 0 0 0 0 0]\n[1 0 0 0 0 0 0 0 0]\n[0 0 1 0 0 0 0 0 0]\n[0 0 0 0 1 0 0 0 0]\n[0 0 0 1 0 0 0 0 0]\n[0 0 0 0 0 0 1 0 0]\n[0 0 0 0 0 0 0 0 1]\n[0 0 0 0 0 0 0 1 0]\n"}︡{"done":true}
︠b93e5399-dcf4-4bc3-9f84-4aebb02da263s︠
fireworks_phi(Permutation([4,6,2,3,5,7,9,1,8])).to_matrix()
︡e7545e3d-30b4-4eb5-8b69-ea3fec886f60︡{"stdout":"[0 0 0 0 0 0 1 0 0]\n[1 0 0 0 0 0 0 0 0]\n[0 0 1 0 0 0 0 0 0]\n[0 1 0 0 0 0 0 0 0]\n[0 0 0 0 1 0 0 0 0]\n[0 0 0 1 0 0 0 0 0]\n[0 0 0 0 0 1 0 0 0]\n[0 0 0 0 0 0 0 0 1]\n[0 0 0 0 0 0 0 1 0]\n"}︡{"done":true}
︠56cb4723-da8e-4946-ae2a-4be2e6bc650as︠
# Generator for the set of permutations s such that fireworks_phi(w) = fireworks_phi(s)
# "Pullback of fireworks_phi along the inclusion of w as fireworks_phi(w)"
def fireworks_class(w):
    blob = blob_set_partition(w)
    for p in blob_class(blob):
        yield Permutation(p)

# Regard pp as a list of rows in a permutation diagram, and stones as another list of rows that's sorted in decreasing order
# The stone rows need to be interlaced with the pp rows to form a list w such that
# - the ordering of each is preserved as a subsequence
# - every row (i, w[i]) that came from pp is covered by a (j, w[j]) from stones such that j > i and w[j] > w[i]
# These conditions guarantee that the blob_set_partition of w will be [stones] + blob_set_partition(pp)
# ASSUMES that stones contains the highest number, otherwise it's impossible
def southeast_cover_with(pp, stones):
    # The last stone has to come last in w
    last_stone = stones[-1]
    for wp in scw_helper(pp, stones[:-1], last_stone):
        yield wp + [last_stone]

# Same as scw, but we just do the head of w and assume there are rows at the end covering any (i, c) with c < `covered`
def scw_helper(pp, stones, covered):
    if len(stones) == 0:
        yield pp # ASSUMES using all the stones means covered > pp[i] for all i
        return
    if len(pp) == 0:
        yield stones
        return
    # Next we will either put a row from stones or a row from pp
    # Put a stone row
    last_stone = stones[-1]
    for wp in scw_helper(pp, stones[:-1], last_stone):
        yield wp + [last_stone]
    # Put a row from pp if it's covered
    if pp[-1] < covered:
        for wp in scw_helper(pp[:-1], stones, covered):
            yield wp + [pp[-1]]

# Assumes the blob is a list of increasing lists in decreasing order by largest element
# Generates permutations in list form. They will be partial permutations if the blob was partial
def blob_class(blob):
    if len(blob) == 1:
        yield blob[0][::-1]
    else:
        for partial_perm in blob_class(blob[1:]):
            # Insert the elements from blob[0] into the list so that they form the maximally southeast numbers
            # We reverse the order of blob[0] so that the arguments get interleaved in the same order
            for cover in southeast_cover_with(partial_perm, blob[0][::-1]):
                yield cover
︡f1fb1b97-6ac0-4f88-94d6-5c9a8084a8dc︡{"done":true}
︠677a168a-0d94-4fd6-ae3f-1a816bc070a5s︠
blob = blob_set_partition(Permutation([1,3,2,7,6,5,4]))
list(blob_class([blob]))
︡b1fc2d45-2971-46c8-a93d-72ebfcc06864︡{"stdout":"[[[1], [2, 3], [4, 5, 6, 7]]]\n"}︡{"done":true}
︠58242f7f-6a31-4f2d-b47b-240601ced9c3s︠
blob_set_partition(Permutation([2,7,6,5,4,3,1]))
︡c473638e-1d0d-4ff1-af36-ceb9db1ea3e5︡{"stdout":"[[1, 3, 4, 5, 6, 7], [2]]\n"}︡{"done":true}
︠a815b56a-a971-4341-837a-26c78a85e00cs︠
blob_set_partition(Permutation([1,3,4,2]))
︡55c1c1e4-4861-4a07-bf1c-71e0687de518︡{"stdout":"[[2, 4], [3], [1]]\n"}︡{"done":true}
︠0c683e3a-1809-41aa-9ee4-ccacda27590bs︠
list(fireworks_class(Permutation([3,1,7,6,5,4,2])))
len(list(fireworks_class(Permutation([6,3,1,7,5,4,2]))))
︡944cb022-5d86-4d5d-b11b-56a7a48fbeb9︡{"stdout":"[[3, 1, 7, 6, 5, 4, 2], [3, 7, 1, 6, 5, 4, 2], [7, 3, 1, 6, 5, 4, 2], [3, 7, 6, 1, 5, 4, 2], [7, 3, 6, 1, 5, 4, 2], [7, 6, 3, 1, 5, 4, 2], [3, 7, 6, 5, 1, 4, 2], [7, 3, 6, 5, 1, 4, 2], [7, 6, 3, 5, 1, 4, 2], [7, 6, 5, 3, 1, 4, 2], [3, 7, 6, 5, 4, 1, 2], [7, 3, 6, 5, 4, 1, 2], [7, 6, 3, 5, 4, 1, 2], [7, 6, 5, 3, 4, 1, 2]]\n"}︡{"stdout":"9\n"}︡{"done":true}
︠b687a2d1-be2c-46bb-b676-afb8ee25ba95s︠
# 0-idxed layered perm
def layered0(block_sizes):
    if len(block_sizes) == 1:
        return list(range(block_sizes[0]))[::-1]
    else:
        w = layered0(block_sizes[:-1])
        i = len(w)
        return w + list(range(i,i+block_sizes[-1]))[::-1]

def layered(block_sizes):
    return Permutation([i+1 for i in layered0(block_sizes)])

layered([1,3])
︡5ffae879-e982-422e-aedb-30800ee59276︡{"stdout":"[1, 4, 3, 2]\n"}︡{"done":true}
︠85285395-3fb6-4159-b6c2-49aa11472726s︠
len(list(fireworks_class(layered([2,5,2]))))
︡4c58630c-d8f8-4eea-98a6-17497dba9c82︡{"stdout":"120\n"}︡{"done":true}
︠5504074f-8028-457a-b022-1c364f9b28fes︠
binomial(8,2)*binomial(5,3)
︡e10ab9bc-9461-4f5f-8bd0-60bfd719ad5d︡{"stdout":"280\n"}︡{"done":true}
︠7df3eead-7a5b-4051-af7d-e562e7b56ba6s︠
list(fireworks_class(layered([1,1,2])))
︡ae5f29c3-1038-4b1e-8b47-0aebb6d283b4︡{"stdout":"[[1, 2, 4, 3], [1, 4, 2, 3], [4, 1, 2, 3]]\n"}︡{"done":true}
︠0ab91856-be51-4b3b-a9d1-04d9beb47cb0︠









