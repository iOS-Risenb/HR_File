


printf "\nStep1: remote verifying ...\n"
firstPush=false
result_gitRemote=`git remote`
if [ -z "$result_gitRemote" ];
then
echo "❌❌❌ remote verify failure, remote is not empty"
read -p "please input remote(url):" var_remoteUrl
echo "remote add ..."
git remote add origin $var_remoteUrl
echo "✅✅✅ add remote success"
echo "remote name is 'origin'"
echo "remote url is '$var_remoteUrl'"
firstPush=true
else
echo "✅✅✅ remote verify success"
fi


printf "\nStep2: pod lib lint ...\n"
result_podLibLint=`pod lib lint --allow-warnings`
#var1=`pod lib lint --sources='https://gitee.com/jiqirenapp/JQRPods.git','https://gitee.com/hongruisibo_iOS/hrpods.git','https://github.com/CocoaPods/Specs.git' --allow-warnings
echo $result_podLibLint |grep -q "passed validation"
if [ $? -eq 0 ]
then
echo "✅✅✅ pod lib lint success"
else
echo "❌❌❌ pod lib lint failure"
exit
fi


printf "\nStep3: push code to git ...\n"
read -p "input commit log: " var_commitLog
git add .
git commit -m "${var_commitLog}"
if $firstPush
then
git push -u origin master
else
git push
fi
echo "✅✅✅ push code complete"


printf "\nStep4: push tag to git ...\n"
read -p "input commit tag: " var_commitTag
git tag $var_commitTag
git push --tags
echo "✅✅✅ push tag complete"


printf "\nStep5: pod spec lint ...\n"
result_podLibLint=`pod spec lint --allow-warnings`
#var1=`pod lib lint --sources='https://gitee.com/jiqirenapp/JQRPods.git','https://gitee.com/hongruisibo_iOS/hrpods.git','https://github.com/CocoaPods/Specs.git' --allow-warnings
echo $result_podSpecLint |grep -q "passed validation"
if [ $? -eq 0 ]
then
echo "✅✅✅ pod spec lint success"
else
echo "❌❌❌ pod spec lint failure"
exit
fi


printf "\nStep6: pod trunk push ...\n"
pod repo push JQRPods --allow-warnings
echo "✅✅✅  pod trunk push complete -> ${var_commitTag}"





