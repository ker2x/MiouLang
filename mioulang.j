.source mioulang.j
.class public MiouLang
.super MiouLang/Object


; List of stuff here
; <init>, main

;
; FIELDS
; 
.field public static final VERSION Ljava/lang/String; = "0.0.1"
.field public static DEBUG Z = 0 ;set to non-zero to enable


;
; INIT
;
; equivalent to : super(); return;
.method public <init>()V
	aload_0
	invokespecial MiouLang/Object/<init>()V
	return
.end method

;
; MAIN(String[])
;
.method public static main([Ljava/lang/String;)V
	.limit stack 60
	.limit locals 3

	; local list
	; 0 : main arguments array of string
	; 1 : # of main args
	; 2 : for loop 

	;
	; parse arguments
	; if -d -> DEBUG=true
	;
	aload_0			; push args[] on stack
	arraylength		; get length of args[]
	dup			; because i need it to check empty array
	istore_1		; store it in #1
	ifeq After_args		; if 0 : No arguments, jump to After_args

	iconst_0		; there is args, prepare loop
	istore_2		; #2 = 0

LOOP_START:
	new java/lang/String	; new string
	dup			; need a dup of this reference to compare with -d
	dup			; need a dup of this reference to compare with -h
	aload_0			; get args array
	iload_2			; index #2
	aaload			; push the #2th element of the array on the stack
	invokespecial java/lang/String/<init>(Ljava/lang/String;)V	; new String(args[#2])
	ldc "-d"
	invokevirtual java/lang/String/equals(Ljava/lang/Object;)Z	; compare "-d" and "args[#2]"
	ifne SET_DEBUG		; not false, args is -d, jump to SET_DEBUG
	ldc "-h"	
	invokevirtual java/lang/String/equals(Ljava/lang/Object;)Z	; compare "-h" and "args[#2]"
	ifne PRINT_HELP		; not false, args is -h, jump to PRINT_HELP
	
END_LOOP:	
	iinc 2 1	; increment #2 by 1
	iload_2
	iload_1
	if_icmpne LOOP_START
	goto After_args

SET_DEBUG:
	iconst_1
	putstatic MiouLang/DEBUG Z	; DEBUG=1
	pop	; because we won't use the 2nd dup
	goto END_LOOP

PRINT_HELP:
	ldc "other arguments are ignored"
	ldc "   -d : enable debug"
	ldc "   -h : this message"
	ldc "help : "
	invokestatic MiouLang/Stdio/println(Ljava/lang/String;)V
	invokestatic MiouLang/Stdio/println(Ljava/lang/String;)V
	invokestatic MiouLang/Stdio/println(Ljava/lang/String;)V
	return

After_args:
	; print VERSION
	ldc "MiouLang version : "
	invokestatic MiouLang/Stdio/print(Ljava/lang/String;)V
	getstatic MiouLang/VERSION Ljava/lang/String;
	invokestatic MiouLang/Stdio/println(Ljava/lang/String;)V

	ldc "debug ENABLED"
	invokestatic MiouLang/Stdio/debug(Ljava/lang/String;)V

	;print header for memory stats
	ldc "Free / Total memory (in KB) : "
	invokestatic MiouLang/Stdio/print(Ljava/lang/String;)V

	;get runtime object (twice!)
	invokestatic java/lang/Runtime/getRuntime()Ljava/lang/Runtime;
	dup

	;get free memory (and divide by 1024, because KB)
	invokevirtual java/lang/Runtime/freeMemory()J
	ldc2_w 1024
	ldiv
	invokestatic MiouLang/Stdio/print(J)V

	;print separator
	ldc " / "	
	invokestatic MiouLang/Stdio/print(Ljava/lang/String;)V

	;get total memory (divide by 1024 too)
	invokevirtual java/lang/Runtime/totalMemory()J
	ldc2_w 1024
	ldiv
	invokestatic MiouLang/Stdio/println(J)V

	; read stdin
	ldc "Type something (pretty please?) : "
	invokestatic MiouLang/Stdio/print(Ljava/lang/String;)V
	invokestatic MiouLang/Stdio/read()Ljava/lang/String;
	
	; echo stdin
	ldc "Echo : "
	invokestatic MiouLang/Stdio/print(Ljava/lang/String;)V
	invokestatic MiouLang/Stdio/println(Ljava/lang/String;)V

	return

.end method
	

;
; CHEAT SHEET
;
; F : single precision float
; D : double precision float
; I : integer
; J : long
; S : short
; B : byte
; C : char
; Z : bool
; L<classname>; : instance of a class
; [ : one array dimension
; V : void for return type

; .class tell the name of the class being defined
; .super directive tell which our class is extending (usually java/lang/Object)
; method begin with .method and end with .end method
; <init> method is an instance initializer
; .method public static main is the main entry point
; .limit stack 2 mean we can push up to 2 five items on tha tmethod stack
; .limit locals 100 set the number of locale variable to 100, 1 by default

; fields
; .field private foo D = 0.0
; getfield HelloWorld/foo D
; putfield HelloWorld/foo D
 
