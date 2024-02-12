︠418c064f-5b4b-495a-af6b-703d2e0a1a74s︠
load('rajchgot.sage')

from collections import defaultdict
d = defaultdict(set)
for w in Permutations(6):
    if raj(w) <= w.major_index() + 1:
        r = almost_to_fireworks(w)
        d[r].add(w)
︡b5a30437-8640-4192-9420-c95ed0601f2f︡{"done":true}
︠26244dfe-09eb-4e01-b9ef-4b162bcdb952s︠
for w in Permutations(4):
    if raj(w)-len(Permutation(w).inversions())==2:
        if not(w.avoids([2,1,4,3])):
            print('yay',w)
︡956461c6-83e7-4a45-8227-5db0f4753df9︡{"stdout":"yay [2, 1, 4, 3]\n"}︡{"done":true}
︠1f14a7f3-0e90-4a99-b924-6104e1c16aces︠
for n in range(10):
    tot = 0 
    for w in Permutations(n):
        if raj(w)-len(Permutation(w).inversions())==2:
            tot += 1
    print(tot)
#            if not(w.avoids([2,1,4,3])):
#                print('yay',w)
︡3afbed2c-67a7-42de-9aaf-3a99051d6bf3︡{"stdout":"0\n0\n0\n0\n3\n28\n171\n893"}︡{"stdout":"\n4315"}︡{"stdout":"\n"}︡{"stderr":"Error in lines 1-6\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python3.11/site-packages/smc_sagews/sage_server.py\", line 1244, in execute\n    exec(\n  File \"\", line 4, in <module>\n  File \"<string>\", line 24, in raj\n  File \"<string>\", line 11, in rajchgot_code\n  File \"src/cysignals/signals.pyx\", line 310, in cysignals.signals.python_check_interrupt\nKeyboardInterrupt\n"}︡{"done":true}
︠12c37d36-a229-4018-bbfa-e155da0d3325s︠
factor(893)
︡0917b7ec-eccd-4efd-95ce-2bfc27e6c1cd︡{"stdout":"19 * 47\n"}︡{"done":true}
︠be4dd9f3-b0a2-4825-8404-1bd98d844704︠

︡03ee0b33-0e39-42bb-bae0-9cc5e70a840a︡
︠f03c182e-b67b-4854-825a-73504d2d462bs︠
print({k: len(v) for k,v in d.items()})
︡670a225e-c767-46b3-a831-a620925db013︡{"stdout":"{[1, 2, 3, 4, 5]: 6, [1, 2, 3, 5, 4]: 6, [1, 2, 4, 3, 5]: 6, [1, 2, 4, 5, 3]: 6, [1, 2, 5, 4, 3]: 6, [1, 3, 2, 4, 5]: 6, [1, 3, 2, 5, 4]: 6, [1, 3, 4, 2, 5]: 6, [1, 3, 4, 5, 2]: 6, [1, 3, 5, 4, 2]: 6, [1, 4, 2, 5, 3]: 6, [1, 4, 3, 2, 5]: 6, [1, 4, 3, 5, 2]: 6, [1, 4, 5, 3, 2]: 6, [1, 5, 4, 3, 2]: 6, [2, 1, 3, 4, 5]: 6, [2, 1, 3, 5, 4]: 6, [2, 1, 4, 3, 5]: 6, [2, 1, 4, 5, 3]: 6, [2, 1, 5, 4, 3]: 6, [2, 3, 1, 4, 5]: 6, [2, 3, 1, 5, 4]: 6, [2, 3, 4, 1, 5]: 6, [2, 3, 4, 5, 1]: 6, [2, 3, 5, 4, 1]: 6, [2, 4, 1, 5, 3]: 6, [2, 4, 3, 1, 5]: 6, [2, 4, 3, 5, 1]: 6, [2, 4, 5, 3, 1]: 6, [2, 5, 4, 3, 1]: 6, [3, 1, 4, 2, 5]: 6, [3, 1, 4, 5, 2]: 6, [3, 1, 5, 4, 2]: 6, [3, 2, 1, 4, 5]: 6, [3, 2, 1, 5, 4]: 6, [3, 2, 4, 1, 5]: 6, [3, 2, 4, 5, 1]: 6, [3, 2, 5, 4, 1]: 6, [3, 4, 1, 5, 2]: 6, [3, 4, 2, 1, 5]: 6, [3, 4, 2, 5, 1]: 6, [3, 4, 5, 2, 1]: 6, [3, 5, 4, 2, 1]: 6, [4, 1, 5, 3, 2]: 6, [4, 2, 1, 5, 3]: 6, [4, 2, 5, 3, 1]: 6, [4, 3, 1, 5, 2]: 6, [4, 3, 2, 1, 5]: 6, [4, 3, 2, 5, 1]: 6, [4, 3, 5, 2, 1]: 6, [4, 5, 3, 2, 1]: 6, [5, 4, 3, 2, 1]: 6}\n"}︡{"done":true}
︠a5bfedfe-f709-4dc1-b8bd-2c83b6fa93b3s︠
[print(f"{matrix(w).transpose()}\n\n") for w in d[Permutation([4,3,2,1,5])]]
︡3196044d-9b58-49a2-99e3-3615943150e9︡{"stdout":"[0 0 0 0 1 0]\n[0 0 0 1 0 0]\n[0 0 1 0 0 0]\n[0 1 0 0 0 0]\n[1 0 0 0 0 0]\n[0 0 0 0 0 1]\n\n\n[1 0 0 0 0 0]\n[0 0 0 0 1 0]\n[0 0 0 1 0 0]\n[0 0 1 0 0 0]\n[0 1 0 0 0 0]\n[0 0 0 0 0 1]\n\n\n[0 0 0 1 0 0]\n[0 0 0 0 1 0]\n[0 0 1 0 0 0]\n[0 1 0 0 0 0]\n[1 0 0 0 0 0]\n[0 0 0 0 0 1]\n\n\n[0 0 1 0 0 0]\n[0 0 0 0 1 0]\n[0 0 0 1 0 0]\n[0 1 0 0 0 0]\n[1 0 0 0 0 0]\n[0 0 0 0 0 1]\n\n\n[0 0 0 0 0 1]\n[0 0 0 1 0 0]\n[0 0 1 0 0 0]\n[0 1 0 0 0 0]\n[1 0 0 0 0 0]\n[0 0 0 0 1 0]\n\n\n[0 1 0 0 0 0]\n[0 0 0 0 1 0]\n[0 0 0 1 0 0]\n[0 0 1 0 0 0]\n[1 0 0 0 0 0]\n[0 0 0 0 0 1]\n\n\n[None, None, None, None, None, None]\n"}︡{"done":true}
︠a308df43-e6b0-4897-a65e-31284e565090s︠
w = Permutation([1,5,4,2,3])
almost_to_fireworks(w)
︡ef65950d-49b9-4a2a-97c4-973d71049bc4︡{"stdout":"[1, 4, 2, 3]\n"}︡{"done":true}
︠94ec600b-f794-4f8f-96f5-b31c276aa04cs︠
raj(w), w.major_index()
︡61d6ecee-2b9c-4e00-b565-eb692bc4fb24︡{"stdout":"(7, 5)\n"}︡{"done":true}
︠6666e80b-ec9b-4137-94b7-d8d7de8c8427s︠
for w in Permutations(4):
    if raj(w) == w.major_index() + 2:
        print(w,descent_maxes(w))
