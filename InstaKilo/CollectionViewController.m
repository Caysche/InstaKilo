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
#import "AssetsLibrary/AssetsLibrary.h"
#import "ImageIO/ImageIO.h"

@interface CollectionViewController ()

@property (nonatomic) NSMutableArray *imagesArray;
@property (nonatomic) NSString *sortMode;
@property (nonatomic) NSMutableSet *subjectsSet;
@property (nonatomic) NSMutableArray *subjects;
@property (nonatomic) NSMutableSet *locationsSet;
@property (nonatomic) NSMutableArray *locations;
@property (nonatomic) NSMutableArray *locationsFinal;
@property (nonatomic) NSMutableArray *subjectsFinal;
@property (nonatomic) NSTimeInterval lastClick;
@property (nonatomic) NSIndexPath *lastIndexPath;

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
    
    self.sortMode = @"Subject";
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

//-(NSMutableData *)getImagedataPhotoLibrary:(NSDictionary *)pImgDictionary andImage:(UIImage *)pImage
//{
//    NSData* data = UIImagePNGRepresentation(pImage);
//    
//    CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)data, NULL);
//    NSMutableDictionary *metadataAsMutable = [[pImgDictionary mutableCopy]autorelease];
//    
//    CFStringRef UTI = CGImageSourceGetType(source);
//    
//    NSMutableData *dest_data = [NSMutableData data];
//    
//    //For Mutabledata
//    CGImageDestinationRef destination = CGImageDestinationCreateWithData((CFMutableDataRef)dest_data, UTI, 1, NULL);
//    
//    if(!destination)
//        dest_data = [[data mutableCopy] autorelease];
//    else
//    {
//        CGImageDestinationAddImageFromSource(destination, source, 0, (CFDictionaryRef) metadataAsMutable);
//        BOOL success = CGImageDestinationFinalize(destination);
//        if(!success)
//            dest_data = [[data mutableCopy] autorelease];
//    }
//    if(destination)
//        CFRelease(destination);
//    
//    CFRelease(source);
//    
//    return dest_data;
//}

- (void)setUpImagesAndImagesArray {
    Photo *berlin1 = [[Photo alloc] init];
    UIImage *berlinImage1 = [UIImage imageNamed:@"brandenburg-gate-417890_640"];
    berlin1.image = berlinImage1;
    berlin1.name = @"Brandenburger Tor";
    berlin1.subject = @"Berlin";
    berlin1.location = @"Berlin Mitte";
    
    Photo *berlin2 = [[Photo alloc] init];
    UIImage *berlinImage2 = [UIImage imageNamed:@"bundestag-204771_640"];
    berlin2.image = berlinImage2;
    berlin2.name = @"Bundestag";
    berlin2.subject = @"Berlin";
    berlin2.location = @"Berlin Mitte";
    
    Photo *berlin3 = [[Photo alloc] init];
    UIImage *berlinImage3 = [UIImage imageNamed:@"east-side-50727_640"];
    berlin3.image = berlinImage3;
    berlin3.name = @"Berliner Mauer";
    berlin3.subject = @"Berlin";
    berlin3.location = @"Berliner Osten";
    
    Photo *berlin4 = [[Photo alloc] init];
    UIImage *berlinImage4 = [UIImage imageNamed:@"federal-chancellery-637999_640"];
    berlin4.image = berlinImage4;
    berlin4.name = @"Bundeskanzleramt";
    berlin4.subject = @"Berlin";
    berlin4.location = @"Berlin Mitte";
    
    Photo *berlin5 = [[Photo alloc] init];
    UIImage *berlinImage5 = [UIImage imageNamed:@"siegessaule-200714_640"];
    berlin5.image = berlinImage5;
    berlin5.name = @"Siegessäule";
    berlin5.subject = @"Berlin";
    berlin5.location = @"Berlin Mitte";
    
    
    Photo *kiel1 = [[Photo alloc] init];
    UIImage *kielImage1 = [UIImage imageNamed:@"falkenstein-1433347_640"];
    kiel1.image = kielImage1;
    kiel1.name = @"Falkenstein";
    kiel1.subject = @"Kiel";
    kiel1.location = @"Kiel Falkenstein";
    
    Photo *kiel2 = [[Photo alloc] init];
    UIImage *kielImage2 = [UIImage imageNamed:@"kiel-260290_640"];
    kiel2.image = kielImage2;
    kiel2.name = @"Kiel bei Nacht";
    kiel2.subject = @"Kiel";
    kiel2.location = @"Kleiner Kiel";
    
    Photo *kiel3 = [[Photo alloc] init];
    UIImage *kielImage3 = [UIImage imageNamed:@"kiel-859562_640"];
    kiel3.image = kielImage3;
    kiel3.name = @"Schwedendamm";
    kiel3.subject = @"Kiel";
    kiel3.location = @"Kieler Hafen";
    
    Photo *kiel4 = [[Photo alloc] init];
    UIImage *kielImage4 = [UIImage imageNamed:@"kiel-1431753_640"];
    kiel4.image = kielImage4;
    kiel4.name = @"Gorch Fock";
    kiel4.subject = @"Kiel";
    kiel4.location = @"Kieler Hafen";
    
    Photo *kiel5 = [[Photo alloc] init];
    UIImage *kielImage5 = [UIImage imageNamed:@"lock-525120_640"];
    kiel5.image = kielImage5;
    kiel5.name = @"Holtenau";
    kiel5.subject = @"Kiel";
    kiel5.location = @"Kiel Holtenau";

    if (!self.imagesArray) {
        self.imagesArray = [@[berlin1, berlin2, berlin3, berlin4, berlin5, kiel1, kiel2, kiel3, kiel4, kiel5] mutableCopy];
    }
    
    [self setUpSortArrays];
}

