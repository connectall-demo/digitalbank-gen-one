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

set right_now="Wed Oct 12 06:45:41 UTC 2023"
set right_now="Wed Oct 11 %this_hour%:%this_min%:%this_sec% UTC %this_year%"
set right_now=%this_year%-%this_month%-%this_day% %this_hour%:%this_min%:%this_sec%

set right_now="%this_year%-%this_month%-%this_day% %this_hour%:%this_min%:%this_sec%"
echo right_now=%right_now%

set VSMComponent="811335538253"

set json={\"appLinkName\":\"%AutomationName%\",
set json=%json%\"fields\":
set json=%json%{\"id\":\"%BUILD_TAG%\",
set json=%json%\"title\":\"%VSMComponent%\",
set json=%json%\"status\":\"%BUILD_RESULT%\",
set json=%json%\"created_by\":\"%USER%\",
set json=%json%\"assigned_to\":\"%USER%\",
set json=%json%\"created_time\":\"%right_now%\",
set json=%json%\"modified_time\":\"%right_now%\",
set json=%json%\"BUILD_DURATION\":\"%BUILD_DURATION%\",
set json=%json%\"BUILD_ID\":\"%BUILD_ID%\",
set json=%json%\"BUILD_DISPLAY_NAME\":\"%BUILD_DISPLAY_NAME%\",
set json=%json%\"JOB_NAME\":\"%JOB_NAME%\",
set json=%json%\"JOB_BASE_NAME\":\"%JOB_BASE_NAME%\",
set json=%json%\"BUILD_TAG\":\"%BUILD_TAG%\",
set json=%json%\"EXECUTOR_NUMBER\":\"%EXECUTOR_NUMBER%\",
set json=%json%\"NODE_NAME\":\"%NODE_NAME%\",
set json=%json%\"NODE_LABELS\":\"%NODE_LABELS%\",
set json=%json%\"JENKINS_URL\":\"%JENKINS_URL%\",
set json=%json%\"BUILD_URL\":\"%BUILD_URL%\",
set json=%json%\"JOB_URL\":\"%JOB_URL%\",
set json=%json%\"GIT_COMMIT\":\"%GIT_COMMIT%\",
set json=%json%\"GIT_PREVIOUS_COMMIT\":\"%GIT_PREVIOUS_COMMIT%\",
set json=%json%\"GIT_PREVIOUS_SUCCESSFUL_COMMIT\":\"%GIT_PREVIOUS_SUCCESSFUL_COMMIT%\",
set json=%json%\"GIT_BRANCH\":\"%GIT_BRANCH%\",
set json=%json%\"GIT_LOCAL_BRANCH\":\"%GIT_LOCAL_BRANCH%\",
set json=%json%\"GIT_URL\":\"%GIT_URL%\",
set json=%json%\"GIT_COMMITTER_NAME\":\"%GIT_COMMITTER_NAME%\",
set json=%json%\"GIT_AUTHOR_NAME\":\"%GIT_AUTHOR_NAME%\",
set json=%json%\"GIT_COMMITTER_EMAIL\":\"%GIT_COMMITTER_EMAIL%\",
set json=%json%\"GIT_AUTHOR_EMAIL\":\"%GIT_AUTHOR_EMAIL%\"
set json=%json%}}

echo Send JSON: %json%

echo via %ConnectAllUrl%/api/2/postRecord?apikey=%ConnectAllApikey%

curl --header "Content-Type: application/json;charset=UTF-8" -X POST -d %json% %ConnectAllUrl%/connectall/api/2/postRecord?apikey=%ConnectAllApiKey%