︡7bf1e193-5fde-4d63-90d2-fde468cc01f5︡{"stdout":"[2, 4, 1, 3] [2, 4, 3]\n[3, 4, 1, 2] [3, 4, 2]\n[4, 1, 2, 3] [4, 2, 3]\n[4, 3, 1, 2] [4, 2]\n"}︡{"done":true}
︠5bbb0d2a-55bc-485f-9554-289143ae335f︠

︡72b25de4-f90d-4582-a9ab-48eb964d6d14︡
︠00b54260-6a04-4a23-b572-461cbe71b07es︠
w=Permutation([2,4,1,3])
︡f95ddfa5-e0a7-483e-883c-6f7adeabd3a6︡{"done":true}
︠444fe14f-758f-4849-81d5-4fc61e2767a5s︠
rajchgot_code(w)
maj_code(w)
︡b8dce566-83f5-4287-944b-45fa2ed8c26b︡{"stdout":"[2, 2, 0, 0]\n"}︡{"stdout":"[1, 1, 0, 0]\n"}︡{"done":true}
︠c022b0d6-fa40-4ca7-a57f-91bd56f4d3f1︠

︡7caf31ef-e964-4135-ba5a-2bf5c2603ec2︡
︠d9f73561-9cea-471e-b49f-a0e38e481184s︠
d_i=descent_maxes(w)
d_i.remove(5)
d_i
︡2d31a7af-a03d-4812-a890-b028cdc47308︡{"stdout":"[1, 3]\n"}︡{"done":true}
︠d456d3ae-36ad-4940-a14f-d4abd215197c︠
for w in Permutation(5):
    d_i = descent_maxes(w)
    m = max(descent_maxes(w))
    ind = d
    if m >
        
        
︡83b9df9a-66ae-4ae1-8674-483a275fef3a︡{"stderr":"Error in lines 1-4\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1231, in execute\n    compile(block + '\\n',\n  File \"<string>\", line 4\n    if d_i.index(m) < len(d_i)-Integer(1):\n                                          ^\nIndentationError: expected an indented block after 'if' statement on line 4\n"}︡{"done":true}
︠fe7c067b-7942-4a3b-9b5d-5f8f83484a86s︠
w = Permutation([1,5,4,2,3])
print(rajchgot_code(w),maj_code(w))
︡147333d8-45f9-4535-90c7-f45d3b462a1e︡{"stdout":"[2, 3, 2, 0, 0] [2, 2, 1, 0, 0]\n"}︡{"done":true}
︠ad64c297-e63d-4c4d-aba5-9b407bf8d8cas︠
w = Permutation([1,2,3,4,5])
︡25746c64-e1ea-41d5-9df4-3f6078ac0b0d︡{"done":true}
︠17fcfba9-c21d-4fab-8466-796310362144s︠
insert_val_at_idx(w,4,1)
︡84268c6d-7e01-4264-97b5-0042eb53822f︡{"stdout":"[1, 4, 2, 3, 5, 6]\n"}︡{"done":true}
︠f6fdef9f-6ee1-499b-8ba9-48cfd4aa2619s︠
n=4
F =fireworks(n)
︡d8282aa5-5f6d-4a8c-87cd-2d1207013808︡{"done":true}
︠b1f1c2b0-a605-4da0-a7e8-a9f1c08294c4s︠
def almost_fw2(n):
    almost=[]
    for w in Permutations(n):
        if raj(w)-w.major_index() <= 1:
            almost.append(w)
    return almost
