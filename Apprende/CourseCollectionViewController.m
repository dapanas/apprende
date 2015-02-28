//
//  CourseCollectionViewController.m
//  Apprende
//
//  Created by Daniel Perez Alzate on 28/02/15.
//  Copyright (c) 2015 SZ. All rights reserved.
//

#import "CourseCollectionViewController.h"
#import "CourseCollectionHeaderView.h"

@interface CourseCollectionViewController () {
    NSArray *coursePhotos;
    NSArray *courseTitles;
}

@end

@implementation CourseCollectionViewController

static NSString * const reuseIdentifier = @"CourseCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    coursePhotos = [NSArray arrayWithObjects:@"placeholder.png", @"placeholder.png", @"placeholder.png", @"placeholder.png", @"placeholder.png", @"placeholder.png", @"placeholder.png", @"placeholder.png", @"placeholder.png", nil];
    
    courseTitles = [NSArray arrayWithObjects:@"Curso 1", @"Curso 2", @"Curso 3", @"Curso 4", @"Curso 5", @"Curso 6", nil];
    
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(5, 20, 20, 20);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [coursePhotos count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImageView *courseImageView = (UIImageView *)[cell viewWithTag:100];
    courseImageView.image = [UIImage imageNamed:[coursePhotos objectAtIndex:indexPath.row]];
    
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        CourseCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[NSString alloc]initWithFormat:@"Elige el curso que deseas ver"];
        headerView.title.text = title;
        
        reusableview = headerView;
    }
    
    return reusableview;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"goToCourse" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    [segue destinationViewController]
}

@end
