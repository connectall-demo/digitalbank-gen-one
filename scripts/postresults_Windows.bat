echo 'run setup_Windows prior to this'
call .\scripts\setup_Windows.bat

set storyId=""

set this_month=%date:~4,2%
if "%this_month:~0,1%" == " " set this_month=0%this_month:~1,1%
echo this_month=%this_month%

set this_day=%date:~7,2%
if "%this_day:~0,1%" == " " set this_day=0%this_day:~1,1%
echo this_day=%this_day%

set this_year=%date:~10,4%
if "%this_year:~0,1%" == " " set this_year=0%this_year:~1,1%
echo this_year=%this_year%

set this_hour=%time:~0,2%
if "%this_hour:~0,1%" == " " set this_hour=0%this_hour:~1,1%
echo this_hour=%this_hour%

set this_min=%time:~3,2%
if "%this_min:~0,1%" == " " set this_min=0%this_min:~1,1%
echo this_min=%this_min%

set this_sec=%time:~6,2%
if "%this_sec:~0,1%" == " " set this_sec=0%this_sec:~1,1%
echo this_sec=%this_sec%

set right_now=%this_year%-%this_month%-%this_day% %this_hour%:%this_min%:%this_sec%
echo right_now=%right_now%

set json1={"appLinkName":"%AutomationName%",
set json1=%json1%"fields":
set json1=%json1%{"id":"Jenkins-%BUILD_ID%",
set json1=%json1%"title":"811335538253",
set json1=%json1%"created_time":"2024",
set json1=%json1%"BUILD_ID":"%BUILD_ID%"
set json1=%json1%}}

set json={\"appLinkName\":\"%AutomationName%\",\"fields\":{\"id\":\"Jenkins-%BUILD_ID%\",\"title\":\"811335538253\",\"BUILD_ID\":\"%BUILD_ID%\"}}

echo Send JSON: %json%

echo via %ConnectAllUrl%/api/2/postRecord?apikey=%ConnectAllApikey%

curl --header "Content-Type: application/json;charset=UTF-8" -X POST -d %json% %ConnectAllUrl%/connectall/api/2/postRecord?apikey=%ConnectAllApiKey%
