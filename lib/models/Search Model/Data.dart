/// id : 40
/// title : "Two georgian silver medallists were told to leave the olympic games for taking a sightseeing trip in tokyo .is the world's largest city"
/// summary : "Trae Young had 45 points and eight assists in his first game at Madison Square Garden since last season's playoffs, leading a late surge that gave the Atlanta Hawks a 117-111 victory over the New York Knicks on Tuesday night."
/// description : "<span style=\"color: rgb(16, 38, 74); font-family: Poppins; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Trae Young had 45 points and eight assists in his first game at Madison Square Garden since last season's playoffs, leading a late surge that gave the Atlanta Hawks a 117-111 victory over the New York Knicks on Tuesday night.<br><br>Picking up right where he left off last spring, Young made seven 3-pointers, including one that tied the game at 105 with 2:54 to play. He then set up Bogdan Bogdanovic for a go-ahead 3 and followed another by De'Andre Hunter by leaving Taj Gibson behind off the dribble and knocking down a jumper to cap an 11-0 spurt and make it 113-105 with 1:04 left.<br><br>Bogdanovic added a season-high 32 points for the Hawks, who dropped the Knicks six games behind them for 10th place in the Eastern Conference, the final spot in the play-in field.<br><br>RJ Barrett had 28 points and 13 rebounds for the Knicks, who fell to 30-42 to clinch their eighth losing season in the last nine. The only winning record was when they went 41-31 last season to earn the No. 4 seed in the East.<br><br>The Hawks then beat them in five games in the first round of the playoffs. Young was the star in his first postseason series, ignoring the profane taunts from fans and getting the last word when he bowed to the crowd from near midcourt late in Game 5.<br><br>Young missed the return trip when he was sidelined for the Christmas game because of the NBA’s health and safety protocols. Fans booed him every time he touched the ball early Tuesday, though that didn’t last.<br><br>Alec Burks had 21 points for the Knicks, who played without Julius Randle because of a sore right quadriceps tendon. They led by 10 early in the fourth, but the game changed when Young re-entered with 7:45 remaining.<br><br>The Knicks led 34-30 after one, a lead that would have been six if not for Bogdanovic taking the ball out after Barrett's basket with 0.6 seconds left and flinging it the length of the court to Young, who caught and tossed it in all in one motion.<br><br>New York extended it to 12 in the second before the Hawks surged ahead by nine and took a 64-58 lead into halftime. Bogdanovic had 15 points and Young 13 in the second quarter, combining for four more points than the Knicks scored.</span>"
/// image : ["http://maannews.maantechnology.com/public/uploads/images/newsimages/maannewsimage30012022_034427_basket_ball.jpg"]
/// date : "2021-10-23"
/// news_subcategory : "Cricket"
/// subcategory_id : 1
/// news_category : "Sports"
/// category_id : 2
/// news_categoryslug : "sports-news"
/// reporter_name : "Reporter 21"

class Data {
  Data({
      int? id, 
      String? title, 
      String? summary, 
      String? description, 
      List<String>? image, 
      String? date, 
      String? newsSubcategory, 
      int? subcategoryId, 
      String? newsCategory, 
      int? categoryId, 
      String? newsCategoryslug, 
      String? reporterName,}){
    _id = id;
    _title = title;
    _summary = summary;
    _description = description;
    _image = image;
    _date = date;
    _newsSubcategory = newsSubcategory;
    _subcategoryId = subcategoryId;
    _newsCategory = newsCategory;
    _categoryId = categoryId;
    _newsCategoryslug = newsCategoryslug;
    _reporterName = reporterName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _summary = json['summary'];
    _description = json['description'];
    _image = json['image'] != null ? json['image'].cast<String>() : [];
    _date = json['date'];
    _newsSubcategory = json['news_subcategory'];
    _subcategoryId = json['subcategory_id'];
    _newsCategory = json['news_category'];
    _categoryId = json['category_id'];
    _newsCategoryslug = json['news_categoryslug'];
    _reporterName = json['reporter_name'];
  }
  int? _id;
  String? _title;
  String? _summary;
  String? _description;
  List<String>? _image;
  String? _date;
  String? _newsSubcategory;
  int? _subcategoryId;
  String? _newsCategory;
  int? _categoryId;
  String? _newsCategoryslug;
  String? _reporterName;

  int? get id => _id;
  String? get title => _title;
  String? get summary => _summary;
  String? get description => _description;
  List<String>? get image => _image;
  String? get date => _date;
  String? get newsSubcategory => _newsSubcategory;
  int? get subcategoryId => _subcategoryId;
  String? get newsCategory => _newsCategory;
  int? get categoryId => _categoryId;
  String? get newsCategoryslug => _newsCategoryslug;
  String? get reporterName => _reporterName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['summary'] = _summary;
    map['description'] = _description;
    map['image'] = _image;
    map['date'] = _date;
    map['news_subcategory'] = _newsSubcategory;
    map['subcategory_id'] = _subcategoryId;
    map['news_category'] = _newsCategory;
    map['category_id'] = _categoryId;
    map['news_categoryslug'] = _newsCategoryslug;
    map['reporter_name'] = _reporterName;
    return map;
  }

}