//
//  valueTransformerSex.h
//  MyMigration
//
//  Created by hippos on 10/04/27.
//  Copyright 2010 hippos-lab.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface valueTransformerSex : NSValueTransformer
{

}

- (id)   transformedValue:(id)value;
- (id)   reverseTransformedValue:(id)value;
+ (Class)transformedValueClass;
+ (BOOL) allowsReverseTransformation;

@end
