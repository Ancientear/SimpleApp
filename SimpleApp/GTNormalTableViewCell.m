//
//  GTNormalTableViewCell.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/12.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell()


@property(nonatomic,strong,readwrite) UILabel *titleLabel;
@property(nonatomic,strong,readwrite) UILabel *sourceLabel;
@property(nonatomic,strong,readwrite) UILabel *commentLabel;
@property(nonatomic,strong,readwrite) UILabel *timeLabel;

@property(nonatomic,strong,readwrite) UIImageView *rightimageView;
@property(nonatomic,strong,readwrite) UIButton *deleteButton;
@end

@implementation GTNormalTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 300, 30)];
//            self.titleLabel.backgroundColor = [UIColor blueColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 50, 20)];
//            self.sourceLabel.backgroundColor = [UIColor purpleColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 80, 50, 20)];
//            self.commentLabel.backgroundColor = [UIColor yellowColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 80,50, 20)];
//            self.timeLabel.backgroundColor = [UIColor grayColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];

            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightimageView = [[UIImageView alloc]initWithFrame:CGRectMake(280, 15,70, 70)];
            self.rightimageView.image = [UIImage imageNamed:@"icons8-greek-god-zeus-50.png"];
            //图片显示比例等,偏左偏右，充满
            //self.rightimageView.contentMode = UIViewContentModeScaleAspectFit;
            
            self.rightimageView;
        })];
        
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(260, 80,30, 20)];
            self.deleteButton.backgroundColor= [UIColor blueColor];
            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
            
            //添加操作方法
            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];

            self.deleteButton;
        })];
    }
    return self;
}

//给Label赋值上相应的文字
- (void)layoutTableViewCell{
    self.titleLabel.text = @"demo开发";
    
    self.sourceLabel.text = @"AT工作室";
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"2000评论";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15,self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width,self.commentLabel.frame.size.height);
    
    self.timeLabel.text = @"三分钟前";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15,self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width,self.timeLabel.frame.size.height);


}

-(void)deleteButtonClick{
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]){
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}
@end
