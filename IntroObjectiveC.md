Intro to Objective C!
******************************************************************************************************************
1. Basic Objective C Data Types

~ 4 Basic Data Types: int, float, double & char
    ~ int  is a basic data type that holds INTEGERS (no numbers with decimal digits) (%i in NSLog)
    ~ float - stores decimal numbers (floating point numbers) (%f or %g in NSLog)
    ~ double - same as float, but with about twice the range (%f, %g, %e or %a in NSLog)
    ~ char - stores a single character (i.e.: a), a special digit character that looks like a 6, or a semicolon (%c in NSLog)

~ Type Id: used to store an object of any type. generic object type. (%p)
     ~ ie: id newObject: (int) type; - declares an instance method called



2.Framework Foundations: Creating Strings, Arrays, Dictionaries, and more
These are your BASIC, BUILT-IN (well, kinda. Don't forget the #import <Foundation/Foundation.h> line!) CLASSES that Objective C has already written out for us. It gives us access to basic strings, arrays, dictionaries (aka hashes in Ruby), and all the various methods that you can do to these basic classes without having to write code.

NSString: denoted by its encapsulation inside @"".

NSArray & NSMutableArray: basic array type. A list of things encapsulated in square brackets and accessed via their index, which starts at 0 instead of 1. NSArrays can't be modified after they have been created. If you plan on changing your array after creation, you need to make your object an instance of NSMutablearray instead of NSArray.

//------------------------------------
NSArray *someArray =
[NSArray arrayWithObjects:firstObject, secondObject, thirdObject, nil];
//------------------------------------

When Arrays are created in this hardcoded fashion, you have to make 'nil' the last item/pair.
However, with this alternative syntax, you can just insert the elements you want:

//------------------------------------
NSArray *someArray = @[firstObject, secondObject, thirdObject];
//------------------------------------

NSDictionary & NSMutableDictionary: key-value pairs encapsulated in curly braces. Best pracice is to have NSString objects as your keys.



//------------------------------------
NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
someObject, @"anObject",
@"Hello, World!", @"helloString",
@42, @"magicNumber",
someValue, @"aValue",
nil];
//------------------------------------

Access a Key with:
NSNumber *storedNumber = [dictionary objectForKey:@"magicNumber"];
OR
NSNumber *storedNumber = dictionary[@"magicNumber"];

Add & Remove Objects from a  Dictionary with:

