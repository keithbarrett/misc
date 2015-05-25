10	%TITLE "ADD - Calcualter program"
	%SBTTL	"Module Heading and Modification History"
	%IDENT	"01-01"

	!		Module File Name:	ADD.BAS
	!		Module Title	:	Calculater program
	!		Version		:	01
	!		Edit		:	01
	!		Author		:	Keith G. Barrett
	!		Creation Date	:	20-May-1983
	!
	!++
	!
	! MODIFICATION HISTORY:
	!
	! Version	Date		Name		Reason
	!
	!
	!
	!--
	%PAGE
	%SBTTL	"Module Description"
	!++
	!
	!		M O D U L E   D E S C R I P T I O N
	!
	!
	! FUNCTIONAL DESCRIPTION:
	!
	!
	!
	! SIDE EFFECTS:
	!
	!
	!
	!--
	%PAGE
	%SBTTL	"Included files"
	!++
	!
	!		E N V I R O N M E N T   S E T - U P
	!
	!
	! INCLUDE FILES:
	!
	! <None>
	!
	!--
	%SBTTL	"Declarations"
	!++
	!
	! LOCAL STORAGE:

	DECLARE INTEGER WORD	YES, NO, TRUE, FALSE

	!
	! GLOBAL STORAGE:
	!
	! <None>
	!
	!
	! EXTERNAL REFERENCES:
	!
	! <None>
	!
	!	
	! LOCAL FUNCTIONS:
	!
	! <None>
	!
	!--
	%PAGE
	%SBTTL	"Main Program Code"

1000	!
	!
	!		M A I N   L O G I C
	!
	!

	ON ERROR GOTO ERROR.ROUTINE
	! Default error handler

 LOCAL.CONSTANTS:

	YES, TRUE=-1%
	ESCAPE$=CHR$(155%)
	ERR.TEXT$=""

	MODULE.TITLE$="ADD - calculator program"
	! Module name

	LIB.DO.COMMAND$=""
	CHAIN.PROGRAM$=""
	! alternate exit commands

	DIE.ON.ERROR%=NO
	! Do an ON ERROR GOTO 0 if fatal

	EDIT.ARG%=1% OR 2% OR 4% OR 32% OR 64%
	! Parameter for EDIT$()


 MAIN.LOGIC:

	PRINT MODULE.TITLE$
	OPEN "TT:" AS FILE 1%
	PRINT

	C$, M$=""


 LOOP:	!

1010	PRINT "> ";

	INPUT LINE #1%, A$
	A$=EDIT$(A$, EDIT.ARG%)

	IF A$="HELP" THEN
		PRINT
		PRINT
		PRINT "Commands are:"
		PRINT
		PRINT "<CR>	-	Display answer"
		PRINT "C	-	Clear answer"
		PRINT "M	-	Display memory"
		PRINT "MC	-	Clear memory"
		PRINT "CC	-	Clear System (memory and answer)"
		PRINT "M+	-	ADD answer to Memory"
		PRINT "M-	-	SUBTRACT answer from memory"
		PRINT
		PRINT "n or +n	-	ADD n to answer"
		PRINT "-n	-	SUBTRACT n from answer"
		PRINT "*n	-	MULTIPLY answer by n"
		PRINT "/n	-	DIVIDE answer by n"
		PRINT 
		PRINT "Note: in the last 4 examples, 'M' can be substituted"
		PRINT "		for n to cause MEMORY to affect ANSWER"
		PRINT
		PRINT
		GOTO LOOP
		END IF


	IF A$="" THEN
		PRINT
		PRINT
		PRINT "Answer --> ";C$
		PRINT
		GOTO LOOP
		END IF

	IF A$="C" THEN
		C$=""
		PRINT "Cleared"
		PRINT
		GOTO LOOP
		END IF

	IF A$="MC" THEN
		M$=""
		PRINT "Memory cleared"
		PRINT
		GOTO LOOP
		END IF

	IF A$="CC" THEN
		M$, C$=""
		PRINT "System cleared"
		PRINT
		GOTO LOOP
		END IF

	IF A$="M" THEN
		PRINT "Memory> ";M$
		PRINT
		GOTO LOOP
		END IF

	IF A$="M+" THEN
		M$=SUM$(M$, C$)
		PRINT "Added"
		GOTO LOOP
		END IF

	IF A$="M-" THEN
		M$=DIF$(M$, C$)
		PRINT "Subtracted"
		GOTO LOOP
		END IF

	TMP$=LEFT(A$, 1%)

	IF POS("+-*/", TMP$, 1%) THEN
		A$=RIGHT(A$, 2%)
		END IF

	IF A$="M" THEN
		A$=M$
		END IF

	IF TMP$="-" THEN
		C$=DIF$(C$, A$)
		GOTO LOOP
		END IF

	IF TMP$="/" THEN
		C$=QUO$(C$, A$, 3%)
		GOTO LOOP
		END IF

	IF TMP$="*" THEN
		C$=PROD$(C$, A$, 3%)
		GOTO LOOP
		END IF

	C$=SUM$(C$, A$)
	
	GOTO LOOP
	
