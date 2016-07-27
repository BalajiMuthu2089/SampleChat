//
//  ViewController.m
//  SampleChat
//
//  Created by Ramdhas on 04/06/16.
//  Copyright © 2016 balaji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize addButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // floating button frame
    CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 150 - 65, [UIScreen mainScreen].bounds.size.height - 40 - 30, 64, 64);
    addButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"pluss"] andPressedImage:[UIImage imageNamed:@"closeButton"] withScrollview:_tableView];

    //floating button
    addButton.imageArray = @[@"msg.png",@"cinema-1.png",@"Copy.png"];
    addButton.labelArray = @[@"msg",@"cinema-1",@"Copy"];

    //plus button code
    addButton.hideWhileScrolling = NO;
    addButton.delegate = self;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:addButton];

    // Plist set path  and convert NSString to NSDictionary
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
    content = [[NSDictionary alloc]initWithContentsOfFile:path];
    NSLog(@"%@", content);
    Keys=[content allKeys];  //convert dictionary to array value Keys

    //Reveal Viewcontroller
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController){
        [self.SidebarButton addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
     }
}


-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

//LGChatController
- (BOOL)shouldChatController:(LGChatController *)chatController addMessage:(LGChatMessage *)message{
    // This is implemented just for demonstration so the sent by is randomized.  This way, the full functionality can be demonstrated.
    message.sentByString = arc4random_uniform(2) == 1 ? [LGChatMessage SentByOpponentString] : [LGChatMessage SentByUserString];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// data displays
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"Count: %lu",(unsigned long)[Keys count]);
    return [Keys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    CustomeCell *Customecell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (Customecell == nil){
        Customecell =[[CustomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Customecell.nameLbl.text = [Keys objectAtIndex:indexPath.row];
    Customecell.Img.image = [UIImage imageNamed:[[content valueForKey:[Keys objectAtIndex:indexPath.row]] valueForKey:@"image"]];
    Customecell.statusLabel.text = [[content valueForKey:[Keys objectAtIndex:indexPath.row]] valueForKey:@"status"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];

    // NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];  // current date
    NSString *dateString = [dateFormatter stringFromDate:[[content valueForKey:[Keys objectAtIndex:indexPath.row]] valueForKey:@"date"]];
    NSLog(@"date: %@", dateString);
    Customecell.dateLbl.text=dateString;
    return Customecell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LGChatController *chatController = [LGChatController new];
    chatController.title =[Keys objectAtIndex:indexPath.row];
    chatController.opponentImage = [UIImage imageNamed:[[content valueForKey:[Keys objectAtIndex:indexPath.row]] valueForKey:@"image"]];
    chatController.delegate = self;
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController pushViewController:chatController animated:YES];
}

- (IBAction)settingsButton:(id)sender {

}

- (IBAction)SidebarButton:(id)sender {

}

@end
