
#import "SHTestsSuper.h"


@interface SHTestsSelectors : SHTestsSuper

@end

@implementation SHTestsSelectors

-(void)testSH_setShouldBeginEditingBlock;{
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    return YES;
  };
  [self.textView SH_setShouldBeginEditingBlock:block];
  XCTAssertEqualObjects(self.textView.SH_blockShouldBeginEditing, block);
  [self.textView SH_setShouldBeginEditingBlock:nil];
  XCTAssertNil(self.textView.SH_blockShouldBeginEditing);
}

-(void)testSH_setDidBeginEditingBlock;{
  SHTextViewBlock block = ^(UITextView * textView) {

  };
  [self.textView SH_setDidBeginEditingBlock:block];
  XCTAssertEqualObjects(self.textView.SH_blockDidBeginEditing, block);
  
  [self.textView SH_setDidBeginEditingBlock:nil];
  XCTAssertNil(self.textView.SH_blockDidBeginEditing);

}

-(void)testSH_setShouldEndEditingBlock;{
  SHTextViewPredicateBlock block = ^(UITextView * textView) {
    return YES;
  };

  [self.textView SH_setShouldEndEditingBlock:block];
  XCTAssertEqualObjects(self.textView.SH_blockShouldEndEditing, block);
  
  [self.textView SH_setShouldEndEditingBlock:nil];
  XCTAssertNil(self.textView.SH_blockShouldEndEditing);

}

-(void)testSH_setDidEndEditingBlock;{
  SHTextViewBlock block = ^(UITextView * textView) {
    
  };
  [self.textView SH_setDidEndEditingBlock:block];
  XCTAssertEqualObjects(self.textView.SH_blockDidEndEditing, block);
  
  [self.textView SH_setDidEndEditingBlock:nil];
  XCTAssertNil(self.textView.SH_blockDidEndEditing);

  
}

-(void)testSH_setShouldChangeCharactersInRangeWithReplacementTextBlock;{
  SHTextViewRangeReplacementBlock block = ^(UITextView * textView, NSRange range, NSString * string) {
    return YES;
  };
  
  [self.textView SH_setShouldChangeCharactersInRangeWithReplacementTextBlock:block];
  XCTAssertEqualObjects(self.textView.SH_blockShouldChangeCharactersInRangeWithReplacementText, block);
  
  
  [self.textView SH_setShouldChangeCharactersInRangeWithReplacementTextBlock:nil];
  XCTAssertNil(self.textView.SH_blockShouldChangeCharactersInRangeWithReplacementText);

  
}

-(void)testSH_setDidChangeBlock;{
  SHTextViewBlock block = ^(UITextView * textView) {
    
  };
  
  [self.textView SH_setDidChangeBlock:block];
  
  XCTAssertEqualObjects(self.textView.SH_blockDidChange, block);
  
  
  [self.textView SH_setDidChangeBlock:nil];
  XCTAssertNil(self.textView.SH_blockDidChange);
  
  
}

-(void)testSH_setDidChangeSelection;{
  SHTextViewBlock block = ^(UITextView * textView) {
    
  };
  
  [self.textView SH_setDidChangeSelection:block];
  
  XCTAssertEqualObjects(self.textView.SH_blockDidChangeSelection, block);
  
  
  [self.textView SH_setDidChangeSelection:nil];
  XCTAssertNil(self.textView.SH_blockDidChangeSelection);

  
}



@end