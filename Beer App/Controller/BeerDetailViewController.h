#import <UIKit/UIKit.h>
#import "BeerInfo.h"

@protocol EditBeerDelegate <NSObject>
@required
@optional
- (void)editBeerDidFinish:(BeerInfo *)beer;
- (void)addBeerDidiFinish:(BeerInfo *)beer;

@end

@interface BeerDetailViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) BeerInfo *detailBeer;

@property (nonatomic, weak) id<EditBeerDelegate> delegate;

@end
