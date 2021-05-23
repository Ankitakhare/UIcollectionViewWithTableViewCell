//
//  ProfileDataAPI.swift
//  UICollectionWithTableView
//
//  Created by ankita on 5/21/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import UIKit

class ProfileDataAPI {
    
    static var sharedInstance = ProfileDataAPI()   //singleton object
    
    let categorySubList:[String: [String]] = [ "Greatestcricketbatsmen" : [],
                                               "GreatestFemaleTennisPlayers" : [],
                                               "GreatestMaleTennisPlayers": [],
                                               "Top5celebritiesinIndia": [],
                                               "MostPowerfulPoliticiansinIndia2019": [],
                                               "MostPowerfulWomen": [],
                                               "India'stop10richestpeople": ["Mukesh Ambani","Azim Premji", "Lakshmi Mittal","Godrej Family","Shiv Nadar"]
                                            ]

    lazy var profiles = [
        Profile(profileName: "Narendra Modi", biographyText: "Narendra Damodardas Modi is an Indian politician serving as the 14th and current Prime Minister of India since 2014. He was the Chief Minister of Gujarat from 2001 to 2014 and is the Member of Parliament for Varanasi.", twitterHandler: "narendramodi"),
        Profile(profileName: "Sachin Tendulkar", biographyText: """
Sachin Tendulkar is known as the "God of Cricket." He made his debut at age 16 against Pakistan and never looked back, amassing the most runs in both ODIs and Tests.
        He has scored 100 international centuries, 29 more than second-best Ricky Ponting, and scored the most runs in World Cups, 2,278, at an incredible average of 56.95.
        He played many memorable knocks and won many games single-handedly. He also experienced losing a number of games because of a lack of support from the other end.
        Tendulkar carried the hopes of millions every time he walked up to bat and didn’t disappoint. He was the reason people made cricket a profession, and many started watching cricket just to see him bat. It was no surprise that cricket viewership dipped after his retirement.

""", twitterHandler: "sachin_rt"),
        Profile(profileName: "Amitabh Bachchan", biographyText: """
        One of the oldest celebrities on the list, yet Big B is the most well-versed in social media. 2017 was a busy year for him. He was roped in as the brand ambassador for Government’s goods and services tax (GST) initiative and his 40-minute video went a long way in calming down the common man’s doubts and questions. He is an active member of the community who does not hesitate to use the social media platforms to bring awareness and even interact with other celebrities and fans. His overall popularity is high – he is one of the most active of the celebs on the list, and ranked #2 for overall Twitter followers at over 33 million. He’s also the only celeb on the list that is more popular among hindi language profiles than with english.
        """, twitterHandler: "SrBachchan"),
        Profile(profileName: "Roger Federer", biographyText: """
               It’s hard not to select Roger Federer as the greatest of all time. His record 20 Grand Slam titles speak for themselves, and even at the age of 38, he is still winning and competing at the highest levels. His 310 weeks ranked as number one in the world is an open-era record. From 2004 to 2008, Federer went 237 consecutive weeks being ranked number one in the world, a record that may never be surpassed. Even though younger players are now finding a way to beat him, his consistently high level of play over his twenty-year career is a testament to his conditioning and ability.
               Winning the 2018 Australian Open after his outstanding 2017 season that saw him win Wimbledon and the Australian Open prove without a doubt that Roger Federer is indeed the greatest of all-time. Barring injury, Roger will continue to be a force to be reckoned with for who knows how long? His dramatic 5-set loss to Novak Djokovic at the 2019 Wimbledon Championship proves that even at almost 38 years of age that he can still compete with anyone. Roger certainly had his chances to secure Grand Slam number 21, a loss that will haunt him with limited opportunities remaining, but he is setting a new level for excellence at an age when most players have long since retired.
               """, twitterHandler: "rogerfederer"),
        Profile(profileName: "Barack Obama", biographyText: """
        Barack Hussein Obama II is an American politician and attorney who served as the 44th president of the United States from 2009 to 2017. A member of the Democratic Party, Barack Obama was the first African-American president of the United States
        """, twitterHandler: "BarackObama"),
        Profile(profileName: "Michael Schumacher", biographyText: """
        Michael Schumacher is a retired German racing driver who raced in Formula One for Jordan Grand Prix, Benetton and Ferrari, where he spent most of his career, as well as for Mercedes upon his return to the sport.
        """, twitterHandler: "schumacher"),
        Profile(profileName: "Ronaldinho", biographyText: """
               Ronaldo de Assis Moreira, commonly known as Ronaldinho Gaúcho or simply Ronaldinho, is a Brazilian former professional footballer and ambassador for Barcelona. He played mostly as an attacking midfielder, but was also deployed as a forward or a winger.
               """, twitterHandler: "10Ronaldinho"),
        Profile(profileName: "LeBron James", biographyText: """
                         LeBron Raymone James Sr. is an American professional basketball player for the Los Angeles Lakers of the National Basketball Association
                         """, twitterHandler: "KingJames"),
        Profile(profileName: "Salman Khan", biographyText: """
         Salman Khan is a force to be reckoned with in terms of earnings as well as the popularity among the fans. 2017 was a good year for the big bad boy of Bollywood, as he is popularly known in the media. First, he got acquitted from the long-running Blackbuck poaching case that has haunted him since 1998.
        The next was the release of his film Tiger Zinda Hai which had a record opening at the box office and earned $17.52 million in its opening weekend. That’s not all.
        The star has been very active on social media in 2017 and the retweets for his posts were the highest among the Top 100 celebrities. He’s the 3rd highest ranked star from this list in terms of Twitter followers (with over 31.1 million) and is most popular among the 25-34 years age group.
        """, twitterHandler: "BeingSalmanKhan"),
        Profile(profileName: "Virat Kohli", biographyText: """
         2017 was a record-breaking year for this cricket star. From raking up centuries to scoring double hundreds, Virat Kohli dominated the pitch this year with a stupendous performance across all formats of the game. Under his leadership, the Indian cricket team won the second highest number of matches in a calendar year. He scored 2,818 runs this year improving his own tally of runs.
        His wedding to Bollywood actress Anushka Sharma at the end of the year, supported by exclusive wedding pictures, multi-city reception and honeymoon tweets helped further increase his social media popularity. Kohli is tied for one of the fastest growing Twitter profiles (with a 12.5 percent growth rate) and over 22.9 million followers.
        """, twitterHandler: "imvkohli"),
        Profile(profileName: "Shah Rukh Khan", biographyText: """
         The popularity of King Khan didn’t dip despite giving two flops this year -- Raees and Jab Harry met Sejal. They were not runaway hits but created enough stir among his fans both in India and abroad, to send his the social engagement rate soaring. With Raees ranking as the most talked-about movie on Twitter, King Khan succeeded in topping the charts with the most Twitter followers of all the celebs on the list. He currently has over 33.3 million, and with a 9.9 percent growth rate in followers, we don’t think this will slow down any time soon.
        """, twitterHandler: "iamsrk"),
        Profile(profileName: "Akshay Kumar", biographyText: """
              2017 must have been a very satisfying year for the Khiladi star Akshay Kumar. His movie, Toilet- Ek Prem Katha, was well-received at the box office and the audience appreciation was also immense for starring in a movie that promotes the Swachh Bharat campaign unveiled by the Government. Appreciation for the movie also came in from many unexpected quarters. Bill Gates, impressed by the theme of the film, tweeted his appreciation for highlighting the sanitation problem in the country.
              Akshay Kumar tops the chart for the highest share of profile at 21.9 percent over the past week compared to the other celebs. He’s also received the second most new followers on Twitter and is currently at 24.8 million followers.
              """, twitterHandler: "akshaykumar"),
        
        
        Profile(profileName: "Mukesh Ambani", biographyText: """
                     Ambani is an Indian business magnate, who currently owns a 44.7% stake in Reliance Industries Limited.
                     He’s the majority shareholder for the company, and RIL is actually the most valuable company in India;
                     hence why you’d probably expect Ambani to appear on this list.
                     """, twitterHandler: "Mukesh_Ambani"),
        Profile(profileName: "Azim Premji", biographyText: """
                            Azim Premji is the 2nd richest person in India, with a net worth of $18.5 billion,
                            which is almost half the net worth of the richest man in India, coming up next.
                            Premji is an Indian business tycoon, investor, and philanthropist, and chairman of Wipro Limited,
                            one of the global leaders in the software industry. He helped the company get to the position they hold in the industry today.
                            """, twitterHandler: "premji_azim"),
           
        Profile(profileName: "Lakshmi Mittal", biographyText: """
                            Lakshmi Mittal is an Indian steel magnate, currently chairman and CEO of ArcelorMittal,
                            which is the world’s largest steelmaking company. Mittal owns 38% of the company and
                            he also holds an 11% stake in Queens Park Rangers F.C..
                            """, twitterHandler: "LakMittal"),
        Profile(profileName: "Godrej Family", biographyText: """
                            The Godrej family is an Indian family that manages and largely owns the Godrej Group,
                            a conglomerate founded by Ardeshir Godrej and his brother Pirojsha Burjorji Godrej in 1897.
                            The conglomerate does business in a lot of major industries, including agriculture, real estate,
                            engineering, security, consumer products, furniture and many more.
                            """, twitterHandler: "GodrejAppliance"),
        Profile(profileName: "Shiv Nadar", biographyText: """
                            Shiv Nadar is an Indian industrialist and philanthropist, and founder of HCL and the Shiv Nadar Foundation.
                            Nadar founded HCL in the mid-1970’s and transformed the IT hardware company into an IT enterprise over the
                            next three decades by constantly reinventing his company’s focus..
                            """, twitterHandler: "ShivNadarFDN")
    ]
    
