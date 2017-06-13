//
//  ViewController.m
//  new-tic tac
//
//  Created by Mac on 15/03/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "ViewController.h"
int count=0;
int flag=0;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cells=[[NSMutableArray alloc]initWithObjects:_cell1,_cell2,_cell3,_cell4,_cell5,_cell6,_cell7,_cell8,_cell9, nil];
    
      // NSAttributedString *s=@"";
   
    // Do any additional setup after loading the view, typically from a nib.
    _playertok=1;
    
    
    _imgname=@"cross";
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)disablebtn:(UIButton*)sender{
    sender.enabled=NO;
}
-(void)first:(UIButton*)cell1 second:(UIButton*)cell2 third:(UIButton*)cell3
{
    cell1.backgroundColor=[UIColor redColor];
     cell2.backgroundColor=[UIColor redColor];
     cell3.backgroundColor=[UIColor redColor];
}
-(void)checkwin:(int)pno andno:(int)counter{
    int flag=0;
    NSLog(@"in check");
     if([[_cell1 backgroundImageForState:UIControlStateNormal] isEqual:[_cell2 backgroundImageForState:UIControlStateNormal]] && [[_cell1 backgroundImageForState:UIControlStateNormal] isEqual:[_cell3 backgroundImageForState:UIControlStateNormal]])
     {
         [self first:_cell1 second:_cell2 third:_cell3];
         flag=1;
     }
   else if([[_cell4 backgroundImageForState:UIControlStateNormal] isEqual:[_cell5 backgroundImageForState:UIControlStateNormal]] && [[_cell6 backgroundImageForState:UIControlStateNormal] isEqual:[_cell5 backgroundImageForState:UIControlStateNormal]])
    {
        
        [self first:_cell4 second:_cell5 third:_cell6];
        flag=1;
    }
   else if([[_cell7 backgroundImageForState:UIControlStateNormal] isEqual:[_cell8 backgroundImageForState:UIControlStateNormal]] && [[_cell7 backgroundImageForState:UIControlStateNormal] isEqual:[_cell9 backgroundImageForState:UIControlStateNormal]])
    {
        
        [self first:_cell7 second:_cell8 third:_cell9];
        flag=1;
    }
   else if([[_cell1 backgroundImageForState:UIControlStateNormal] isEqual:[_cell4 backgroundImageForState:UIControlStateNormal]] && [[_cell4 backgroundImageForState:UIControlStateNormal] isEqual:[_cell7 backgroundImageForState:UIControlStateNormal]])
    {
        
        [self first:_cell1 second:_cell4 third:_cell7];
        flag=1;
    }
    else if([[_cell2 backgroundImageForState:UIControlStateNormal] isEqual:[_cell5 backgroundImageForState:UIControlStateNormal]] && [[_cell5 backgroundImageForState:UIControlStateNormal] isEqual:[_cell8 backgroundImageForState:UIControlStateNormal]])
    {
        
        [self first:_cell2 second:_cell5 third:_cell8];
        flag=1;
    }
   else if([[_cell3 backgroundImageForState:UIControlStateNormal] isEqual:[_cell6 backgroundImageForState:UIControlStateNormal]] && [[_cell3 backgroundImageForState:UIControlStateNormal] isEqual:[_cell9 backgroundImageForState:UIControlStateNormal]])
    {
        
        [self first:_cell3 second:_cell6 third:_cell9];
        flag=1;
    }
   else if([[_cell1 backgroundImageForState:UIControlStateNormal] isEqual:[_cell5 backgroundImageForState:UIControlStateNormal]] && [[_cell1 backgroundImageForState:UIControlStateNormal] isEqual:[_cell9 backgroundImageForState:UIControlStateNormal]])
    {
        
        [self first:_cell1 second:_cell5 third:_cell9];
        flag=1;
    }
   else if([[_cell3 backgroundImageForState:UIControlStateNormal] isEqual:[_cell5 backgroundImageForState:UIControlStateNormal]] && [[_cell3 backgroundImageForState:UIControlStateNormal] isEqual:[_cell7 backgroundImageForState:UIControlStateNormal]])
    {
        
        [self first:_cell3 second:_cell5 third:_cell7];
        flag=1;
    }
    NSString *lbl,*imagename;
    if(pno==2)
        imagename=@"cross";
    else
        imagename=@"round";
       if(flag==0&&counter==9)
        lbl=@"draw";
    else
    {
        NSLog(@"DONE");
        lbl=@"win";
    }
    
    
    UIAlertController* alertcon= [UIAlertController
                                  alertControllerWithTitle:@"result"
                                  message:lbl
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *reset=[UIAlertAction actionWithTitle:NSLocalizedString(@"reset", @"reset action") style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
        [self reset:_resetbtn];
    }];
    
    UIAlertAction * ok=[UIAlertAction actionWithTitle:NSLocalizedString(@"play again", @"ok action") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self reset:_resetbtn];
    }];
    
    
    UIViewController *view1 = [[UIViewController alloc]init];
    view1.view.backgroundColor=[UIColor blueColor];
    
    UIImageView *imgv=[[UIImageView alloc]initWithFrame:CGRectMake(90, 20, 50, 50)];
    imgv.image=[UIImage imageNamed:imagename];
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(180, 10, 80, 80)];
    //lable.backgroundColor=[UIColor cyanColor];
    lable.text=lbl;
    lable.textColor=[UIColor redColor];
    lable.font=[UIFont systemFontOfSize:30];
    
    UIView *v=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    v.backgroundColor=[UIColor cyanColor];
    [view1 setView:v];
    [v addSubview:lable];
    [v addSubview:imgv];
    
    [alertcon setValue:view1 forKey:@"contentViewController"];
    if(flag==1)
    {
    
        
        [alertcon addAction:reset];
        [alertcon addAction:ok];
       
        
        [self presentViewController:alertcon animated:YES completion:nil];

        
    }
    if(counter==9&&flag==0)
    {
        [alertcon addAction:reset];
        [alertcon addAction:ok];
        
        
        [self presentViewController:alertcon animated:YES completion:nil];
        

    }
 }
