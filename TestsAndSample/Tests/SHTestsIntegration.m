#import "SHTestsSuper.h"


@interface SHTestsIntegration : SHTestsSuper

@end

@implementation SHTestsIntegration

-(void)testSH_setShouldBeginEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;
    return didAssert;
  };
  [self.textView SH_setShouldBeginEditingBlock:block];
  [self.textView becomeFirstResponder];
  XCTAssertTrue(didAssert);
}

-(void)testSH_setDidBeginEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;
  };
  [self.textView SH_setDidBeginEditingBlock:block];
  
  [tester enterText:@"Seivan" intoViewWithAccessibilityLabel:self.textView.accessibilityLabel];
  
  XCTAssertTrue(didAssert);
}

-(void)testSH_setShouldEndEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;
    return didAssert;
    
  };
  [self.textView SH_setShouldEndEditingBlock:block];
  [self.textView becomeFirstResponder];
  [self.textView resignFirstResponder];
  XCTAssertTrue(didAssert);
  
}

-(void)testSH_setDidEndEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;
    
  };
  [self.textView SH_setDidEndEditingBlock:block];
  [self.textView becomeFirstResponder];
  [self.textView resignFirstResponder];
  XCTAssertTrue(didAssert);
  
  
}

-(void)testSH_setShouldChangeCharactersInRangeWithReplacementTextBlock;{
  __block BOOL didAssert    = NO;
  NSString * expectedString = @"S";

  
  SHTextViewRangeReplacementBlock block = ^(UITextView * textView, NSRange range, NSString * text) {
    XCTAssertEqualObjects(self.textView, textView);
    XCTAssertEqual(range, NSMakeRange(0, 0));
    XCTAssertEqualObjects(text, expectedString);
    didAssert = YES;
    return didAssert;
  };
  
  [self.textView SH_setShouldChangeCharactersInRangeWithReplacementTextBlock:block];
  
    [tester enterText:expectedString intoViewWithAccessibilityLabel:self.textView.accessibilityLabel];
    XCTAssertTrue(didAssert);
}

-(void)testSH_setDidChangeBlock;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;
  };
  
  [self.textView SH_setDidChangeBlock:block];
  [tester enterText:@"Seivan" intoViewWithAccessibilityLabel:self.textView.accessibilityLabel];

  XCTAssertTrue(didAssert);
  
  
  
}

-(void)testSH_setDidChangeSelection;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;
  };
  
  [self.textView SH_setDidChangeSelection:block];
  [tester enterText:@"Seivan" intoViewWithAccessibilityLabel:self.textView.accessibilityLabel];
  

  XCTAssertTrue(didAssert);
  
  
  
  
  
}


@end
