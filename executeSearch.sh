DOMAIN="https://api.github.com"
source ~/Downloads/IdeasInnovationPortal/.privateAuthKey.sh

# Assigning Arguments
methodName=$1
searchWithMost=$2
dateRange=$3
username=$4
repo_name=$5
is_private=$6

# Determining date To Call Based On Command Line Arguments
if [ $dateRange == "today"  ]
  then duration=`date '+%Y-%m-%d'`
elif [ $dateRange == "weekly" ]
  then duration=`date -d '7 days ago' '+%Y-%m-%d'`
elif [ $dateRange == "montly" ]
  then duration=`date -d '1 month ago' '+%Y-%m-%d'`
elif [ $dateRange == "yearly" ]
  then duration=`date -d '1 year ago' '+%Y-%m-%d'`
else
  echo invalid date input parameter
fi

function findIdeaWithMost {
   response=$(curl -G ${DOMAIN}/$username/$repo_name       \
    --data-urlencode "q=created:>$duration" \
    --data-urlencode "sort=$searchWithMost"                          \
    --data-urlencode "order=desc"                          \
    -H "Accept: application/vnd.github.preview"            \
    | jq ".items[0,1,2] | {name, description, language,$searchWithMost"_count" , html_url}")
  echo "$response"
}
function createNewRepo {
  body="{\"name\":\"${repo_name}\",\"description\":\"$username\",\"private\":${is_private},\"has_issues\":true,\"has_wiki\":true,\"has_downloads\":false}"
  response=$(curl --silent -X POST -u ${TOKEN}:x-oauth-basic ${DOMAIN}/user/repos -d ${body})
  echo "$response"
}

function findIssuesInIdea {
  response=$(curl --silent ${DOMAIN}/search/issues?q=+label:${repo_name}+assignee:${username}+state:open&sort=created&order=asc)
  echo "$response"
}

# Determining Which Method To Call Based On Command Line Arguments

if [ $methodName == "find"  ]
  then findIdeaWithMost
elif [ $methodName == "newRepo" ]
  then createNewRepo
elif [ $methodName == "issues" ]
  then findIssuesInIdea
else
  echo invalid method name
fi
