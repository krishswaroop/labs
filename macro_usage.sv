//Examples of variations of `define  macros

`define SIZE 8 
`define NUMBER 100
`define STRING "Defining Macros"
`define MATH_OPERATIONS(x,y) $display(x+y); \
	$display(x-y); \
	$display(x*y); \
	$display(x/y);                    	 		        	//Multiple lines for single macro
`define MACRO_VARIATIONS_1(a=5,b=6,c="C") $display(a,b,c);
`define MACRO_VARIATIONS_2(a=5,b,c=8) $display(a,b,c);
`define MAXOF(a,b) ((a) > (b) ? (a) : (b))	  	                	//Space doesn't matter
`define REG(width,name) reg [`SIZE-1:0] name``_reg
`define PRINT(x) $display(`"variable - %d`",x);


//-----module definition-----//
module test_define_macro;

int max;					                
`REG(8,data) ;                                                  		//Register size will be 8 bits [7:0] and name will be data_reg

initial
begin
	$display(`NUMBER);				               		//Output => 100
	$display(`STRING);				                        //Output => Defining Macros
 	`MATH_OPERATIONS(10,2);				               		//Output => x+y = 12, x-y = 8, x*y = 20, x/y = 5
	`MACRO_VARIATIONS_1(1,2,3);			                        //Output => 1  2   3
	`MACRO_VARIATIONS_1(,2,3);			                        //Output => 5  2   3 (Default Value of a is taken)
	`MACRO_VARIATIONS_1(1,2,);	                               		//Output => 1  2   C
	`MACRO_VARIATIONS_1(,,);			               		//Output => 5  6   C (Default Value of a,b,c is taken)
  	`MACRO_VARIATIONS_1();				               		//Output => 5  6   C (Default Value of a,b,c is taken)
  	//`MACRO_VARIATIONS_1;				               		//THROWS ERROR
  	`MACRO_VARIATIONS_2(,1,);		              	                /*
                                                                 		 *Output => 5  1   8 
                                                                 		 *It's important to note that if the macro arguments doesn't have a default value,
                                                                 		 *the value needs to be specified as shown above where arguments a and c are not defined
                                                                 		 *and only b is defined
                                                                 		 */
  
  	//`MACRO_VARIATIONS_2(1);			                        //THROWS ERROR BECAUSE "b" DOESN'T HAVE A DEFAULT VALUE IN 
  	max = `MAXOF(2,3);				                        //Output => max = 3
  	$display("Max of 2 and 3 is %d",max);
	$display("data_reg size ", $size(data_reg));                  		//Output => data_reg - size 8
  	`PRINT(4);
end
endmodule
