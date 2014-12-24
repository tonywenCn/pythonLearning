import dataTypeCast

# basic function test

# test the basic type
dataTypeCast.testAll()
getIntValue = dataTypeCast.getInt()
print "getIntValue from dataTypeCast.getInt() is:%d" % (getIntValue)

#####
value = 10
valueAddOne = dataTypeCast.increaseByOne(value)
print "value=%d\tvalue + 1=%d" % (value, valueAddOne)

# Test string pass
strValue = '00000000'
dataTypeCast.printStr(strValue)
print "strValue=%s" % (strValue)

# Test string return
strValue = dataTypeCast.returnString()
print "strValue=%s" % (strValue)

# Test pass by value or reference:
a = 1
originalA = a
dataTypeCast.passByValueIntTest(a)
print "originalA=%d\ta=%d" % (originalA, a)

# Test array pass
arr = dataTypeCast.returnArray()
print "array:%s" % (repr(arr))

# Test return C array
dataTypeCast.testHashMap()
print "test internal hash"

# Test vector
dataTypeCast.testVector()
print "test vector"

# Test string
str = dataTypeCast.testString()
print "test string: %s" % (str)

# Test dereference
dataTypeCast.testDereference()
print "test data type dereference"



