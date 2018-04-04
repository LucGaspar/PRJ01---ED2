n IS $0
t IS $1
c IS $2
	 EXTERN main

main SETW rX, 1
	 SETW n , 0
	 SETW c , 0

read  INT #80
 	  JN rA, write
	  ADD n, n, 1
	  STB rA, rSP, 0
	  ADD rSP, rSP, 1
count CMP t, rA, 32
	  JZ t, count_
pgraf CMP t, rA, 10
	  JZ t, pgraf_
	  JMP read

pgraf_ SETW $3, 3 
	   INT #DB0303
	   JMP read	  	

count_ ADDU c, c, 1
	   JMP read

write NEG t, 0, n
	  LDB rY, rSP, t
	  SETW rX, 2
	  INT #80
	  SUB n, n, 1
	  JP n, write 
	 
end	  INT 0