[dictionary setObject:@"another string" forKey:@"secondString"];
[dictionary removeObjectForKey:@"anObject"];
Apple has provided us with AWESOME DOCS (who doesn't love docs, right?!) that you can use to refer to foundation frameworks and methods

see ALL Foundation classes & their methods here:
https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/ObjC_classic/index.html#classes


******************************************************************************************************************
3.Starting Your Code: Interface, Implementation, Program (.h and .m files)

~ The @interface section describes the class, its data components, and its methods (goes in a separate .h file that gets #imported in the .m file)


//------------------------------------
@interface NewClassName: ParentClassName
{
memberDeclarations;
}
methodDeclarations;
@end
//------------------------------------

~ in method declarations, you put:
  ~ - or + to specify if it’s an instance or class method
  ~ the return value’s data type in parentheses after the - or +
      ~ ie: (int) for integer
      ~ (double) for double precision value
      ~ (void) for no value returned
  ~ the name of the method
  ~ any arguments that a method might take follow the method name after a colon. like with variable declarations, you ~ put the datatype, in parentheses, followed by the name of the variable
      ~ ie: methodName: (int) x;
------------------------------------

~ The @implementation section contains the actual code that implements these methods (goes in a .m file.) This is your main file, but when you are working with classes, you will usually separate out your .m file where you are writing your implementation from the main.m file where your program code is actually written

//------------------------------------
@implementation NewClassName //(has to be same as in interface)
  methodDefinitions;
@end
//------------------------------------

~ each method’s definition starts by identifying:
  ~ the type of method (class or instance)
  ~ return type
  ~ arguments & their types
  ~ actual internal code inside curly braces follows. inside curly braces, use semicolons but not before the curly brace starts
ie:

//------------------------------------
- (void) print
{
NSLog (@“%i/%i”, numerator, denominator);
}
@end
//------------------------------------


The program section contains the program code to carry out the intended purpose of the program (main.m file)


INITIAL PROGRAM CODE EXPLAINED:
~ #import <Foundation/Foundation.h> — tells the compiler to locate and process a system file (not one you created) named Foundation.h
~ import adds all the code from that file into the program (like include module, or accessing a gem)
~ int main (int argc, const char *argv[]) - identifies main to the system
~ specifies that the name of the program is main
~ main is a special keyword that indicates where the program is to begin execution
~ int - specifies that the type of value main returns is an integer
~ NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  ~ It reserves space in memory for an autorelease pool
  ~ modernised version of this simply looks like an instance variable, @autoreleasepool, and doesn’t need to be drained later
~ Another Objective-C 2.0 update:  a method called 'new' combines the actions of an alloc and init.
  Fraction *myFraction = [Fraction new];
~ release any class instances that you initialised so that you free up memory space - this is automatically released when the program terminates, but it’s good practice to do this yourself as soon as you finish using it in the code so your program is storing less in memory as it runs

~ ViewControllers & other types of screens will have @interface and @implementation sections, separated into .h and .m files, but you won't see any actual method calls because the methods are initiated by user actions on the mobile app, not hard coded method calls. For things that you want to happen before a screen loads, there is a special viewDidLoad method that will run whatever code/methods you want:

//------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//------------------------------------

******************************************************************************************************************
4. The Storyboard
-Table View Controller
-Navigation Controller
-View Controller
-Buttons
-Segues

~ On first glance from a Rubyist, these would probably appear to be classes because they can hold objects and have properties associated with them. There are two ways to create these: either through actual writing of code or through the storyboard.

~ The Navigation Controller gives you the ability to swipe back and forth between screens, so you can swipe back to a previous/initial screen. It gives us the navigation bar, to which you can add 'BAR BUTTONS' like 'Save', 'Cancel', 'Back', or custom ones. You can tell if you have one in place because your actual view is not extending to the top of your screen where the time and battery are.

~ The Table View is a basic screen type which holds sections consisting of rows of cells. You define how many sections and cells are in your table view, and stores the contents so that you can view them as a list as you swipe up and down on your screen. An example of a table view is your itunes music list. The grey line with a section header (in itunes each alphabet letter is a new section) demarcates the start of a new section.

~ A View Controller is simply a view/screen where you can add cells/divs and manipulate objects on the screen. This would be a selected song on your iTunes app. Your UIViewController manages a content view and its hierarchy of subviews.

~ Segues are the transition from one view to another. These can be initialized by buttons, or other trigger actions like swiping. Segues can be defined in code, noting the starting controller and final controller, as well as through a 'toolbar arrow' you drag (with mouse and CONTROL) to connect one scrren to another.
ex:
//------------------------------------
-(IBAction)unwindToList:(UIStoryboardSegue *)segue {
    AddToDoItemViewController *source = [segue sourceViewController];
    ToDoItem *item = source.toDoItem;
    if (item != nil){
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}
//------------------------------------
~ Broken down:
  ~ minus refers to the fact that this is an INSTANCE VARIABLE
  ~ (IBAction) refers to the the RETURN TYPE. The IBAction return type is a special keyword; it’s like the void keyword, but it indicates that the method is an action that you can connect to from your storyboard in Interface Builder (which is why the keyword has the IB prefix)

  ~ unwindToList is our method name
  ~ It takes a parameter called segue, which is an variable referring to UIStoryboardSegue (the arrow/segue itself)
  ~ AddToDoItemViewController refers to our View Controller page where we can create new todos
  ~ source is the variable name we are assigning to the result of the method on the left
  ~ [segue sourceViewController] is an instance/object and a UIViewController class property inside the segue's class. This is a method in another file that accesses the textField input in our view controller and returns it.
  ~ The prepareForSegue method inside the AddToDoListViewController prepares for the segue, so that the selected object can be passed into the method we are looking at. It checks if you hit the save button, and if you did hit the save button, it checks if you wrote any text. if you did, it saves it the object toDoItem as a property inside the Segue UI with the properties associated with that object.

//------------------------------------
  - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
      // Get the new view controller using [segue destinationViewController].
      // Pass the selected object to the new view controller.
      if (sender != self.saveButton) return;
      if (self.textField.text.length >0){
          self.toDoItem = [[ToDoItem alloc] init];
          self.toDoItem.itemName = self.textField.text;
          self.toDoItem.completed = NO;
      }
  }
  //------------------------------------

~ THIS is what we are accessing when we type source (the UIStoryboardSegue) .toDoItem. We take this and set it equal to a new ToDoItem object with the variable name 'item'. If the item is not nil (and therefore saved properly), then we use the addObject method to add it to the toDoItems MutableArray property that exists in our TableViewController. Because the page doesn't automatically refresh to include the new information, we need to tell it to rerender with the reloadData method.

******************************************************************************************************************
5. Looping & Conditionals in Objective C
3 ways to loop:
    FOR statement
    WHILE statement
    DO statement

FOR::
for ( init_expression; loop_condition; loop_expression )
  program statement <-- either just like this if one line, or in curly braces if multiple lines

WHILE::
while (expression)
  program statement

DO::
do
  program statement
while (expression);

CONDITIONALS::
if (expression 1)
  program statement
else if (expression 2)
  program statement 2
else
  program statement 3

SWITCH::
switch (expression)
{
case value: 1
     program statement
     program statement
     break;
case value 2:
     program statement
     program statement
     break;
default:
     program statement
     program statement
     break;
}

TERNARY OPERATOR::
condition ? expression1 : expression2
ie: s = ( x < 0 ) ? -1 : x * x
***********************************************************************************************
