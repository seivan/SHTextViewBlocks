


#import <XCTest/XCTest.h>
#import "KIF.h"
#import "SHTestCaseAdditions.h"
#import "SHTextViewBlocks.h"



@interface SHTestsSuper : KIFTestCase
@property(nonatomic,strong) UIViewController * vc;
@property(nonatomic,strong) UITextView       * textView;
@end

