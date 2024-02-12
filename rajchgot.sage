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

def maj_code(w):
    des = w.descents(from_zero=True)
    mcode=[]
    for j in range(len(w)):
        m = [d for d in des if d >= j]
        mcode.append(len(m))
    return mcode

def raj(w):
    return(sum([i for i in rajchgot_code(w)]))

def raj_poly(n):
    q = var('q')
    return(sum([q^(raj(w)) for w in Permutations(n)]))

def maj_code(w):
    des_indices = []
    for i in range(len(w)-1):
        if w(i+1) > w(i+2):
            des_indices.append(i)
    return [len([x for x in des_indices if x >= i]) for i in range(len(w))]

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

def fireworks(n):
    fw=[]
    for w in Permutations(n):
        if raj(w)-w.major_index() == 0:
            fw.append(w)
    return fw

def fireworks_phi(w):
    B = blob_set_partition(w)
    return Permutation([y for lasso in B[::-1] for y in lasso[::-1]])

def shape(w):
    B = blob_set_partition(w)
    return Composition([len(lasso) for lasso in B[::-1]])

# Does not assume sp is sorted
def fireworks_of_blob(sp):
    unsorted_blob = [sorted(list(s)) for s in sp]
    sorted_blob = sorted(unsorted_blob, key=lambda ls: -max(ls))
    return Permutation([y for lasso in sorted_blob[::-1] for y in lasso[::-1]])

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

# Compositions from partitions (hastily assembled to test section 8 of overleaf)
def plam(lamda,n):
    result = 1
    for io in range(len(lamda)):
        iz = io-1
        if iz == -1:
            result *= binomial(n-1,n-lamda[0]-1)
        else:
            result *= binomial(lamda[iz]-1,lamda[iz]-lamda[iz+1]-1)
    return result

def partn_poly(n):
    poly = 0
    # TODO: it's just a choice of which parts (max part size is n-1) appear.
    # 2^{n-1} choices.
    # This probably also gives a recurrence.
    for d in range(binomial(n,2)):
        for lamda in Partitions(d+1):
            if lamda.conjugate().is_restricted(2):
                # lamda has distinct parts
                poly += plam(lamda,n)*x^(d+1)
    poly += 1 #maybe it would work for d = -1 but I don't want to try
    return poly

def partn_poly_multivar_coeffs(n,k=None):
    poly = {}
    for lamda in Subsets(list(range(1,n)),k=k-1):
        lamdac = set(range(1,n)).difference(lamda)
        # Convert to partition objects
        lamda = Partition(sorted(lamda, reverse=True))
        lamdac = Partition(sorted(lamdac, reverse=True))
        evec = tuple(lamdac.conjugate())
        if evec in poly:
            poly[evec] += plam(lamda,n)
        else:
            poly[evec] = plam(lamda,n)
    return poly

# Gets curly M
def gnprime_coeffs(n,k=None):
    poly = {}
    for lamda in Subsets(list(range(1,n)),k=k-1 if k else k):
        # Convert to partition objects
        lamda = Partition(sorted(lamda, reverse=True))
        xevec = tuple(lamda)
        for pf in pfillings(lamda,n):
            qevec = colcounts(pf)
            evec = (xevec,qevec)
            if evec in poly:
                poly[evec] += 1
            else:
                poly[evec] = 1
    return poly


#For multivariate polynomials:
def varz(i):
    return(var('z' +str(i)))

#William: May not be correct yet--needs testing.
#Takes a positive integer n and returns the reverse G_n generating function of sets
def reverseGn(n):
    poly = 0
    for lamda in Subsets(list(range(1,n))):
        lamda = Partition(sorted(lamda, reverse=True))
        poly = poly + plam(lamda, n+1)*prod(varz(i) for i in lamda)
    return(poly)

# Sum over all fireworks perms in S_n of q^raj(w)
def RFn(n,q):
    poly = 0
    for lamda in Subsets(list(range(1,n))):
        lamda = Partition(sorted(lamda, reverse=True))
        poly = poly + plam(lamda, n)*q^(binomial(n,2)-lamda.size())
    return poly

def almost_to_fireworks(w):
    rcode = rajchgot_code(w)
    mcode = maj_code(w)
    for i in range(len(w)):
        if rcode[i] != mcode[i]:
            break
        else:
            i=0
    m=matrix(w)
    r = list(range(len(w)))
    c = list(range(len(w)))
    r.remove(w[i]-1)
    c.remove(i)
    new_m = m.matrix_from_rows_and_columns(r,c)
    sigma = Permutation([list(v).index(1)+1 for v in new_m.columns()])
    return sigma

def descent_maxes(w):
    d = []
    cur = 0
    for i in range(1,len(w)+1):
        if w(i) > cur:
            d.append(w(i))
        cur = w(i)
    return d

def insert_val_at_idx(w,val, idx):
    wlist = list(w)
    newlist = [x if x < val else x+1 for x in wlist[0:idx]] + [val] + [x if x < val else x+1 for x in wlist[idx:]]
    return Permutation(newlist)

# checks if val is part of a 312 pattern in descent_maxes(w)
def check_pattern(w, val):
    d = [x for x in descent_maxes(w) if x <= val]
    seen_val = False
    for i in range(len(d)-1):
        if seen_val:
            if d[i] < d[i+1]:
                return True
        if d[i] == val:
            seen_val = True
    return False

# w is a fireworks permutation. Insert the value i into w, shifting all numbers >= i up by 1.
# Inserts i such that i is the 3 in the rightmost 312 pattern of descent_maxes
def almost_to_fireworks_section(i,w):
    new_w = insert_val_at_idx(w,i,0)
    for j in range(1,len(w)+1):
        w_prime = insert_val_at_idx(w,i,j)
        if check_pattern(w_prime, i):
            new_w = w_prime
    return new_w