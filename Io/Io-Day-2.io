#!/bin/io
###############################################
# Author: Weston Neal
# Date 5/29/2012
# Description
#   Io Day 2 Challenges
###############################################

# A Fibonacci sequence starts with two 1s. Each subsequent 
# number is the sum of the two numbers that came before: 1,
# 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find
# the nth Fibonacci number. fib(1) is 1, and fib(4) is 3.
# As a bonus, solve the problem with recursion and with 
# loops.

# Fibonacci through recursion
Fib := method(n,
    a := 1
    b := 1                      
    result := 0                 # Stores the result
    if(n == 0, return 0)
    if(n == 1, return 1)
    if(n > 1,
       return ( Fib(n - 1) + Fib(n - 2)  )))

"4th fibonacci number: " print Fib(4) println
"10th fibonacci number: " print Fib(10) println

# Fibonacci through loops
Number fibonacci := method(
    a := 1
    b := 1                      
    result := 0                 # Stores the result
    if(self == 0, return 0)
    if(self == 1, return 1)
    if(self > 1,
        for(i,3,self,1,(
            result = a + b
            a = b
            b = result)); return result))

"5th fibonacci number: " print 5 fibonacci println
"10th fibonacci number: " print 10 fibonacci println

# How would you change / to return 0 if the denominator is zero?
Number divide := Number getSlot("/")
Number / := method(divisor, if(divisor == 0, return 0, return self divide(divisor)))
"5/2=" print 5 / 2 println
"5/0=" print 5 / 0 println

# Write a program to add up all of the numbers in a two-dimensional array
2darray := list(list(1,2,3), list(4,5,6), list(7,8,9))

"2darray = " print 2darray println
2darray sum2 := method( self flatten reduce(+) )
2darray sum2 println

# Add a slot called myAverage to a list that computes the average of all the numbers in a list. 
List myAverage := method( self average )

# Updated Method raises an error when a non numerc balue is found.
List myAverage := method(
    containsNonDigit := select(x, x asNumber() isNan()) size > 0
    if(containsNonDigit, Exception raise("The list contains a non-numeric value."))
    flatList := self flatten
    flatList reduce(+) / self size)

list(1,2,3,4) println myAverage println
# list("a") println myAverage println
# list() println myAverage println

# What happens if there are no numbers if there are no numbers in a list? 
# This causes an exception because of 0 / nil

# Write a prototype for a two-dimensional list. The dim(x, y) should allocate a list of y lists that are x elements long. Set(x, y, value) should set a value and get(x, y) should return that value

# Create the list
twoDList := List clone
twoDList transposed := false
twoDList dim := method(x,y,
    x repeat(
        inner := list()
        y repeat(inner push(nil))
        self append(inner)))

twoDList set := method(x,y,value,
    self at(x) atPut(y, value))

twoDList get := method(x,y,
    self at(x) at(y))

twoDList dim(2,4) println
twoDList set(1,2,3) println
twoDList get(1,2) println

# Write the matrix to a file, and read a matrix from a file.
file := File with("matrix.txt")
file remove
file openForUpdating
file write(firstMatrix join(", "))
file close

file = File with("matrix.txt")
file openForReading
lines := file readLines
file close
lines at(0) type println
matrixFromFile := lines at(0) split(", ")
matrixFromFile type println
matrixFromFile println

# Write a program that gives you ten tries to guess a random number from 1–100. If you would like, give a hint of “hotter” or “colder” after the first guess.
randomNumber := ((Random value) * 100 + 1) floor

i := 0
guess := 0
while(i < 10 and guess != randomNumber,
    ("Guess a number between 1 and 100: (guess " .. i+1 .. " of 10): ") print
    guess = ReadLine readLine
    guess = if(guess asNumber isNan, 0, guess asNumber)
    if(guess > randomNumber, "Too high" println)
    if(guess < randomNumber, "Too low" println)
    i = i + 1
)

if(guess == randomNumber,
    "Congrats, you did it!" println,
    "Too bad, maybe next time" println)
