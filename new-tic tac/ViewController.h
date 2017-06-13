//
//  ViewController.h
//  new-tic tac
//
//  Created by Mac on 15/03/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)btnclick:(id)sender;
- (IBAction)reset:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *resetbtn;

@property (weak, nonatomic) IBOutlet UIButton *cell1;
@property (weak, nonatomic) IBOutlet UIButton *cell2;
@property (weak, nonatomic) IBOutlet UIButton *cell3;
@property (weak, nonatomic) IBOutlet UIButton *cell4;
@property (weak, nonatomic) IBOutlet UIButton *cell5;
@property (weak, nonatomic) IBOutlet UIButton *cell6;
@property (weak, nonatomic) IBOutlet UIButton *cell7;
@property (weak, nonatomic) IBOutlet UIButton *cell8;
@property (weak, nonatomic) IBOutlet UIButton *cell9;
@property(nonatomic,retain)NSString *imgname;
//@property(nonatomic,retain)UIAlertAction *reset,*ok;
//@property(nonatomic,retain)UIAlertController *alertcon;
@property int no,playertok;
@property(nonatomic,retain)UIImageView *imageView;
@property(nonatomic,retain)NSMutableArray *cells;

@end

