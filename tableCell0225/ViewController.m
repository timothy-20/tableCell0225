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
    
    cell.contentView.layer.cornerRadius = 5;
    cell.contentView.layer.borderWidth = 1;
    cell.contentView.layer.borderColor = [UIColor blackColor].CGColor;
        
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [imageNameArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (IBAction)editTapped:(id)sender {
    [_myTableView setEditing: !_myTableView.editing];
}

- (IBAction)refreshTapped:(id)sender {
    [_myTableView reloadData];
}
//
//-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    if(self = [super initWithNibName:nibNameOrNil bundle:nibNameOrNil]){
//        UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
//    }
//    return self;
//}
//
//-(void)add
//{
//    NSLog(@"add item");
//}


@end
