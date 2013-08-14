#import "SHTestsSuper.h"
#import "SHFastEnumerationProtocols.h"

@interface SHTestsIntegration : SHTestsSuper

@end

@implementation SHTestsIntegration

-(void)testSH_setShouldBeginEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    STAssertEqualObjects(self.textView, textView, nil);
    didAssert = YES;
    return didAssert;
  };
  [self.textView SH_setShouldBeginEditingBlock:block];
  [self.textView becomeFirstResponder];
  STAssertTrue(didAssert, nil);
}

-(void)testSH_setDidBeginEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    STAssertEqualObjects(self.textView, textView, nil);
    didAssert = YES;
  };
  [self.textView SH_setDidBeginEditingBlock:block];
  
  [tester enterText:@"Seivan" intoViewWithAccessibilityLabel:self.textView.accessibilityLabel];
  
  STAssertTrue(didAssert, nil);
}

-(void)testSH_setShouldEndEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    STAssertEqualObjects(self.textView, textView, nil);
    didAssert = YES;
    return didAssert;
    
  };
  [self.textView SH_setShouldEndEditingBlock:block];
  [self.textView becomeFirstResponder];
  [self.textView resignFirstResponder];
  STAssertTrue(didAssert, nil);
  
}

-(void)testSH_setDidEndEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    STAssertEqualObjects(self.textView, textView, nil);
    didAssert = YES;
    
  };
  [self.textView SH_setDidEndEditingBlock:block];
  [self.textView becomeFirstResponder];
  [self.textView resignFirstResponder];
  STAssertTrue(didAssert, nil);
  
  
}

-(void)testSH_setShouldChangeCharactersInRangeWithReplacementTextBlock;{
  __block BOOL didAssert    = NO;
  NSString * expectedString = @"S";

  
  SHTextViewRangeReplacementBlock block = ^(UITextView * textView, NSRange range, NSString * text) {
    STAssertEqualObjects(self.textView, textView, nil);
    STAssertEquals(range, NSMakeRange(0, 0), nil);
    STAssertEqualObjects(text, expectedString, nil);
    didAssert = YES;
    return didAssert;
  };
  
  [self.textView SH_setShouldChangeCharactersInRangeWithReplacementTextBlock:block];
  
    [tester enterText:expectedString intoViewWithAccessibilityLabel:self.textView.accessibilityLabel];
    STAssertTrue(didAssert, nil);
}

-(void)testSH_setDidChangeBlock;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    STAssertEqualObjects(self.textView, textView, nil);
    didAssert = YES;
  };
  
  [self.textView SH_setDidChangeBlock:block];
  [tester enterText:@"Seivan" intoViewWithAccessibilityLabel:self.textView.accessibilityLabel];

  STAssertTrue(didAssert, nil);
  
  
  
}

-(void)testSH_setDidChangeSelection;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    STAssertEqualObjects(self.textView, textView, nil);
    didAssert = YES;
  };
  
  [self.textView SH_setDidChangeSelection:block];
  [tester enterText:@"Seivan" intoViewWithAccessibilityLabel:self.textView.accessibilityLabel];
  

  STAssertTrue(didAssert, nil);
  
  
  
  
  
}


@end
