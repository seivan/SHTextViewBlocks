
#import "SHTestsSuper.h"

@interface SHTestsCallbacks : SHTestsSuper

@end

@implementation SHTestsCallbacks

-(void)testSH_setShouldBeginEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;
    ;
    return didAssert;
  };
  [self.textView SH_setShouldBeginEditingBlock:block];
  XCTAssertTrue(self.textView.SH_blockShouldBeginEditing(self.textView));
  XCTAssertTrue(didAssert);
}

-(void)testSH_setDidBeginEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;
  };
  [self.textView SH_setDidBeginEditingBlock:block];

  self.textView.SH_blockDidBeginEditing(self.textView);
  XCTAssertTrue(didAssert);
}

-(void)testSH_setShouldEndEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;
    ;
    return didAssert;

  };
  
  [self.textView SH_setShouldEndEditingBlock:block];
  XCTAssertTrue(self.textView.SH_blockShouldEndEditing(self.textView));
  XCTAssertTrue(didAssert);  
  
}

-(void)testSH_setDidEndEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;

  };
  [self.textView SH_setDidEndEditingBlock:block];
  self.textView.SH_blockDidEndEditing(self.textView);
  XCTAssertTrue(didAssert);
  
  
}

-(void)testSH_setShouldChangeCharactersInRangeWithReplacementTextBlock;{
  __block BOOL didAssert = NO;
  NSString * assertString = @"Seivan";
  SHTextViewRangeReplacementBlock block = ^(UITextView * textView, NSRange range, NSString * string) {
    XCTAssertEqualObjects(self.textView, textView);
    XCTAssertEqual(range, NSMakeRange(0, 0));
    XCTAssertEqualObjects(string, assertString);
    didAssert = YES;
    return didAssert;
  };
  
  [self.textView SH_setShouldChangeCharactersInRangeWithReplacementTextBlock:block];
  XCTAssertTrue(self.textView.SH_blockShouldChangeCharactersInRangeWithReplacementText(self.textView, NSMakeRange(0,0), assertString));
  XCTAssertTrue(didAssert);
  
  
}

-(void)testSH_setDidChangeBlock;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;
  };
  
  [self.textView SH_setDidChangeBlock:block];
  
  self.textView.SH_blockDidChange(self.textView);
  XCTAssertTrue(didAssert);

  
  
}

-(void)testSH_setDidChangeSelection;{
    __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    XCTAssertEqualObjects(self.textView, textView);
    didAssert = YES;
  };
  
  [self.textView SH_setDidChangeSelection:block];
  
  self.textView.SH_blockDidChangeSelection(self.textView);
  XCTAssertTrue(didAssert);

  
  
  
  
}


@end
