.data
calclineborder: .asciiz "|*******************************************************************************************************|"
calcheading: .asciiz 	"|		C	A	L	C	U	L	A	T	O	R		|"
calcleftside: .asciiz   "|  	 		"
calcrightside: .asciiz  "  				|"
wrongInputMsg: .asciiz 	"|		Wrong input. Please enter a valid operator (+, -, /, *, %,^).\n				|"		"
equals: .asciiz  "="
instruction: .asciiz 	"|	For add press +, For sub press -, For div press /, For mult press * ,For remaminder press %\t|\n|\t\t\t\tFor Square press ^, For Cube Press &\t\t\t\t\t|"
space:	.asciiz "	"
enternumber1: .asciiz 	"	Enter number 1	: 	"
enternumber2: .asciiz 	"	Enter number 2	: 	"
input: .asciiz  	"	Instruction	: 	"
continue: .asciiz  	"	Press + to continue | To Exit press any key 	"
endLine: .asciiz 	"\n"
squaring: .asciiz 	"	Squaring :"
cubing: .asciiz 	"	Cubing :"
thankYou: .asciiz 	"|						Thank You :)						|"

# .text section contains the main body of the program
.text
main:
	# Print calculator border
	li $v0,4
    	la $a0,calclineborder
    	syscall
    	
    	# Print newline
    	li $v0,4
    	la $a0,endLine
    	syscall
    	
	# Print calculator heading
	li $v0,4
    	la $a0,calcheading
    	syscall
    	
    	# Print newline
    	li $v0,4
    	la $a0,endLine
    	syscall
    	
    	# Print calculator border
    	li $v0,4
    	la $a0,calclineborder
    	syscall
    	
    	# Print newline
    	li $v0,4
    	la $a0,endLine
    	syscall
    	
    	# Print instructions
    	li $v0,4
    	la $a0,instruction
    	syscall
    	
    	# Print newline
    	li $v0,4
    	la $a0,endLine
    	syscall
    	
    	# Prompt for and read number 1
       	li $v0,4
    	la $a0,enternumber1
    	
    	syscall
    	    	
    	li $v0,5
    	syscall
    	add $t0,$v0,$zero
    	
    	# Prompt for and read input instruction
    	li $v0,4
    	la $a0,input
    	syscall    	
    	
    	li $v0,12
    	syscall
    	move $t2,$v0
    	
    	# Print newline
    	li $v0,4
    	la $a0,endLine
    	syscall
    	
    	# Prompt for and read number 2
       	li $v0,4
    	la $a0,enternumber2
    	syscall
    	
    	li $v0,5
    	syscall
    	move $t1,$v0
  	
  	

# Instruction section: Determine the operation based on user input
 Instruction:
 	# Check if input is addition
    	li $t4, '+'            # Load the ASCII value of '+'
    	beq $t2, $t4, sumation # Branch to sumation if the characters are equal
    
    	# Check if input is subtraction
    	li $t4, '-'            # Load the ASCII value of '-'
    	beq $t2, $t4, difference # Branch to difference if the characters are equal
    
    	# Check if input is division
    	li $t4, '/'            # Load the ASCII value of '/'
    	beq $t2, $t4, quotient # Branch to quotient if the characters are equal
    
    	# Check if input is multiplication
    	li $t4, '*'            # Load the ASCII value of '*'
    	beq $t2, $t4, multiplication # Branch to multiplication if the characters are equal
    
    	# Check if input is remainder
    	li $t4, '%'            	# Load the ASCII value of '%'
    	beq $t2, $t4, remainder # Branch to remainder if the characters are equal
    	
    	# Check if input is squaring   	
    	li $t4, '^'            	# Load the ASCII value of '^'
    	beq $t2, $t4, square 	# Branch to square if the characters are equal
    	
    	# Check if input is cubing
    	li $t4, '&'            	# Load the ASCII value of '&'
    	beq $t2, $t4, cube 	# Branch to cube if the characters are equal
    	j WrongInput
    	
# Operation sections: Perform the corresponding arithmetic operation
sumation:
    	add $t3,$t0,$t1
    	move $a0,$t3
    	
    	j Print
difference:
    	sub $t3,$t0,$t1
    	
    	j Print
quotient:
    	div $t3,$t0,$t1
    	
    	j Print
multiplication:
  	mul $t3,$t0,$t1
   	
    	j Print
remainder:
    	rem $t3,$t0,$t1
    	
    	j Print
