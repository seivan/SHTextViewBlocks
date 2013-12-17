

#import "SHTestsSuper.h"


@implementation SHTestsSuper

-(void)setUp; {
  self.vc        = UIViewController.new;
  [UIApplication sharedApplication].keyWindow.rootViewController = self.vc;
  [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];

  self.vc.view.backgroundColor = [UIColor redColor];
  self.textView = UITextView.new;
  self.textView.accessibilityLabel = @"Damn place holder";
  [self.vc.view addSubview:self.textView];
  self.textView.frame = CGRectMake(50, 50, 200, 200);


}

@end

