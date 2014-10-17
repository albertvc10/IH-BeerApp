//
//  BeerCell.m
//  Beer App
//
//  Created by Albert Villanueva Carreras on 15/10/14.
//  Copyright (c) 2014 Albert Villanueva Carreras. All rights reserved.
//

#import "BeerCell.h"

@interface BeerCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UIImageView *beerImage;

@end

@implementation BeerCell

- (void)setBeer:(BeerInfo *)beer {
    
    _beer = beer;
    
    self.titleLabel.text = beer.name;
    self.detailLabel.text = beer.countryOrigin;
    
    UIImage *image;
    NSData *data;
    NSURL *url;


    self.titleLabel.text = beer.name;
    self.detailLabel.text = beer.countryOrigin;
//    url = [NSURL URLWithString:beer.photoUrl];
//    data = [NSData dataWithContentsOfURL:url];
//    image = [[UIImage alloc] initWithData:data];
//    self.beerImage.image = image;

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