- (void)setUpSortArrays {
    
    self.subjectsSet = [[NSMutableSet alloc] init];
    self.locationsSet = [[NSMutableSet alloc] init];
    self.locations = [[NSMutableArray alloc] init];
    self.subjects = [[NSMutableArray alloc] init];
    
    for (Photo *photo in self.imagesArray) {
        if (photo.subject != nil) {
            [self.subjectsSet addObject:photo.subject];
        }
    }
    
    for (NSString *subject in self.subjectsSet) {
        [self.subjects addObject:subject];
    }
    
    self.subjectsFinal = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [self.subjects count]; i++) {
        NSMutableArray *intermediateArray = [[NSMutableArray alloc] init];
        for (Photo *photo in self.imagesArray) {
            if ([self.subjects[i] isEqualToString:photo.subject]) {
                [intermediateArray addObject:photo];
            }
        }
        [self.subjectsFinal addObject:intermediateArray];
    }
    
    
    for (Photo *photo in self.imagesArray) {
        if (photo.location != nil) {
            [self.locationsSet addObject:photo.location];
        }
    }
    
    for (NSString *location in self.locationsSet) {
        [self.locations addObject:location];
    }
    
    self.locationsFinal = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [self.locations count]; i++) {
        NSMutableArray *intermediateArray = [[NSMutableArray alloc] init];
        for (Photo *photo in self.imagesArray) {
            if ([self.locations[i] isEqualToString:photo.location]) {
                [intermediateArray addObject:photo];
            }
        }
        [self.locationsFinal addObject:intermediateArray];
    }

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if ([self.sortMode isEqualToString:@"Subject"]) {
        return [self.subjects count];
    } else if ([self.sortMode isEqualToString:@"Location"]) {
        return [self.locations count];
    }
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.sortMode isEqualToString:@"Subject"]) {
        NSArray *sectionArray = self.subjectsFinal[section];
        return [sectionArray count];
    } else if ([self.sortMode isEqualToString:@"Location"]) {
        NSArray *sectionArray = self.locationsFinal[section];
        return [sectionArray count];
    }
//    NSArray *sectionArray = self.imagesArray[section];
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    
    // Configure the cell
    Photo *photoObject = [[Photo alloc] init];
    if ([self.sortMode isEqualToString:@"Subject"]) {
        photoObject = self.subjectsFinal[indexPath.section][indexPath.row];
    } else if ([self.sortMode isEqualToString:@"Location"]) {
        photoObject = self.locationsFinal[indexPath.section][indexPath.row];
    }
    cell.imageView.image = photoObject.image;
    // cell.imageView.image = [self.imageArray objectAtIndex:indexPath.item];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    SectionCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"sectionTitle" forIndexPath:indexPath];
    Photo *photoObject = [[Photo alloc] init];;
    if ([self.sortMode isEqualToString:@"Subject"]) {
        photoObject = self.subjectsFinal[indexPath.section][indexPath.row];
        view.sectionTitle.text = photoObject.subject;
    } else if ([self.sortMode isEqualToString:@"Location"]) {
        photoObject = self.locationsFinal[indexPath.section][indexPath.row];
        view.sectionTitle.text = photoObject.location;
    }
    
    return view;
}

#pragma mark <UICollectionViewDelegate>

- (IBAction)pressedSort:(UIBarButtonItem *)sender {
    self.sortMode = ([self.sortMode  isEqual: @"Subject"]) ? @"Location" : @"Subject";
    [self.collectionView reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSTimeInterval now = [[[NSDate alloc] init] timeIntervalSince1970];
    if ((now - self.lastClick < 0.3) && [indexPath isEqual:self.lastIndexPath]) {
        // Double tap here
        [self removeItem:indexPath];
    }
    self.lastClick = now;
    self.lastIndexPath = indexPath;
}

#pragma mark - Helper Methods

- (void)removeItem:(NSIndexPath *)indexPath {
    Photo *photoObject = [[Photo alloc] init];
    if ([self.sortMode isEqualToString:@"Subject"]) {
        photoObject = self.subjectsFinal[indexPath.section][indexPath.row];
        [self.imagesArray removeObject:photoObject];
    } else if ([self.sortMode isEqualToString:@"Location"]) {
        photoObject = self.locationsFinal[indexPath.section][indexPath.row];
        [self.imagesArray removeObject:photoObject];
    }
    [self setUpSortArrays];
    [self.collectionView reloadData];
}

@end
