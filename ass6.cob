       IDENTIFICATION DIVISION.
       PROGRAM-ID.    Ass6.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 IN1 PIC X(5).
       01 IN2 PIC X(5).
       01 A PIC S9(9).
       01 B PIC S9(9).
       01 C PIC S9(9).
       01 RESULT PIC X(9).
       01 SYM PIC A(3).

       PROCEDURE DIVISION.
           MAIN. 
           ACCEPT SYM
           ACCEPT IN1
           ACCEPT IN2

           IF IN1 = "true" THEN
                MOVE 1 TO A
           ELSE IF IN1 = "false" THEN
                MOVE 0 TO A 
           ELSE
                MOVE IN1 TO A
           END-IF.

           IF IN2 = "true" THEN
                MOVE 1 TO B
           ELSE IF IN2 = "false" THEN
                MOVE 0 TO B
           ELSE
                MOVE IN2 TO B
           END-IF.

           GO TO BINOP.
           
           FINISH.
           DISPLAY RESULT.
           STOP RUN.

           BINOP.
           IF SYM = '-' THEN
                SUBTRACT B FROM A GIVING C
                MOVE C TO RESULT
           ELSE IF SYM = '+' THEN
                ADD A B GIVING C
                MOVE C TO RESULT
           ELSE IF SYM = '*' THEN
                MULTIPLY A BY B GIVING C
                MOVE C TO RESULT
           ELSE IF SYM = '/' THEN
                DIVIDE A BY B GIVING C
                MOVE C TO RESULT
           ELSE IF SYM = 'eq?' THEN
                IF A = B THEN
                    MOVE "true" TO RESULT
                ELSE
                    MOVE "false" TO RESULT
                END-IF
           ELSE IF SYM = "<=" THEN
                IF A <= B THEN
                    MOVE "true" TO RESULT
                ELSE
                    MOVE "false" TO RESULT
                END-IF
           ELSE
                DISPLAY "Fuck this shit."
           END-IF.
           GO TO FINISH.
