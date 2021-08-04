//创建导航控制器UINavigationController
<#ViewController#> *<#name#> = [[<#ViewController#> alloc] init];
<#viewController#>.title = @"<#title#>";
UINavigationController *<#NavigationController#> = [[UINavigationController alloc] initWithRootViewController:<#rootViewController#>];




//创建分栏控制器UITabBarController
NSMutableArray *arrayNavigationControllers = [NSMutableArray arrayWithObjects:<#navigationController#>, nil];
UITabBarController *tabBarController = [[UITabBarController alloc] init];
tabBarController.viewControllers = arrayNavigationControllers;
tabBarController.tabBar.tintColor = [UIColor <#color#>];
tabBarController.tabBarItem.image = [UIImage imageNamed:@"<#name#>"];
tabBarController.selectedIndex = <#selectedIndex#>;
tabBarController.tabBar.translucent = <#BOOL#>;




self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
self.window.rootViewController = <#rootViewController#>;
[self.window makeKeyAndVisible];



@property(nonatomic, strong) UILabel *<#labelName#>;

UILabel *<#name#> = [[UILabel alloc] init];
<#name#>.frame = <#frame#>;
<#name#>.text = <#text#>;
<#name#>.backgroundColor = [UIColor <#backgroundColor#>];
<#name#>.font = [UIFont systemFontOfSize:<#textSize#>];
<#name#>.textColor = [UIColor <#textColor#>];
//<#name#>.shadowColor = [UIColor <#shadowColor#>];
//<#name#>.shadowOffset = <#CGSizeMake#>;
<#name#>.textAlignment = <#NSTextAlignment#>;
<#name#>.numberOfLines = <#linesNumber#>;




@property(nonatomic, strong)UIButton *<#buttonName#>;

UIButton *<#name#> = [[UIButton alloc] init];
<#name#>.frame = <#CGRectMake#>;
<#name#>.backgroundColor = <#backgroundColor#>;
[<#name#> setTitle:<#normalTitle#> forState:UIControlStateNormal];
[<#name#> setImage:<#normalImage#> forState:UIControlStateNormal];
[<#name#> setTitleColor:<#normalColor#> forState:UIControlStateNormal];
<#name#>.titleLabel.textAlignment = <#NSTextAlignment#>;
<#name#>.titleLabel.font = <#titleSize#>;
<#name#>.imageEdgeInsets = <#UIEdgeInsetsMake#>;
<#name#>.titleEdgeInsets = <#UIEdgeInsetsMake#>;
//<#name#>.layer.masksToBounds = YES;
<#name#>.layer.cornerRadius = <#cornerRadius#>;
[<#view#> addSubview:<#buttonName#>];

@property(nonatomic, strong)UIBarButtonItem *<#barButtonItemName#>;
@property(nonatomic, strong)UIScrollView *<#scrollViewName#>;
@property(nonnull, strong)UIView *<#viewName#>;

[[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"<#imageName#>"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:<#UIBarButtonItemStyle#> target:self action:@selector(<#action#>)];

self.navigationController.navigationBar.barTintColor = <#barTintColor#>;
[self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:<#textSize#>], NSFontAttributeName, nil]];
self.navigationController.navigationBar.tintColor = <#tintColor#>;
self.navigationController.navigationBar.translucent = NO;
self.navigationItem.title = <#title#>;