square:
	# Print message for squaring
	li $v0,4
    	la $a0,squaring
    	syscall
    	
    	# Print space
    	li $v0,4
    	la $a0,space
    	syscall
    	
    	# Print number 1
    	li $v0,1
    	la $a0,($t0)		# number 1
    	syscall
    	
    	addi $t1,$zero,2
    	
    	# Print newline
    	li $v0,4
    	la $a0,endLine
    	syscall  	
    	
    	# Calculate square
    	mul $t3, $t0, $t0     # Calculate square: t3 = t0 * t0 (t0 contains the number)
   	j Print               # Jump to the Print section to display the result

cube:
	# Print message for cubing
	li $v0,4
    	la $a0,cubing
    	syscall
    	
    	# Print space
    	li $v0,4
    	la $a0,space
    	syscall
    	
    	# Print number 1
    	li $v0,1
    	la $a0,($t0)		# number 1
    	syscall
    	
    	
    	
    	# Print newline
    	li $v0,4
    	la $a0,endLine
    	syscall  
    	
    	# Calculate cube	
    	mul $t1, $t0, $t0
    	mul $t3, $t1, $t0     # Calculate square: t3 = t0 * t0 (t0 contains the number)
    	la $t2,'^'
    	addi $t1,$zero,3
   	j Print               # Jump to the Print section to display the result

# Print section: Display the result of the operation
Print:
	# Print border
	li $v0,4
    	la $a0,calclineborder
    	syscall
    	
    	# Print newline
    	li $v0,4
    	la $a0,endLine
    	syscall
    
    	# Print calculator heading
    	li $v0,4
    	la $a0,calcheading
    	syscall
    	
    	# Print newline
    	li $v0,4
    	la $a0,endLine
    	syscall
    	
    	# Print border
    	li $v0,4
    	la $a0,calclineborder
    	syscall
    	
    	# Print newline
    	li $v0,4
    	la $a0,endLine
    	syscall
    	
    	# Print left side of calculation
    	li $v0,4
    	la $a0,calcleftside
    	syscall
    	
    	# Print space
    	li $v0,4
    	la $a0,space
    	syscall
    	
    	# Print number 1
    	li $v0,1
    	la $a0,($t0)			# number 1
    	syscall
    	
    	# Print space
    	li $v0,4
    	la $a0,space
    	syscall
 	
 	# Print instruction   	
    	li $v0,11
    	la $a0,($t2)			# instruction
    	syscall
    	
    	li $v0,4
    	la $a0,space
    	syscall
    	
    	li $v0,1
    	la $a0,($t1)			# number 2
    	syscall
    	
    	li $v0,4
    	la $a0,space
    	syscall
    	
    	li $v0,4
    	la $a0,equals
    	syscall
    	
    	li $v0,4
    	la $a0,space
    	syscall
    	    	
	move $a0,$t3
	li $v0,1
    	syscall
    	
	li $v0,4
    	la $a0,space
    	syscall
    	
    	# Print right side of calculation
    	li $v0,4
    	la $a0,calcrightside
    	syscall
    	
    	# Branch to Loop to check if user wants to continue
    	j Loop
    	
# Loop section: Prompt user to continue or exit
Loop:
	# Print newline
	li $v0,4
    	la $a0,endLine
    	syscall
    	
    	# Print continue message    	
	li $v0,4
    	la $a0,continue
    	syscall
    	
    	# Read user input
    	li $v0,12
    	syscall
    	move $t1,$v0
    	
    	# Print newline
    	li $v0,4
    	la $a0,endLine
    	syscall
    	
    	# Check if user wants to continue
    	li $t4, '+'            # Load the ASCII value of '+'
    	bne $t1, $t4, Exit # Branch to sumation if the characters are equal
    	
    	# Update number 1 if user wants to continue
    	move $t0,$t3
    	   	
    	# Prompt for and read instruction
    	li $v0,4
    	la $a0,instruction
    	syscall
    	
    	li $v0,4
    	la $a0,endLine
    	syscall
    	
    	li $v0,4
    	la $a0,input
    	syscall    	
    	
    	li $v0,12
    	syscall
    	move $t2,$v0
    	
    	li $v0,4
    	la $a0,endLine
    	syscall
    	
    	# Prompt for and read number 2
       	li $v0,4
    	la $a0,enternumber2
    	syscall
    	
    	li $v0,5
    	syscall
    	move $t1,$v0
  	
  	
    	# Jump back to Instruction to perform next operation
    	j Instruction 
    	
# WrongInput section: Display a message for wrong input 
WrongInput:
    # Display a message for wrong input
    	li $v0, 4
    	la $a0, wrongInputMsg
    	syscall
    	j Loop
    	
# Exit section: Exit the program
Exit:
	li $v0, 4
    	la $a0, thankYou
    	syscall
    	
    	
	li $v0,10
	syscall
