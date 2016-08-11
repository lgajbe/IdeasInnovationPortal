## Interacting with GitHub API

I frequently interact with GitHub while learning new technologies and trends in the market and following public repositories while working on my assignments and projects. I find it is time consuming to do a relevant search. There are many open source libraries available on GitHub but it takes time to search most recent libraries and track if there are any issues in existing application. In order to architect and develop a solution as part of my projects, I have to keep myself updated with latest technologies in market and its adoption in the market, known issues in current version and its mitigation. A bash utility to search project based on most forked, most starred, most commented and fetched issues from technology will help me and others by saving lot of time.

## Developing Ideas Innovation Portal by GitHub
GitHub can serve as an excellent portal for innovative ideas within the organization, where employees can post their ideas or working prototype by creating GitHub repository. Ideas presented on GitHub can be evaluated and awarded based on most stars, most forks and most comments criteria. With the bash script utility, managers can easily refine their search to top three in each category and can do further analysis based on loopholes or issues in particular idea to decide final winners. This portal can also serve as a decision support system while investing in R&D. Employees can create new repository inside organization domain to present their ideas. This innovation portal also motivates employees as they are being recognized at organization level for their contribution and innovative ideas sharing.


#### Tabular summary of features:

Given below are the different ways to interact with [GitHub API](https://developer.github.com/v3/) through the script and mandatory parameters needed to by request to search data on GitHub.com:

| Request Type| Param1| Param2| Param3| Param4| Param5|Param6|Description
|---|---|---|---|---|---|---|---|
| IdeasWithMost | “find” | forks or stars or comments| today or monthly or weekly or yearly| search or domain name of organization| repositories or name of repository | NA | This request find the top three results with most forks/stars/comments in duration which can be today/weekly/monthly/yearly from public repository or organization repository based on value of input param4 and param5|
| CreateNewRepository |” newRepo” |NA|NA| Description or domain name of organization | name of repository | Is_private(bool) | This method allow user to creating new repository.|
| IssuesAssigned | “issues” |NA|NA|username|name of repository|NA | This method allow user to find issues assigned to user

`Note: ` All these bash commands start with the `sh executeSearch.sh`

#### Authentication Requirement
I am using two factor authentications and need authentication token to create new repository. You can follow tutorial: https://github.com/blog/1509-personal-api-tokens to generate your access token. The privateAuthKey.sh file is marked as ‘.gitignore’ to avoid it being update at every commit. Once you have access token, you can open .privateAuthKey.sh file and enter token as shown below:
TOKEN="Enter your token"
Note: If you do not have two factor authentications, then you can skip this step and will require entering your login credentials when prompted. Again, other search request do not require authentication.

####Example Command Line Request:
=>To search results with most forks yearly in domain-“https://api.github.com/search/repositories”, you can enter command: 

```
sh executeSearch.sh find forks weekly search repositories NA 
```

All data is sent and received as JSON. Below is the response screenshot 
![response](https://cloud.githubusercontent.com/assets/7903007/17598067/c7abcaf4-5fc6-11e6-8f7a-9bec537194d9.png)
Similarly, as described tabular summary, you can easily modify your search.

=>To find issues assigned to your idea: 
```
$ sh executeSearch.sh issues NA NA user_name repo_name NA
```

=>To create new repository to suggest idea:
```
$ sh executeSearch.sh newRepo NA NA org_domain repo_name true
```
#### Future Improvements
Currenly, Idea Innovation portal supports three major operation that facilitates managers and employees to creating new idea, searching best ideas based and find issues in idea. This can be further enhanced by:
1.	Advanced search criteria based on text match can be implemented.
2.	Notification feature can be added in case when new repository in created to indicate new idea posted or when new issue is assigned on suggested idea.

#### References
1.	https://developer.github.com/v3/
2.	https://github.com/mattcantstop/gitline


