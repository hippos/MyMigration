//
//  valueTransformerSex.m
//  MyMigration
//
//  Created by hippos on 10/04/27.
//  Copyright 2010 hippos-lab.com. All rights reserved.
//

#import "valueTransformerSex.h"


@implementation valueTransformerSex

+ (Class)transformedValueClass
{
	return [NSNumber class];
}

+ (BOOL)allowsReverseTransformation
{
  return YES;
}

- (id)reverseTransformedValue:(id)value
{
  if ([value length] == 0)
  {
    return nil;
  }

  if ([(NSString *)value isEqualToString:@"Male"])
  {
    return [NSNumber numberWithInt:1];
  }
  else if ([(NSString *)value isEqualToString:@"FeMale"])
  {
    return [NSNumber numberWithInt:2];
  }
  else
  {
    return [NSNumber numberWithInt:0];
  }
}

- (id)transformedValue:(id)value
{
  NSNumber *num = (NSNumber *)value;

  switch ([num intValue])
  {
  case 1:
    return @"Male";

  case 2:
    return @"FeMale";

  default:
    break;
  }
  return @"None";
}

@end
