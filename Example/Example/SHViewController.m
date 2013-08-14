//
//  SHViewController.m
//  Example
//
//  Created by Seivan Heidari on 5/14/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//



#import "SHViewController.h"
#import "SHTextViewBlocks.h"

@interface SHViewController ()
@property(nonatomic,weak) IBOutlet UITextView * textView;

@end

@implementation SHViewController

-(void)unwinder:(UIStoryboardSegue *)sender; {
  
}

-(void)viewDidLoad; {
  [super viewDidLoad];

  [self.textView SH_setDidBeginEditingBlock:^(UITextView *textView) {
    
  }];
  
  [self.textView SH_setShouldBeginEditingBlock:^BOOL(UITextView *textView) {
    return YES;
  }];
  


}

-(void)viewDidAppear:(BOOL)animated; {
  [super viewDidAppear:animated];
  __weak typeof(self) weakSelf = self;
  double delayInSeconds = 2.0;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    [weakSelf.navigationController popToRootViewControllerAnimated:YES];
  });
  

}

@end