-(void)updateplayer{
    if(_playertok==1)
    {
        _playertok=2;
        
        _imgname=@"round";
    }
    else if(_playertok==2)
    {
        _playertok=1;
       
        _imgname=@"cross";
    }
}
- (IBAction)btnclick:(id)sender {
    count =count+1;
    if(sender==_cell1)
    {
    
        [_cell1 setBackgroundImage:[UIImage imageNamed:_imgname] forState:UIControlStateNormal];
           [self updateplayer];
       
        [self disablebtn:_cell1];
      
    }
    if(sender==_cell2)
    {
      
        [_cell2 setBackgroundImage:[UIImage imageNamed:_imgname] forState:UIControlStateNormal];
        [self updateplayer];
        [self disablebtn:_cell2];
        
    }
     if(sender==_cell3)
    {
        
               [_cell3 setBackgroundImage:[UIImage imageNamed:_imgname] forState:UIControlStateNormal];
        [self updateplayer];
       
    [self disablebtn:_cell3];
        
    }
     if(sender==_cell4)
    {
        [_cell4 setBackgroundImage:[UIImage imageNamed:_imgname] forState:UIControlStateNormal];
        [self updateplayer];
        
        [self disablebtn:_cell4];
    }
     if(sender==_cell5)
    {
        [_cell5 setBackgroundImage:[UIImage imageNamed:_imgname] forState:UIControlStateNormal];
        [self updateplayer];
        
        [self disablebtn:_cell5];
    }
    if(sender==_cell6)
    {
        
        [_cell6 setBackgroundImage:[UIImage imageNamed:_imgname] forState:UIControlStateNormal];
        [self updateplayer];
       
        [self disablebtn:_cell6];
    }
    if(sender==_cell7)
    {
        
        [_cell7 setBackgroundImage:[UIImage imageNamed:_imgname] forState:UIControlStateNormal];
        [self updateplayer];
        
       
        
        [self disablebtn:_cell7];
    }
     if(sender==_cell8)
    {
        
        [_cell8 setBackgroundImage:[UIImage imageNamed:_imgname] forState:UIControlStateNormal];
        [self updateplayer];
        
        [self disablebtn:_cell8];
        
    }
    if(sender==_cell9)
    {
        [_cell9 setBackgroundImage:[UIImage imageNamed:_imgname] forState:UIControlStateNormal];
        [self updateplayer];
        
        [self disablebtn:_cell9];
    }
    
     [self checkwin:_playertok andno:count];
    
}

- (IBAction)reset:(id)sender {
     int cnt=1;
    for(UIButton *B in _cells)
    {
        B.enabled=YES;
        [B setBackgroundImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
        B.backgroundColor=[UIColor yellowColor];
        _playertok=1;
        _imgname=@"cross";
        count=0;
        cnt++;
    }
}
@end
