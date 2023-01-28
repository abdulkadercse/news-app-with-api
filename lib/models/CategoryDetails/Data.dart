/// id : 49
/// title : "Reating a vision for the future: how technology will revolutionise the business finance function"
/// summary : "Reating a vision for the future: how technology will revolutionise the business finance function"
/// description : "<p>                                            <span style=\"font-family: &quot;Roboto&quot;;\">﻿</span><span style=\"color: rgb(46, 46, 56); font-family: Georgia, sans-serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"></span><span style=\"color: rgb(16, 38, 74); font-family: Poppins; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">The Department of Dance at Chapman University offers students a strong professional dance training program with high quality productions. Students may choose from a pre-professional Bachelor of Fine Arts degree in Dance Performance or from the more broad based Bachelor of Arts degree in Dance. Both degrees provide excellent preparation for those who plan to enter the professional dance world and/or attend graduate school. The curriculum for dance majors includes course work in choreography, dance history, dance production, dance performance, acting, music for dancers, dance science, dance teaching methods, ballroom, somatics, hip-hop, tap, and comprehensive pre-professional training in modern, jazz and ballet technique. The USC Glorya Kaufman School of Dance offers a Bachelor of Fine Arts to a select number of undergraduates who wish to pursue dance as their major. This four-year professional degree is housed in the state-of-the-art Glorya Kaufman International Dance Center. USC Kaufman also offers individual classes in technique, performance, choreography, production, theory and history that are open to all students at USC. In addition to the dance major and open courses, the minor in Dance and minor in Dance in Popular Culture: Hip-Hop, Urban and Social Dances, provide a rewarding program of study for any USC student. A conservatory-based program within a liberal arts environment, we are focused on rigorous training in both ballet and modern technique. We are committed to the creation and production of original contemporary choreographic works by students, faculty and guest artists. The Dance Program is housed in its own state-of-the-art Dance Centre on a large liberal arts campus. USF is accredited by the National Association of Schools of Dance (NASD). Students must apply for admission and be accepted to the University of South Florida before they can be accepted as a Dance Major in the School of Theatre and Dance. Additionally, all prospective Dance Majors and Dance Minors must audition during the year prior to their first semester to be accepted into the Dance Program.</span><span style=\"font-family: &quot;Arial Black&quot;;\"></span></p>"
/// image : ["http://maannews.maantechnology.com/public/uploads/images/newsimages/maannewsimage23102021_115552_Chinese-Fan-Dance.jpg"]
/// date : "2021-11-04"
/// news_subcategory : "Movies"
/// news_category : "Entertainment"
/// news_categoryslug : "entertainment-news"
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
      String? newsCategory, 
      String? newsCategoryslug, 
      String? reporterName,}){
    _id = id;
    _title = title;
    _summary = summary;
    _description = description;
    _image = image;
    _date = date;
    _newsSubcategory = newsSubcategory;
    _newsCategory = newsCategory;
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
    _newsCategory = json['news_category'];
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
  String? _newsCategory;
  String? _newsCategoryslug;
  String? _reporterName;

  int? get id => _id;
  String? get title => _title;
  String? get summary => _summary;
  String? get description => _description;
  List<String>? get image => _image;
  String? get date => _date;
  String? get newsSubcategory => _newsSubcategory;
  String? get newsCategory => _newsCategory;
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
    map['news_category'] = _newsCategory;
    map['news_categoryslug'] = _newsCategoryslug;
    map['reporter_name'] = _reporterName;
    return map;
  }

}