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
       01 TESTING PIC S9(9) VALUE 1.
       01 IF_FLAG PIC 9(1) VALUE 0.

       PROCEDURE DIVISION.
           MAIN. 
           IF TESTING > 1 THEN
                GO TO TESTS
           END-IF.

           ACCEPT SYM

           IF SYM = "if" THEN
                MOVE 1 TO IF_FLAG
                ACCEPT IN1

                IF IN1 = "true" THEN
                    MOVE "true" TO RESULT
                ELSE IF IN1 = "false" THEN
                    MOVE "false" TO RESULT
                ELSE
                    MOVE IN1 TO SYM
                    GO TO PARSE
                END-IF
           ELSE
                GO TO PARSE
           END-IF.

           CONDITIONAL_BRANCH.
           ACCEPT IN1
           ACCEPT IN2

           IF RESULT = "true" THEN
               MOVE IN1 TO RESULT
               GO TO FINISH
           ELSE IF RESULT = "false" THEN
               MOVE IN2 TO RESULT  
               GO TO FINISH
           ELSE
               DISPLAY "You can't do that!"
           END-IF.
           STOP RUN. 
           
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

           IF IF_FLAG = 1 THEN
               GO TO CONDITIONAL_BRANCH
           ELSE
               GO TO FINISH TEST1 TEST2 TEST3 TEST4 TEST5
               TEST6 TEST7 DEPENDING TESTING
           END-IF.

           TESTS.
           MOVE '+' TO SYM
           MOVE 4 TO A
           MOVE 2 TO B
           GO TO BINOP.
           TEST1.
           IF RESULT = 000000006 THEN
                MOVE '/' TO SYM
                MOVE 3 TO TESTING
                GO TO BINOP
           ELSE
                DISPLAY "Test 1 failed."
           END-IF.

           TEST2.
           IF RESULT = 000000002 THEN
               MOVE '-' TO SYM
               MOVE 4 TO TESTING
               GO TO BINOP
           ELSE
               DISPLAY "Test 2 failed."
           END-IF.

           TEST3.
           IF RESULT = 000000002 THEN
                MOVE '*' TO SYM
                MOVE 5 TO TESTING
                GO TO BINOP
           ELSE
                DISPLAY "Test 3 failed."
           END-IF.

           TEST4.
           IF RESULT = 000000008 THEN
                MOVE 'eq?' TO SYM
                MOVE 6 TO TESTING
                GO TO BINOP
           ELSE
               DISPLAY "Test 4 failed."
           END-IF.

           TEST5.
           IF RESULT = "false" THEN
                MOVE '<=' TO SYM
                MOVE 7 TO TESTING
                GO TO BINOP
            ELSE
                DISPLAY "Test 5 failed."
            END-IF.

           TEST6.
           IF RESULT = "false" THEN
               MOVE 2 TO A
               MOVE 8 TO TESTING
               GO TO BINOP
           ELSE
               DISPLAY "Test 6 failed."
           END-IF.

           TEST7.
           IF RESULT = "true" THEN
              DISPLAY "All tests passed!"
           ELSE
              DISPLAY "Test 7 failed."
           END-IF.
           STOP RUN.

           PARSE.
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
           STOP RUN.
