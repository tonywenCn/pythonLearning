from libc.stdio cimport printf
from libc.stdlib cimport malloc, free
from libcpp.unordered_map cimport unordered_map
from libcpp.vector cimport vector
from libcpp.string cimport string
from libcpp.algorithm cimport sort_heap, make_heap
from cython.operator cimport dereference as deref, preincrement as inc
from cpython cimport array
from array import array
import numpy as np

cdef extern from "<algorithm>" namespace "std" nogil:
    void sort[Iter](Iter first, Iter last)

cdef int intCast():
    cdef int a = 15
    b = a 
    print "a=%d\tb=%d" % (a, b)
    return 0

cpdef int getInt():
    cdef int a = 10
    return a

cpdef int increaseByOne(object a):
    cdef int b = a
    return b + 1

cpdef printStr(object str):
    cdef char* ptr = str
    printf("the string is:%s\n", ptr)
    ptr[0] = 'W'

cpdef returnString():
    cdef char* ptr = 'fdsafdsafdsa'
    return ptr

cpdef passByValueIntTest(object a):
    a = a + 1

cpdef returnArray():
    a = [1,2,3]
    return a

cpdef testHashMap():
    cdef unordered_map[int, int] m # = new unordered_map[int, int]
    m[1] = 1
    m[10000] = 0
    cdef int key, value
    for key, value in m:
        print "key=%d\tvalue=%d" % (key, value)
    if m.has_key(1):
        print "key=1 is in hash map"
    cdef unordered_map[int, int].iterator it = m.find(1)
    if it != m.end():
        print "unordered_map::find key=1\tvalue=%d" % (deref(it).second)

cpdef testVector():
    cdef vector[int] v = vector[int]()
    v.push_back(1)
    v.push_back(2)
    v.push_back(0)
    cdef vector[int].iterator it = v.begin()
    while it != v.end():
        print "elements in vector:%d" % (deref(it))
        inc(it)
    
    make_heap(v.begin(), v.end())
    sort_heap(v.begin(), v.end())
    print "after heap sort"
    it = v.begin()
    while it != v.end():
        print "elements in vector:%d" % (deref(it))
        inc(it)
    v.reverse()
    
    v.push_back(100)
    v.push_back(-1)
    v.push_back(101)
    print "standard sort"
    sort(v.begin(), v.end())
    it = v.begin()
    while it != v.end():
        print "elements in vector:%d" % (deref(it))
        inc(it)

cpdef testDereference():
    cdef unordered_map[int, int]* m = new unordered_map[int, int]()
    m[0][1] = 1
    m[0][10000000] = 1
    cdef int key, value
    for key, value in m[0]:
        print "key=%d\tvalue=%d" % (key, value)
    del m
    m = NULL

cpdef testString():
    pythonStr = "hello world"
    cdef string cppStr = pythonStr
    print(cppStr)
    return cppStr

cpdef testArray():
    print "Testing array"
    cdef array.array a = array('i', [1, 2, 3])
    cdef int[:] ca = a
    print ca

cpdef testMemoryView():
    cdef int[:, :, :] v = np.arange(27, dtype=np.dtype("i")).reshape((3, 3, 3))
    v[:, :, :] = 2
    for i in xrange(v.shape[0]):
        for j in xrange(v.shape[1]):
            for k in xrange(v.shape[2]):
                print "v[%d,%d,%d] = %d" % (i, j , k, v[i, j, k])

cpdef testAll():
    intCast()
    testArray()
    testMemoryView()