︡4fd192c7-c5e3-47ff-bac4-a61824283fbb︡{"done":true}
︠e4e512cd-2830-4b29-b634-591cd3b53f4fs︠
AFF = almost_fw2(n+1)
︡7a5dfa6d-0579-4582-ae1b-029935a6ac69︡{"done":true}
︠9cfc1878-6168-4b04-8ed8-58f276e99277s︠
#testing the image size
fullset = []
for fw in F:
    for i in range(n+1):
        fullset.append(almost_to_fireworks_section(i+1,fw))
︡f1f2f3e3-f853-47c2-961b-646f6a6572a4︡{"stderr":"Error in lines 2-4\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'F' is not defined\n"}︡{"done":true}
︠f5dfe684-1239-4935-9e62-fae4cf3d1f77s︠
F[0]
︡83cb5582-b610-4b99-971e-351186556c9e︡{"stdout":"[1, 2, 3, 4]\n"}︡{"done":true}
︠a3e69801-8f3c-4a9c-b955-b1eb263a0841s︠
almost_to_fireworks_section(5,F[0])
︡48f34a37-bdc1-4835-bc26-c5cb8fb2f0e0︡{"stdout":"[1, 5, 2, 3, 4]\n"}︡{"done":true}
︠4fb81521-d4d3-42aa-8379-94f0cf740a24s︠
w = Permutation([3,1,4,2,5,6])
︡6510d9b6-53e8-4bb8-9cdd-65976cd491c5︡{"done":true}
︠ce56709f-6087-4fb0-b597-da1de39b2197︠
︡17f3f3fa-b5c9-4d86-8735-986d8a0b49c7︡
︠c11de88a-1d29-4071-b976-85cf68437f77s︠
rajchgot_code(w)
maj_code(w)
︡467a5a3f-4c72-434c-9cd5-8f720a1dde02︡{"stdout":"[2, 1, 1, 0, 0, 0]\n"}︡{"stdout":"[2, 1, 1, 0, 0, 0]\n"}︡{"done":true}
︠02687563-9f19-4d71-b1a5-531625df29ffs︠
fullset[4]
︡c377573e-76b2-4bad-a073-84f78ca753f8︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.9/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nIndexError: list index out of range\n"}︡{"done":true}
︠67c4215f-45b8-4612-b952-3c0ea797ac38s︠
for fw in fullset:
    raj(fw) - fw.major_index() <= 1
    
    
︡74e506c0-e323-4c3b-b430-8abed0074870︡{"stdout":"True\nTrue\nTrue\nFalse\nFalse\nTrue\nTrue\nTrue\nTrue\nFalse\nTrue\nTrue\nTrue\nTrue\nFalse\nTrue\nTrue\nTrue\nTrue\nFalse\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nFalse\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nFalse\nTrue\nTrue\nTrue\nTrue\nFalse\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\nTrue\n"}︡{"done":true}
︠6434d030-3736-4bd5-8da6-d4e1cbedf433︠


    for i in range(n+1):
       print(almost_to_fireworks_section(i+1,F[9]))
︡368f636b-6df0-4496-87ef-f427b2bf907f︡{"stdout":"[1, 3, 5, 4, 2]\n[2, 3, 5, 4, 1]\n[3, 2, 5, 4, 1]\n[4, 2, 5, 3, 1]\n[5, 2, 4, 3, 1]\n"}︡{"done":true}
︠c002364b-19da-4777-8935-f35dc6e7b654s︠
len(AFF)
︡9e9376a5-6931-46f3-820d-1367742012ca︡{"stdout":"75\n"}︡{"done":true}
︠01300542-44c9-4479-be80-8e3c2f1800bds︠
Set(fulllist) == Set(AFF)
︡1c43d7bd-94a4-4622-aacc-daf7a974c351︡{"stdout":"False\n"}︡{"done":true}
︠37c50ed0-3878-4844-a7e9-4b767111a217s︠
len(Set(fulllist))
︡e10e4a21-463d-487e-958f-66be48bffe47︡{"stdout":"75\n"}︡{"done":true}
︠21b836eb-bfdc-46f6-aa15-7ff71bd36ca4︠

︠80154bb6-9ef6-4038-87a3-31510951ce70︠









