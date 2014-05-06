-- Hello MiouLang Specification
-- this is a comment
-- is noop meaning "ignore whatever following until next line"

-- ----- --
-- TYPES --
-- ----- --

-- String
"this is a string"

-- Int
42

-- Float
1.2

-- Negative sign is part of the number spec, screw that unary operator
-42
-1.2

-- a constant on a single line mean : push this on the top of the stack
-- So ....
42
-- the top of the stack is now 42. Simple isn't it ?

-- reference
-- any non "quoted" string is a referenec
life
universe
everything


-- ----- --
-- Math! --
-- ----- --

-- RPN, of course
-- Because stack based language
40 2 +
-- push 42 to the stack. You know the drill, right ?

-- Considering an empty stack :
40
-- The stack is now : 40
2
-- The stack is now : 40 2
+
-- The operator + add the 2 numbers on the top of the stack and replace them with the result
-- Stack is now : 42

-- Also :
40 2 -
-- mean 40 - 2 -> 38
-- not 2 - 40 -> -38
-- simply : it apply "- 2" to 40


-- -- --
-- IO --
-- -- --

-- printing stuff
-- print the top of the stack
print

-- with newline
println

-- Also, this is working
"foobar" println

-- Casting to string is automagic
42 println

-- Open a file
-- push a file handler reference on the stack
"filename" openfile

-- Close a file
fhreference closefile


-- read a word
-- push the word string on the stack
fhreference readw



