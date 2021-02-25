//
//  ViewController.m
//  tableCell0225
//
//  Created by 임정운 on 2021/02/25.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *imageNameArray;
}

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self arraySetUp];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    //의문 중에 있었던 UITableViewDelegate의 정체. 골자는 위의 2줄.
}

-(void)arraySetUp
{
    imageNameArray = [NSMutableArray arrayWithArray: @[@"Commando", @"Engineer", @"Huntress"]];
    //이미지 Array는 이런식으로 값을 집어넣나 보다. 해당 방식은 C언어와 근접해 있는 듯.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return imageNameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.imageView.image = [UIImage imageNamed: imageNameArray[indexPath.row]];
    cell.textLabel.text = imageNameArray[indexPath.row];
        
    return cell;
}

@end
