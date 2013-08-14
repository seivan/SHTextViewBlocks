
#import "SHTestsSuper.h"


@interface SHTestsSelectors : SHTestsSuper

@end

@implementation SHTestsSelectors

-(void)testSH_setShouldBeginEditingBlock;{
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    return YES;
  };
  [self.textView SH_setShouldBeginEditingBlock:block];
  STAssertEqualObjects(self.textView.SH_blockShouldBeginEditing, block, nil);
  [self.textView SH_setShouldBeginEditingBlock:nil];
  STAssertNil(self.textView.SH_blockShouldBeginEditing, nil);
}

-(void)testSH_setDidBeginEditingBlock;{
  SHTextViewBlock block = ^(UITextView * textView) {

  };
  [self.textView SH_setDidBeginEditingBlock:block];
  STAssertEqualObjects(self.textView.SH_blockDidBeginEditing, block, nil);
  
  [self.textView SH_setDidBeginEditingBlock:nil];
  STAssertNil(self.textView.SH_blockDidBeginEditing, nil);

}

-(void)testSH_setShouldEndEditingBlock;{
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    return YES;
  };

  [self.textView SH_setShouldEndEditingBlock:block];
  STAssertEqualObjects(self.textView.SH_blockShouldEndEditing, block, nil);
  
  [self.textView SH_setShouldEndEditingBlock:nil];
  STAssertNil(self.textView.SH_blockShouldEndEditing, nil);

}

-(void)testSH_setDidEndEditingBlock;{
  SHTextViewBlock block = ^(UITextView * textView) {
    
  };
  [self.textView SH_setDidEndEditingBlock:block];
  STAssertEqualObjects(self.textView.SH_blockDidEndEditing, block, nil);
  
  [self.textView SH_setDidEndEditingBlock:nil];
  STAssertNil(self.textView.SH_blockDidEndEditing, nil);

  
}

-(void)testSH_setShouldChangeCharactersInRangeWithReplacementTextBlock;{
  SHTextViewRangeReplacementBlock block = ^(UITextView * textView, NSRange range, NSString * string) {
    return YES;
  };
  
  [self.textView SH_setShouldChangeCharactersInRangeWithReplacementTextBlock:block];
  STAssertEqualObjects(self.textView.SH_blockShouldChangeCharactersInRangeWithReplacementText, block, nil);
  
  
  [self.textView SH_setShouldChangeCharactersInRangeWithReplacementTextBlock:nil];
  STAssertNil(self.textView.SH_blockShouldChangeCharactersInRangeWithReplacementText, nil);

  
}



@end