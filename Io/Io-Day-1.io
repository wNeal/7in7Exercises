##########################################
# Find ###################################
##########################################
# Some Io example problems
# http://iolanguage.com/about/samplecode/

# An Io community that will answer questions
# irc://irc.freenode.net/io

# A style guide with Io idioms
# http://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide

##########################################
# Anwser #################################
##########################################
# Evaluate 1 + 1 and then 1 + 'one'. Is Io strongly typed or weakly typed?
1 + 1
# 1 + "one"
# 1 + "one" errors out. Because of this Io is strongly typed

# Is 0 true or false?
# 0 is true
0 and true
0 or false
0 and 0
"" println
# Is "" true or false?
# "" is true
"" and true
"" or false
"" and ""
# Is nil true or false?
# nil is false
nil and true
nil or false
nil and nil

# How can you tell what slots a prototype supports?
# You can use the slotName() method.

# What is the difference between = := and ::=?
# operator	 action
# ::=	 Creates slot, creates setter, assigns value
# :=	 Creates slot, assigns value
# =	 Assigns value to slot if it exists, otherwise raises exception

##########################################
# Exercises ##############################
##########################################
# Run an Io program from a file.
# io <filename>

# Execute the codein a slot given its name
Vehicle := Object clone
Vehicle start := method("The car is started..." println)
Vehicle horn := method("honk!" println)
Vehicle start
Vehicle getSlot("horn") call
