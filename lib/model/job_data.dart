
class JobData {
  String? apiVersion;
  String? documentationUrl;
  String? friendlyNotice;
  int? jobCount;
  String? xRayHash;
  String? clientKey;
  String? lastUpdate;
  List<Jobs>? jobs;

  JobData({
    this.apiVersion,
    this.documentationUrl,
    this.friendlyNotice,
    this.jobCount,
    this.xRayHash,
    this.clientKey,
    this.lastUpdate,
    this.jobs
  });

  JobData.fromJson(Map<String, dynamic> json) {
    apiVersion = json['apiVersion'];
    documentationUrl = json['documentationUrl'];
    friendlyNotice = json['friendlyNotice'];
    jobCount = json['jobCount'];
    xRayHash = json['xRayHash'];
    clientKey = json['clientKey'];
    lastUpdate = json['lastUpdate'];
    if (json['jobs'] != null) {
      jobs = <Jobs>[];
      json['jobs'].forEach((v) {
        jobs!.add(Jobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiVersion'] = apiVersion;
    data['documentationUrl'] = documentationUrl;
    data['friendlyNotice'] = friendlyNotice;
    data['jobCount'] = jobCount;
    data['xRayHash'] = xRayHash;
    data['clientKey'] = clientKey;
    data['lastUpdate'] = lastUpdate;
    if (jobs != null) {
      data['jobs'] = jobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jobs {
  int? id;
  String? url;
  String? jobSlug;
  String? jobTitle;
  String? companyName;
  String? companyLogo;
  List<String>? jobIndustry;
  List<String>? jobType;
  String? jobGeo;
  String? jobLevel;
  String? jobExcerpt;
  String? jobDescription;
  String? pubDate;
  String? annualSalaryMin;
  String? annualSalaryMax;
  String? salaryCurrency;

  Jobs({
    this.id,
    this.url,
    this.jobSlug,
    this.jobTitle,
    this.companyName,
    this.companyLogo,
    this.jobIndustry,
    this.jobType,
    this.jobGeo,
    this.jobLevel,
    this.jobExcerpt,
    this.jobDescription,
    this.pubDate,
    this.annualSalaryMin,
    this.annualSalaryMax,
    this.salaryCurrency
  });

  Jobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    jobSlug = json['jobSlug'];
    jobTitle = json['jobTitle'];
    companyName = json['companyName'];
    companyLogo = json['companyLogo'];
    jobIndustry = json['jobIndustry'].cast<String>();
    jobType = json['jobType'].cast<String>();
    jobGeo = json['jobGeo'];
    jobLevel = json['jobLevel'];
    jobExcerpt = json['jobExcerpt'];
    jobDescription = json['jobDescription'];
    pubDate = json['pubDate'];
    annualSalaryMin = json['annualSalaryMin'];
    annualSalaryMax = json['annualSalaryMax'];
    salaryCurrency = json['salaryCurrency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['jobSlug'] = jobSlug;
    data['jobTitle'] = jobTitle;
    data['companyName'] = companyName;
    data['companyLogo'] = companyLogo;
    data['jobIndustry'] = jobIndustry;
    data['jobType'] = jobType;
    data['jobGeo'] = jobGeo;
    data['jobLevel'] = jobLevel;
    data['jobExcerpt'] = jobExcerpt;
    data['jobDescription'] = jobDescription;
    data['pubDate'] = pubDate;
    data['annualSalaryMin'] = annualSalaryMin;
    data['annualSalaryMax'] = annualSalaryMax;
    data['salaryCurrency'] = salaryCurrency;
    return data;
  }
}