9999	GOTO 32760
	! Skip over rest of code

10000	!
	!
	!		L O C A L   S U B R O U T I N E S
	!
	!


19000	!
	!
	!		E R R O R   R O U T I N E
	!
	!

 ERROR.ROUTINE:

	RESUME 32760 IF ERR=11%

	PRINT
	PRINT "ERROR, ";ERT$(ERR)
	RESUME 1010

19997	! PRINT "%Unexpected error in ";MODULE.TITLE$
	! PRINT "%(";NUM1$(ERR);") - ";ERT$(ERR)
	! PRINT "%ERL = ";NUM1$(ERL)
	! PRINT "%In routine ";ERR.TEXT$ IF LEN(ERR.TEXT$)
	! PRINT
	! RESUME 32767 IF ERL=32760
	! GOTO 19999 UNLESS DIE.ON.ERROR%
	! Fatal error

19998	! ON ERROR GOTO 0
	! When in doubt, die.

19999	! INPUT "Enter <RETURN> to continue";T.M.P$
	! T.M.P$=EDIT$(T.M.P$, EDIT.ARG%)
	! GOTO 19998 IF T.M.P$="DUMP"
	! RESUME 32760 UNLESS T.M.P$="DEBUG"

	! PRINT "Debug dump::"
	! PRINT
	! PRINT "TMP$=";TMP$
	! PRINT "I%=";I%
	! Dump important variables if requested

	! RESUME 32760
	! End of error trap
	
29000	!
	!	R S T S / E   S P A W N   E N T R Y
	!

	ENTRY.TYPE%=4%
	GOTO 10


30000	!
	!	R S T S / E   C C L   E N T R Y
	!

	ENTRY.TYPE%=1%
	GOTO 10

31000	!
	!	R S T S / E   C H A I N   E N T R Y
	!

	ENTRY.TYPE%=2%
	GOTO 10

32000	!
	!	R S T S / E   L O G G E D - O U T   E N T R Y
	!

	ENTRY.TYPE%=3%
	GOTO 10

32760	!
	!
	!		P R O G R A M    E X I T
	!
	!

 PROGRAM.EXIT:

	ERR.TEXT$="CLOSE all I/O channels"
	CLOSE I% FOR I%=1% TO 12%
	! Close any open I/O channels

	ERR.TEXT$="CHAIN exit to "+CHAIN.PROGRAM$
	CHAIN CHAIN.PROGRAM$ IF LEN(CHAIN.PROGRAM$)
	! Chain exit

	ERR.TEXT$="Calling LIB$DO_COMMAND"
	CALL LIB$DO_COMMAND(LIB.DO.COMMAND$) IF LEN(LIB.DO.COMMAND$)
	! DCL command

	ERR.TEXT$=""
	ON ERROR GOTO 0
	! Prepare to end

32767	END

