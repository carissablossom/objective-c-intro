#import <Foundation/Foundation.h>
// Define the Fraction class
@interface Fraction : NSObject
{
  int numerator;
  int denominator;
}
@property int numerator, denominator;
-(void) print;
-(void) setTo: (int) n over: (int) d;
-(double) convertToNum;
-(void) add: (Fraction *) f;
-(void) reduce;
@end
//---------------------------------------
// #import "Fraction.h"
@implementation Fraction
@synthesize numerator, denominator; //this is your getter & setter shortcut. causes the compiler to automatically synthesize a getter method called x and a setter method called setX:. @synthesize x;

-(void) print
{
  NSLog (@"%i/%i", numerator, denominator);
}
-(double) convertToNum
{
  if (denominator != 0)
    return (double) numerator / denominator;
  else
    return NAN;
}
-(void) setTo: (int) n over: (int) d
{
  numerator = n;
  denominator = d;
}

// add a Fraction to the receiver
-(void) add: (Fraction *) f
{
// To add two fractions:
// a/b + c/d = ((a*d) + (b*c)) / (b * d)
  numerator = numerator * f.denominator + denominator * f.numerator;
  denominator = denominator * f.denominator;
}
-(void) reduce
{
  int u = numerator;
  int v = denominator;
  int temp;
  while (v != 0) {
    temp = u % v;
    u = v;
    v = temp;
  }
  numerator /= u;
  denominator /= u;
}
@end

//---------------------------------------
// #import "Fraction.h"
int main (int argc, char *argv[])
{
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  Fraction *aFraction = [[Fraction alloc] init];
  Fraction *bFraction = [[Fraction alloc] init];
[aFraction setTo: 1 over: 4]; // set 1st fraction to 1/4
[bFraction setTo: 1 over: 2]; // set 2nd fraction to 1/2
[aFraction print];
NSLog (@"+");
[bFraction print];
NSLog (@"=");
[aFraction add: bFraction];
// reduce the result of the addition and print the result

[aFraction reduce];
[aFraction print];
[aFraction release];
[bFraction release];
[pool drain];
return 0;
}