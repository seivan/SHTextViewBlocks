
#import "SHTestsSuper.h"

@interface SHTestsCallbacks : SHTestsSuper

@end

@implementation SHTestsCallbacks

-(void)testSH_setShouldBeginEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    STAssertEqualObjects(self.textView, textView, nil);
    didAssert = YES;
    ;
    return didAssert;
  };
  [self.textView SH_setShouldBeginEditingBlock:block];
  STAssertTrue(self.textView.SH_blockShouldBeginEditing(self.textView), nil);
  STAssertTrue(didAssert, nil);
}

-(void)testSH_setDidBeginEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    STAssertEqualObjects(self.textView, textView, nil);
    didAssert = YES;
  };
  [self.textView SH_setDidBeginEditingBlock:block];

  self.textView.SH_blockDidBeginEditing(self.textView);
  STAssertTrue(didAssert, nil);
}

-(void)testSH_setShouldEndEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    STAssertEqualObjects(self.textView, textView, nil);
    didAssert = YES;
    ;
    return didAssert;

  };
  
  [self.textView SH_setShouldEndEditingBlock:block];
  STAssertTrue(self.textView.SH_blockShouldEndEditing(self.textView), nil);
  STAssertTrue(didAssert, nil);  
  
}

-(void)testSH_setDidEndEditingBlock;{
  __block BOOL didAssert = NO;
  SHTextViewBlock block = ^(UITextView * textView) {
    STAssertEqualObjects(self.textView, textView, nil);
    didAssert = YES;

  };
  [self.textView SH_setDidEndEditingBlock:block];
  self.textView.SH_blockDidEndEditing(self.textView);
  STAssertTrue(didAssert, nil);
  
  
}

-(void)testSH_setShouldChangeCharactersInRangeWithReplacementTextBlock;{
  __block BOOL didAssert = NO;
  NSString * assertString = @"Seivan";
  SHTextViewRangeReplacementBlock block = ^(UITextView * textView, NSRange range, NSString * string) {
    STAssertEqualObjects(self.textView, textView, nil);
    STAssertEquals(range, NSMakeRange(0, 0), nil);
    STAssertEqualObjects(string, assertString, nil);
    didAssert = YES;
    return didAssert;
  };
  
  [self.textView SH_setShouldChangeCharactersInRangeWithReplacementTextBlock:block];
  STAssertTrue(self.textView.SH_blockShouldChangeCharactersInRangeWithReplacementText(self.textView, NSMakeRange(0,0), assertString), nil);
  STAssertTrue(didAssert, nil);
  
  
}

@end