    func getProfilePreFix(name: String) -> String? {
        switch name {
        case "Sachin Tendulkar":
            
            return "ST"
        case "Narendra Modi":
            
            return "NM"
        case "Mukesh Ambani":
        
        return "ABN"
        case "Azim Premji":
        
        return "PR"
        case "Lakshmi Mittal":
        
        return "MT"
        case "Godrej Family":
               
               return "GD"
        case "Shiv Nadar":
        
        return "ND"

        default:
            return nil
        }
    }
    
    // MARK: - Instance methods
    
    func getProfile(for name: String) -> Profile? {
        
        return self.profiles.filter { (profile) -> Bool in
            
            return profile.name == name ? true : false
        }.first
    }
    
    func getProfileImages(name: String) -> [UIImage]? {
        if let preFix = self.getProfilePreFix(name: name) {
            var images = [UIImage]()
            for i in 1...6 {
                if let image = UIImage(named: "\(preFix)\(i)") {
                    images.append(image)
                }
            }
            
            return images
        }
        
        return nil
    }
    
    func getProfileList(for category: String) -> [String] {
        
        return self.categorySubList[category] ?? []
    }
    
    
    // MARK: - Class Methods
    
    class func getProfileList() -> [String] {
        
        return [ "Narendra Modi",
                 "Sachin Tendulkar",
                 "Amitabh Bachchan",
                 "Roger Federer",
                 "Barack Obama",
                 "Michael Schumacher",
                 "Ronaldinho",
                 "LeBron James",
                 "Satya Nadella",
                 "Sundar Pichai"
        ]
    }
    
    
    class func getProfileCategory() -> [String] {
        
        return  ["Greatest cricket batsmen",
                 "Greatest Female Tennis Players",
                 "Greatest Male Tennis Players",
                 "India's top 10 richest people",
                 "Most Powerful Politicians in India 2019",
                 "Most Powerful Women",
                 "Top 5 celebrities in India"
        ]
    }
    
}
