//
//  ViewController.m
//  Intro View
//
//  Created by murugan on 17/06/17.
//  Copyright © 2017 murugan. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController
NSMutableArray *detailsArray,*imgList;
- (void)viewDidLoad {
    [super viewDidLoad];
    [_introCollectionview setPagingEnabled:YES];
    detailsArray=[[NSMutableArray alloc]init];imgList=[[NSMutableArray alloc]init];
    detailsArray = [NSMutableArray arrayWithObjects:
                        @"The brand that's been trusted for over 15 years in over 173 countries. Start your own freelance jobs listing website.",
                        @"Agriya getlancer is the best freelancing marketplace script. Offers complete support. You're in safe hands. Period.",
                        @"Hire freelancers for a fraction of the time and cost! You'll really love number of options.",
                        @"Search for the jobs that suit you best. You have number of options to get started.",nil];
    imgList = [NSMutableArray arrayWithObjects:
                    @"DSC_0054.JPG",
                    @"DSC_0013.JPG",
                    @"DSC_0054.JPG",
                    @"DSC_0013.JPG",nil];
    _pageControl.numberOfPages = detailsArray.count;
    _pageControl.currentPage = 0;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{  //ScrollView Delegate Used for collectionview
    CGFloat pageWidth = _introCollectionview.frame.size.width;
    float currentPage = _introCollectionview.contentOffset.x / pageWidth;
    if (0.0f != fmodf(currentPage, 1.0f)){
        _pageControl.currentPage = currentPage + 1;
    }else{
        _pageControl.currentPage = currentPage;
    }
    [self changePageIcon:_pageControl.currentPage];
}
-(void)changePageIcon:(NSInteger)pageNo{
    if(pageNo == 0){
       
    }else if(pageNo == 1){
        
    }else if(pageNo == 2){
        
    }else if(pageNo == 3){
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK:- UICollectionViewDelegateFlowLayout:
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_introCollectionview.frame.size.width, _introCollectionview.frame.size.height);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return imgList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell=[_introCollectionview dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.imgIntro.image=[UIImage imageNamed:[imgList objectAtIndex:indexPath.row]];
    return cell;
}
@end
