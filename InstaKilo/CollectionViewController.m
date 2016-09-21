//
//  CollectionViewController.m
//  InstaKilo
//
//  Created by Cay Cornelius on 21/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import "CollectionViewController.h"
#import "CustomCollectionViewCell.h"
#import "SectionCollectionReusableView.h"
#import "Photo.h"

@interface CollectionViewController ()

@property (nonatomic) NSMutableArray *imagesArray;
@property (nonatomic) NSMutableArray *imageSectionTitlesArray;


@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    self.collectionView.backgroundColor = [UIColor orangeColor];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f);
    
    [self setUpImagesAndImagesArray];
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

- (void)setUpImagesAndImagesArray {
    Photo *berlin1 = [[Photo alloc] init];
    UIImage *berlinImage1 = [UIImage imageNamed:@"brandenburg-gate-417890_640"];
    berlin1.image = berlinImage1;
    berlin1.name = @"Brandenburger Tor";
    berlin1.subject = @"Berlin";
    
    Photo *berlin2 = [[Photo alloc] init];
    UIImage *berlinImage2 = [UIImage imageNamed:@"bundestag-204771_640"];
    berlin2.image = berlinImage2;
    berlin2.name = @"Bundestag";
    berlin2.subject = @"Berlin";
    
    Photo *berlin3 = [[Photo alloc] init];
    UIImage *berlinImage3 = [UIImage imageNamed:@"east-side-50727_640"];
    berlin3.image = berlinImage3;
    berlin3.name = @"Berliner Mauer";
    berlin3.subject = @"Berlin";
    
    Photo *berlin4 = [[Photo alloc] init];
    UIImage *berlinImage4 = [UIImage imageNamed:@"federal-chancellery-637999_640"];
    berlin4.image = berlinImage4;
    berlin4.name = @"Bundeskanzleramt";
    berlin4.subject = @"Berlin";
    
    Photo *berlin5 = [[Photo alloc] init];
    UIImage *berlinImage5 = [UIImage imageNamed:@"siegessaule-200714_640"];
    berlin5.image = berlinImage5;
    berlin5.name = @"Siegessäule";
    berlin5.subject = @"Berlin";
    
    
    Photo *kiel1 = [[Photo alloc] init];
    UIImage *kielImage1 = [UIImage imageNamed:@"falkenstein-1433347_640"];
    kiel1.image = kielImage1;
    kiel1.name = @"Falkenstein";
    kiel1.subject = @"Kiel";
    
    Photo *kiel2 = [[Photo alloc] init];
    UIImage *kielImage2 = [UIImage imageNamed:@"kiel-260290_640"];
    kiel2.image = kielImage2;
    kiel2.name = @"Kiel bei Nacht";
    kiel2.subject = @"Kiel";
    
    Photo *kiel3 = [[Photo alloc] init];
    UIImage *kielImage3 = [UIImage imageNamed:@"kiel-859562_640"];
    kiel3.image = kielImage3;
    kiel3.name = @"Schwedendamm";
    kiel3.subject = @"Kiel";
    
    Photo *kiel4 = [[Photo alloc] init];
    UIImage *kielImage4 = [UIImage imageNamed:@"kiel-1431753_640"];
    kiel4.image = kielImage4;
    kiel4.name = @"Gorch Fock";
    kiel4.subject = @"Kiel";
    
    Photo *kiel5 = [[Photo alloc] init];
    UIImage *kielImage5 = [UIImage imageNamed:@"lock-525120_640"];
    kiel5.image = kielImage5;
    kiel5.name = @"Holtenau";
    kiel5.subject = @"Kiel";

    self.imagesArray = [@[@[berlin1, berlin2, berlin3, berlin4, berlin5], @[kiel1, kiel2, kiel3, kiel4, kiel5]] mutableCopy];
    
    self.imageSectionTitlesArray = [@[@"Berlin", @"Kiel"] mutableCopy];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.imagesArray count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *sectionArray = self.imagesArray[section];
    return [sectionArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    
    // Configure the cell
    Photo *photoObject = self.imagesArray[indexPath.section][indexPath.row];
    cell.imageView.image = photoObject.image;
    // cell.imageView.image = [self.imageArray objectAtIndex:indexPath.item];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    SectionCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"sectionTitle" forIndexPath:indexPath];
    
    Photo *photoObject = self.imagesArray[indexPath.section][indexPath.row];
    
    if ([photoObject.subject  isEqual: @"Berlin"]) {
        view.sectionTitle.text = @"Berlin";
    } else if ([photoObject.subject  isEqual: @"Kiel"]) {
        view.sectionTitle.text = @"Kiel";
    }
    
    return view;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
