//
//  DataViewController.m
//  JsonSample
//
//  Created by paradigm creatives on 9/18/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import "DataViewController.h"
#import "NSString+stringCategory.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *str=_data;    
      UILabel *mylabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 300, 180)];
    mylabel.text = str;
    mylabel.backgroundColor = [UIColor blueColor];
    mylabel.lineBreakMode = NSLineBreakByWordWrapping;
    [mylabel setTextColor:[UIColor grayColor]];
    CGRect newFrame=mylabel.frame;
    newFrame.size.height=[str findSize];
    mylabel.frame=newFrame;
    mylabel.numberOfLines = 0;
   [mylabel sizeToFit];
   
    [self.view addSubview:mylabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//
//- (CGFloat) getHeightOfLabel:(NSString *)text ofFontSize:(CGFloat)fontSize withConstraint:(CGSize)constraint
//{
//    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
//    
//    return size.height;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
