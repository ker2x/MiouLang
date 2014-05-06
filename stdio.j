.source stdio.j
.class public static MiouLang/Stdio
.super MiouLang/Object


; List of stuff here
; print string, int, float, long, double
; read

;
; FIELDS
; 
; NONE


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
; debug method
; 
.method public static debug(Ljava/lang/String;)V
	.limit stack 2
        getstatic MiouLang/DEBUG Z
	ifne Printdebug
	return
Printdebug:
	aload_0
	invokestatic MiouLang/Stdio/println(Ljava/lang/String;)V
	return	
.end method


;
; void print(string)
;
.method public static print(Ljava/lang/String;)V
	.limit stack 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	aload_0
	invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V
	return
.end method

;
; void println(string)
;
.method public static println(Ljava/lang/String;)V
	.limit stack 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	aload_0
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	return
.end method

;
; void print(int)
;
.method public static print(I)V
	.limit stack 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload 0
	invokevirtual java/io/PrintStream/print(I)V
	return
.end method

;
; void println(int)
;
.method public static println(I)V
	.limit stack 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload 0
	invokevirtual java/io/PrintStream/println(I)V
	return
.end method

;
; void print(float)
;
.method public static print(F)V
	.limit stack 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	fload 0
	invokevirtual java/io/PrintStream/print(F)V
	return
.end method

;
; void println(float)
;
.method public static println(F)V
	.limit stack 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	fload 0
	invokevirtual java/io/PrintStream/println(F)V
	return
.end method

;
; void print(long)
;
.method public static print(J)V
	.limit stack 3
	.limit locals 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	lload 0
	invokevirtual java/io/PrintStream/print(J)V
	return
.end method

;
; void println(long)
;
.method public static println(J)V
	.limit stack 3
	.limit locals 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	lload 0
	invokevirtual java/io/PrintStream/println(J)V
	return
.end method

;
; void print(double)
;
.method public static print(D)V
	.limit stack 3
	.limit locals 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	dload 0
	invokevirtual java/io/PrintStream/print(D)V
	return
.end method

;
; void println(double)
;
.method public static println(D)V
	.limit stack 3
	.limit locals 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	dload 0
	invokevirtual java/io/PrintStream/println(D)V
	return
.end method

;
; READ()
; read from stdio
;
.method public static read()Ljava/lang/String;
	.limit stack 8
	.limit locals 10

	; Scanner scanner = new Scanner(System.in)
	; String input = scanner.nextline();
	
	new java/util/Scanner
	dup
	getstatic java/lang/System/in Ljava/io/InputStream;
	invokespecial java/util/Scanner/<init>(Ljava/io/InputStream;)V
	invokevirtual java/util/Scanner/nextLine()Ljava/lang/String;

	areturn
.end method


;
; fh fopen("filename")
;


;
; fclose(fs)
;


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
 
