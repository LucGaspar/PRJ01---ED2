n IS $0
t IS $1 
l IS $2 
c IS $3
b IS $4
t2 IS $7
nword IS $5
lastc IS $6
ncrte IS $8
begin IS $9
z IS $10
	 EXTERN main

main SETW rX, 1
	 SETW n , 0
	 SETW l , 0
	 SETW c , 5
	 SETW nword, 0
	 SETW lastc, 0
	 SETW ncrte, 0

read  INT #80
readF JN rA, write
	  ADD n, n, 1
	  STB rA, rSP, 0
	  ADD rSP, rSP, 1
count CMP t, rA, 32
	  JZ t, count_
pgraf CMP t, rA, 10
	  JZ t, pgraf_
	  JMP read

pgraf_ INT #80
	   CMP t, rA, 10
	   JZ t, pgraf_2
	   JMP readF	

pgraf_2 ADD begin, n, 0
		JMP write

count_ ADDU l, l, 1
	   JMP read

write NEG t, 0, n
	  LDB rY, rSP, t
	  SETW rX, 2
	  INT #80
	  CMP z, rY, 32
	  JZ z, word
	  SUB n, n, 1 
	  ADD ncrte, ncrte, 1
	  JP n, write 

word ADD nword, nword, 1
	 CMP t2, ncrte, c
	 JP t2, back
	 JZ t2, done
	 ADD lastc, n, 0
	 SUB n, n, 1 
	 ADD ncrte, ncrte, 1
	 JP n, write 

done JMP read

back SUB $40, lastc, n
	 SUB $41, ncrte, $40
	 SUB nword, nword, 1
	 SETW rX, 2
calc SUB $42, c, ncrte
	 ADD $43, nword, 1
	 SUB $44, $42, $43
	 SUB $45, nword, 1
	 
	 ADD $47, $46, 1
prnt NEG t, 0, begin
	 LDB rY, rSP, t
	 INT #80
	 SUB begin, begin, 1
	 CMP t2, rY, 32
	 JZ t2, write_blank
	 JMP prnt


	 
write_blank ADD $48, $47, 0

loop_write_blank SUB $48, $48, 1
			     SETW rY, 32
			     INT #80
			     CMP t2, $48, 0
			     JP t2, loop_write_blank

end	  INT 0