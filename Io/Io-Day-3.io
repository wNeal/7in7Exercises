###############################################
# Author: Weston Neal
# Date 6/3/2012
# Description
#   Io Day 3 Challenges
###############################################

# Enhance the XML program to add spaces to show the indentation structure

Builder := Object clone
Builder indentLevel := 0

Builder forward = method(
    writeln(makeIndent() .. "<", call message name, ">")
    indentLevel = indentLevel + 1
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(makeIndent() .. content))
    )
    indentLevel = indentLevel - 1
    writeln(makeIndent() .. "</", call message name, ">")
)

Builder makeIndent := method(
    spaces := ""
    indentLevel repeat(spaces = spaces .. "  ")
    return spaces
)

Builder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript")
)


# Create a list syntax that uses brackets
curlyBrackets := method(
    call message arguments
)

{1,2,3,4,5} println
{"a", "b", "c", "d", "e"} println

# enhance the XML program to handle attrubytes: if the first argyment is a map (user the curly brackets syntax), add the attributes to the XML program.
# For example: 
#   book({"author": "Tate"}...) would print <book author="Tate">
OperatorTable addAssignOperator(":", "atPutNumber")

Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)
        
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)

Map printAsAttributes := method(
    self foreach(k, v,
        write(" " .. k .. "=\"" .. v .. "\"")
    )
)

Builder forward = method(
    write(makeIndent() .. "<", call message name)
    indentLevel = indentLevel + 1
    isFirst := true
    call message arguments foreach(
        arg,
        if(isFirst,
            if(arg name == "curlyBrackets", 
                (self doMessage(arg)) printAsAttributes
            )

            write(">\n")
            isFirst = false
        )

        content := self doMessage(arg)
        if(content type == "Sequence", writeln(makeIndent() .. content))
    )
    indentLevel = indentLevel - 1
    writeln(makeIndent() .. "</", call message name, ">")
)

Builder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript"),
    book({"author": "Tate"})
)
