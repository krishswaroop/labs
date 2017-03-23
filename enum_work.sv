//--------------------------------------------------------------------------------
// > By default, enum data type is int
// > By default, first variable in the enum will have value 0, unless overridden
// > If a enum variable is not assigned any value, it will have an incremented
//   value of the previous variable
// > Variable name and its value in an enum must be unique
//--------------------------------------------------------------------------------

module enum_work;

//---------------------------------------------------------
//this declaration throws an error as the data type is bit
//it can hold either 0 or 1 (2 state data type)
//so 3 variables in enum does not make sense
//as 3rd variable value must be unique
//---------------------------------------------------------

  //typedef enum bit {A, B, C} alphabets;

//-------------------------------------------------------------
//this declaration throws an error as the data type is bit
//it can hold either 0 or 1 and not X or z (2 state data type)
//-------------------------------------------------------------

  //typedef enum bit[3:0] {A, B=4'hz, C} alphabets;

//---------------------------------------------------------------
//this declaration throws an error as the bit width for variables
//A & B doesn't go with the data type bit width
//-------------------------------------------------------------

  //typedef enum bit[3:0] {A=2'b0, B=5'h4, C} alphabets;

//--------------------------------------------------------------
//this declaration throws an error as variables C and D are
//undefined. By default A value is 0 and B value is z. So C & D
//values cannot be automatically updated 
//----------------------------------------------------------

  //typedef enum integer {A, B='hz, C, D} alphabets;

//correct declaration
  //typedef enum integer {A, B='hz, C=2} alphabets;

  enum {RED,GREEN,BLUE,YELLOW,PINK} colors;
  typedef enum {A, B, C} alphabets;
  typedef enum {ADD, SUB, MUL, DIV, MOD} math_operations;

  integer         i;
  alphabets       alpha;
  math_operations math;
 
  initial begin
    colors = colors.first();
    for(int i = 0; i < colors.num; i++) begin
      $display("Name - %s, Value - %d", colors.name, colors);
      colors = colors.next;
    end
    //enum methods
    //first element of the enum
    colors = colors.first();
    $display("First::Name - %s, Value - %d", colors.name, colors);
    //display the next(0) element, that is RED
    colors = colors.first();
    colors = colors.next(0);
    $display("Next(0)::Name 0 - %s, Value - %d", colors.name, colors);
    //colors.next is same as colors.next(), hence GREEN is displayed
    colors = colors.first();
    colors = colors.next();
    $display("Next::Name  - %s, Value - %d", colors.name, colors);
    //colors.next(1), here 1 indicates the enum value, that is GREEN
    colors = colors.first();
    colors = colors.next(1);
    $display("Next(1)::Name - %s, Value - %d", colors.name, colors);
    //reset the variable to the first element, that is RED
    //colors.next(2) is 2nd value after RED, hence BLUE is displayed 
    colors = colors.first();
    colors = colors.next(2);
    $display("Next(2)::Name - %s, Value - %d", colors.name, colors);
    //reset the variable to the first element, that is RED
    //colors.next(3) is 3rd value after RED, hence YELLOW is displayed 
    colors = colors.first();
    colors = colors.next(3);
    $display("Next(3)::Name - %s, Value - %d", colors.name, colors);
    //colors.next(4) is 4th value after YELLOW, that is BLUE
    colors = colors.next(4);
    $display("Next(4)::Name - %s, Value - %d", colors.name, colors);
    //reset the variable to the first element, that is RED
    //colors.next(6) is 6th value after RED. After the last enum value, it will circle back to the first value, hence GREEN is displayed  
    colors = colors.first();
    colors = colors.next(6);
    $display("Next(6)::Name - %s, Value - %d", colors.name, colors);
    //total number of entries
    $display("Num::No of entries - %d", colors.num);
    //last entry of the enum
    colors = colors.last();
    $display("Last::Name - %s, Value - %d", colors.name, colors);
    //colors.prev(0) is the last value, hence PINK is displayed
    colors = colors.prev(0);
    $display("Prev(0)::Name - %s, Value - %d", colors.name, colors);
    //reset to last element
    //colors.prev() is the previous value before the last element, hence YELLOW is displayed
    colors = colors.last();
    colors = colors.prev();
    //reset to last element
    //colors.prev(1) is the previous value before the last element, hence YELLOW is displayed
    $display("Prev::Name - %s, Value - %d", colors.name, colors);
    colors = colors.last();
    colors = colors.prev(1);
    $display("Prev(1)::Name - %s, Value - %d", colors.name, colors);
    //reset to last element
    //colors.prev(2) is the 2nd previous value before the last element, hence BLUE is displayed
    colors = colors.last();
    colors = colors.prev(2);
    $display("Prev(2)::Name - %s, Value - %d", colors.name, colors);
    //colors.prev(3) is the 3rd previous value before BLUE, hence PINK is displayed
    //once the last value is reached, it circles back
    colors = colors.prev(3);
    $display("Prev(3)::Name - %s, Value - %d", colors.name, colors);
    //colors.prev(3) is the 6th previous value before PINK, hence YELLOW is displayed
    colors = colors.prev(6);
    $display("Prev(6)::Name - %s, Value - %d", colors.name, colors);

    //casting
    i = alpha;
    $display("default alpha value - %d",alpha);
    i++;
    alpha = alphabets'(i);
    $display("incremented alpha value - %d",alpha);
    //assigning out of range values
    //alphabets doesn't contain MOD
    alpha = alphabets'(MOD);
    $display("updated alpha value - %d", alpha);
  end

endmodule
  
