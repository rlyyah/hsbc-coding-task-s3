// This code is part of a Q script that creates a vector based on provided arguments.
// It calculates a time-based vector and slices it according to the specified parameters.
create_vector: {
    [args_list] 
    time_sec:18h$.z.t; 
    $[null args_list[0]; till_value:`int$ floor (2+24:00:00-time_sec)%2; till_value:args_list[0]]; 
    secs_list: time_sec + 2 * til till_value; 
    $[null args_list[1]; t:(time_sec + 1?24:00:00-time_sec)[0]; t:args_list[1]]; 
    t_pos:(where t <= secs_list); 
    sliced_list: distinct t,secs_list[t_pos];
    sliced_list};   

// Handling input arguments
args: .Q.opt .z.x;
t:args[`time][0];
$[count t = 8; t: "V"$t; t: (time_sec + 1?24:00:00-18h$.z.t)[0]]

// Create a vector based on the provided arguments
result: create_vector[(0N; t)];
show `vector:;
show result;
show `last:;
show last result;

// Example usage of the create_vector function
// Both args nulls test case
//result: create_vector[(0N; 0Nv)];
//show result;

// till_value null test case
//result: create_vector[(0N; 21:20:20)];
//show result;

// t not provided test case
//result: create_vector[(100000; 0Nv)];   
//show result;

// both args provided test case
//result: create_vector[(100000; 23:11:12)];
//show result;

// t provided but doesn't exist in the sec_list
//result: create_vector[(10; 23:11:12)];
//show result;

// t ealier than the first element in the sec_list
//result: create_vector[(10000; 06:11:12)];
//show result;
