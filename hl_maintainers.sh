#!/bin/bash
# GitHub;Email;Name;Username1,Username2,...,UsernameN;Project1,Project2,..,ProjectN
# GitHub: required
# Email, Name: can be empty
# Usernames: can be empty, single value or list , separated
# Projects: required at least one, can be a list , separated
OFS=$IFS
data=$(cat <<-EOM
Alexey-N-Chernyshov;chernyshov@soramitsu.co.jp;Alexey Chernyshov;;hyperledger/iroha
CjHare;;Chris Hare;;hyperledger/besu
EdJoJob;;Edward Evans;;hyperledger/besu
GuillaumeCisco;guillaumecisco@gmail.com;Guillaume Cisco;;hyperledger/fabric
Kelly-Cooper;kellycooper.2ds@gmail.com;Kelly Cooper;KellyCooper;hyperledger/besu,hyperledger/iroha
LordGoodman;jiahaochen1993@gmail.com;Luke Chen;luke_chen;hyperledger/cello
MHBauer;mbauer@us.ibm.com;Morgan Bauer;;hyperledger/fabric
MadelineMurray;;Madeline Murray;madelinemurray;hyperledger/besu
MattP007;;Matt Perron;mattp;hyperledger/grid
NicolasMassart;;Nicolas Massart;;hyperledger/besu
RatanRSur;;Rai Sur;ratanraisur;hyperledger/besu
RyanLassigBanks;;Ryan Banks;RyanBanks;hyperledger/grid,hyperledger/sawtooth
Solonets;ssolonets@gmail.com;Sergei Solonets;;hyperledger/iroha
TomBarnes;;Thomas J Barnes;TomBarnes;hyperledger/avalon
abdelhamidbakhta;;Abdel Bakhta;;hyperledger/besu
adamk1230;adamk1230@gmail.com;Adam Kwan;;hyperledger/explorer
adeebahmed;;Adeeb Ahmed;;hyperledger/grid
agunde406;;Andi Gunderson;agunde;hyperledger/sawtooth,hyperledger/grid,hyperledger/transact
ajsutton;;Adrian Sutton;;hyperledger/besu
aklenik;;Attila Klenik;klenik;hyperledger/caliper
alikic;aleksandar.likic@securekey.com;Aleksandar Likic;;hyperledger/fabric
aludvik;;Adam Ludvik;adamludvik;hyperledger/sawtooth
andrew-coleman;andrew_coleman@uk.ibm.com;Andrew Coleman;;hyperledger/fabric
arsulegai;;Arun S M;;hyperledger/sawtooth
atoulme;;Antoine Toulme;;hyperledger/besu
auntmelmel;;Melanie Nuce;MelanieNuce;hyperledger/grid
awjh-ibm;andrew.hurt1@ibm.com;Andrew Hurt;;hyperledger/fabric
bakhtin;a@bakhtin.net;Artyom Bakhtin;;hyperledger/iroha
bestbeforetoday;Mark.S.Lewis@outlook.com;Mark Lewis;;hyperledger/fabric
bgravenorst;;Byron Gravenorst;;hyperledger/besu
blt5037;Brett.T.Logan@ibm.com;Brett Logan;brett;hyperledger/fabric
boydjohnson;;Boyd Johnson;;hyperledger/sawtooth
bstasyszyn;bob.stasyszyn@securekey.com;Bob Stasyszyn;;hyperledger/fabric
c0rwin;bartem@il.ibm.com;Artem Barger;;hyperledger/fabric
chenette;;Anne Chenette;achenette;hyperledger/sawtooth,hyperledger/grid
christo4ferris;chris.ferris@gmail.com;Chris Ferris;cbf;hyperledger/fabric
cianx;;Cian Montgomery;;hyperledger/sawtooth
compleatang;casey@monax.io;Casey Kuhlman;;hyperledger/burrow
danintel;;Daniel Anderson;;hyperledger/avalon,hyperledger/sawtooth
davececchi;;Dave Cecchi;cecchi;hyperledger/grid,hyperledger/transact
dcmiddle;;Dan Middleton;Dan;hyperledger/avalon,hyperledger/sawtooth,hyperledger/grid,hyperledger/transact
delventhalz;;Zac Delventhal;zac;hyperledger/sawtooth
denali49;alaskadd@gmail.com;Chris Gabriel;cmgabriel;hyperledger/fabric
denyeart;enyeart@us.ibm.com;Dave Enyeart;dave.enyeart;hyperledger/fabric
desktophero;;Jason Walker;;hyperledger/grid
dexhunter;dixingxu@gmail.com;Dixing Xu;;hyperledger/fabric
dnewh;;Davey Newhall;newhall;hyperledger/transact
dongmingh;dongming@ibm.com;Dongming Hwang;dongming;hyperledger/fabric
dongwangdw;xdragon007@gmail.com;Dong Wang;wangdong;hyperledger/fabric
dplumb94;;Darian Plumb;dplumb;hyperledger/sawtooth,hyperledger/grid
;;;;hyperledger/
;;;;hyperledger/
;;;;hyperledger/
;;;;hyperledger/
;;;;hyperledger/

EOM
)
# hyperledger/aries
# hyperledger/avalon
# hyperledger/besu
# hyperledger/burrow
# hyperledger/cactus
# hyperledger/caliper
# hyperledger/cello
# hyperledger/explorer
# hyperledger/fabric
# hyperledger/grid
# hyperledger/hyperledger-all
# hyperledger/hyperledger-dlt
# hyperledger/indy
# hyperledger/iroha
# hyperledger/quilt
# hyperledger/sawtooth
# hyperledger/transact
# hyperledger/ursa
IFS=$'\n'
for row in $data
do
  IFS=';'
  arr=(${row})
  gh=${arr[0]}
  email=${arr[1]}
  name=${arr[2]}
  usernames=${arr[3]}
  slugs=${arr[4]}
  IFS=','
  slugs=(${slugs})
  root="select * from enrollments"
  q="where (uuid in (select uuid from identities where source = 'github' and username in ('${gh}'))"
  if [ ! -z "${email}" ]
  then
    q="${q} or uuid in (select uuid from identities where email in ('${email}'))"
  fi
  if [ ! -z "${name}" ]
  then
    q="${q} or uuid in (select uuid from identities where name in ('${name}') having count(distinct uuid) = 1)"
  fi
  if [ ! -z "${usernames}" ]
  then
    usernames=(${usernames})
    for username in "${usernames[@]}"
    do
      if [ -z "${name}" ]
      then
        q="${q} or uuid in (select uuid from identities where username in ('${username}') having count(distinct uuid) = 1)"
      else
        q="${q} or uuid in (select uuid from identities where username in ('${username}') and name in ('${name}'))"
      fi
    done
  fi
  q="${q}) and project_slug in ("
  for slug in "${slugs[@]}"
  do
    q="${q}'${slug}',"
  done
  q="${q::-1});"
  #echo "select '${gh}', '${email}', '${name}', '${slugs}';"
  echo "$root $q"
done
IFS=$OFS
# select * from enrollments where uuid in (select uuid from identities where source = 'github' and username in ('Alexey-N-Chernyshov')) or uuid in (select uuid from identities where email in ('chernyshov@soramitsu.co.jp')) and project_slug in ('hyperledger/iroha');
# curl -s -XPOST -H 'Content-type: application/json' '(...)/sds-hyperledger-*/_search?size=10000' -d'{"query":{"wildcard":{"origin":{"value":"*smart-contracts*"}}}}' | jq '.hits.hits[]._index' | sort | uniq
# curl -s -XPOST -H 'Content-type: application/json' (...)/_sql?format=csv -d"{\"query\":\"select origin, project from \\\"sds-hyperledger-*\\\" where origin like '%smart%' group by origin, project\"}"
exit 0
edwardmack,edwardmack"," besu "," Edward Mack "," edwardmack "," mackcom
edwardsm26,edwardsm26"," blockchain-explorer "," Mekia Edwards "," edwardsm26 "," edwardsm26 "," dev.edwardsm@gmail.com
eloaverona,eloaverona"," grid sawtooth-sdk-swift transact-contrib transact-sdk-go transact-sdk-javascript transact
feihujiang,feihujiang"," caliper "," FeihuJiang "," feihujiang "," FlyingTiger
fqutishat,fqutishat"," fabric-sdk-go "," Firas.Qutishat "," fqutishat "," firas.qutishat@securekey.com
genasmorgan,genasmorgan"," grid-rfcs "," Gena Morgan "," genasmorgan "," Gena
gennadylaventman,gennadylaventman"," fabric-chaincode-java "," Gennady Laventman "," gennadylaventman "," gennadyl "," gennady@il.ibm.com
grantnoble,grantnoble"," besu-docs "," Grant Noble "," grantnoble "," grantnoble
gregdhill,gregdhill"," burrow "," Greg Hill "," gregdhill "," <greg.hill@monax.io>
grimadas,grimadas"," iroha "," Bulat Nasrulin "," @grimadas "," bulat@soramitsu.co.jp "," Development
grkvlt,grkvlt"," sawtooth-seth "," Andrew Donald Kennedy "," grkvlt "," grkvlt
guoger,guoger"," fabric-amcl fabric-chaincode-evm fabric homebrew-fabric "," Jay Guo "," [guoger,guoger"," guoger "," <guojiannan1101@gmail.com>
haojun,haojun"," caliper "," HaojunZhou "," haojun "," haojun
harrisob,harrisob"," fabric-chaincode-node fabric-samples fabric-sdk-node "," Bret Harrison "," [harrisob,harrisob"," bretharrison "," <beharrison@nc.rr.com>
heatherlp,heatherlp"," fabric-sdk-node "," Heather Pollard "," heatherlp "," heatherp "," heatherpollard0@gmail.com
hightall,hightall"," cello-analytics cello "," Haitao Yue "," hightall "," hightall "," hightallyht@gmail.com
igor-egorov,igor-egorov"," iroha "," Igor Egorov "," @igor-egorov "," igor@soramitsu.co.jp "," Development, Android library
iikirilov,iikirilov"," besu "," Ivaylo Kirilov "," iikirilov "," iikirilov
ineffectualproperty,ineffectualproperty"," sawtooth-rfcs sawtooth-website "," Kelly Olson "," ineffectualproperty "," kelly_
jeevasang,jeevasang"," blockchain-explorer "," Jeeva Sankarapandian "," jeevasang "," jeevas "," jsankarapandian@dtcc.com
jframe,jframe"," besu "," Jason Frame "," jframe "," jframe
joealewine,joealewine"," fabric-amcl fabric-ca fabric homebrew-fabric "," Joe Alewine "," [joealewine,joealewine"," joe-alewine "," <joe.alewine@ibm.com>
joshuafernandes,joshuafernandes"," besu "," Joshua Fernandes "," joshuafernandes "," joshuafernandes
jsmitchell,jsmitchell"," education-sawtooth-simple-supply grid-contrib grid-rfcs grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-marketplace sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-rfcs sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtooth-sdk-go sawtooth-sdk-java sawtooth-sdk-javascript sawtooth-sdk-python sawtooth-sdk-rust sawtooth-sdk-swift sawtooth-supply-chain sawtooth-website transact-contrib transact-rfcs transact-sdk-go transact-sdk-javascript transact "," James Mitchell "," jsmitchell "," jsmitchell
jt-nti,jt-nti"," fabric-chaincode-java fabric-chaincode-node fabric-contract-api-go "," James Taylor "," [jt-nti,jt-nti"," jtonline "," <jamest@uk.ibm.com>
jyellick,jyellick"," fabric-amcl fabric-samples fabric homebrew-fabric "," Jason Yellick "," [jyellick,jyellick"," jyellick "," <jyellick@us.ibm.com>
kamilsa,kamilsa"," iroha "," Kamil Salakhiev "," @kamilsa "," kamil@soramitsu.co.jp "," Development
l4l,l4l"," iroha "," Evgenii Mininbaev "," @l4l "," evgenii@soramitsu.co.jp "," Security, Python library
laSinteZ,laSinteZ"," iroha "," Vyacheslav Bikbaev "," @laSinteZ "," viacheslav@soramitsu.co.jp "," Documentation, NodeJS library
lebdron,lebdron"," iroha "," Andrei Lebedev "," @lebdron "," andrei@soramitsu.co.jp "," Research
lehors,lehors"," fabric-cli fabric-samples "," Arnaud Le Hors "," [lehors](https://github.com/lehors) "," lehors "," <lehors@us.ibm.com>
ltseeley,ltseeley"," sawtooth-core sawtooth-devmode sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-sabre transact-contrib transact-sdk-go transact-sdk-javascript transact "," Logan Seeley "," ltseeley "," ltseeley
lucassaldanha,lucassaldanha"," besu "," Lucas Saldanha "," lucassaldanha "," lucassaldanha
luckychess,luckychess"," iroha "," Konstantin Munichev "," @luckychess "," konstantin@soramitsu.co.jp "," Security
macfarla,macfarla"," besu "," Sally MacFarlane "," macfarla "," macfarla
mark-terry,mark-terry"," besu "," Mark Terry "," mark-terry "," m.terry
mastersingh24,mastersingh24"," fabric-amcl fabric-ca fabric-chaincode-evm fabric-chaincode-java fabric-lib-go fabric-samples fabric-sdk-go fabric-sdk-node fabric-test fabric homebrew-fabric transact-rfcs "," Gari Singh "," [mastersingh24,mastersingh24"," mastersingh24 "," <gari.r.singh@gmail.com>
matkt,matkt"," besu "," Karim Taam "," matkt "," matkt
mbaxter,mbaxter"," besu "," Meredith Baxter "," mbaxter "," mbaxter
mbwhite,mbwhite"," fabric-chaincode-java fabric-chaincode-node fabric-samples "," Matthew B White "," [mbwhite,mbwhite"," mbwhite "," <whitemat@uk.ibm.com>
muralisrini,muralisrini"," fabric-amcl fabric-chaincode-evm fabric homebrew-fabric "," Srinivasan Muralidharan "," [muralisrini,muralisrini"," muralisr "," <srinivasan.muralidharan99@gmail.com>
muratovv,muratovv"," iroha "," Fyodor Muratov "," @muratovv "," fyodor@soramitsu.co.jp "," Architecture, Java library, QA
neewy,neewy"," iroha "," Nikolai Iushkevich "," @neewy "," n.yushkevich@hotmail.com "," Development
nekia,nekia"," blockchain-explorer "," Atsushi Neki "," nekia "," nekia "," atsushin@fast.au.fujitsu.com
nfrunza,nfrunza"," blockchain-explorer "," Nik Frunza "," nfrunza "," nfrunza "," nfrunza@gmail.com
nickaleks,nickaleks"," iroha "," Nikita Alekseev "," @nickaleks "," alekseev@soramitsu.co.jp "," Development
nikhil550,nikhil550"," fabric-amcl fabric-ca fabric-samples fabric homebrew-fabric "," Nikhil Gupta "," [nikhil550,nikhil550"," nikhilgupta "," nikhilg550@gmail.com
nklincoln,nklincoln"," caliper "," Nick Lincoln "," nklincoln "," nkl199
odowdaibm,odowdaibm"," fabric-amcl fabric-ca fabric homebrew-fabric "," Anthony O\'Dowd "," [odowdaibm,odowdaibm"," odowdaibm "," <a_o-dowd@uk.ibm.com>
pamandrejko,pamandrejko"," fabric-amcl fabric-ca fabric homebrew-fabric "," Pam Andrejko "," [pamandrejko,pamandrejko"," pandrejko "," <pama@ibm.com>
peterschwarz,peterschwarz"," education-sawtooth-simple-supply grid-contrib grid-rfcs grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-marketplace sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-rfcs sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtooth-sdk-go sawtooth-sdk-java sawtooth-sdk-javascript sawtooth-sdk-python sawtooth-sdk-rust sawtooth-sdk-swift sawtooth-seth sawtooth-supply-chain sawtooth-website transact-contrib transact-rfcs transact-sdk-go transact-sdk-javascript transact "," Peter Schwarz "," peterschwarz "," pschwarz
phymbert,phymbert"," burrow "," Pierrick Hymbert "," phymbert "," <pierrick.hymbert@gmail.com>
pinges,pinges"," besu "," Stefan Pingel "," pinges "," pinges
rain-on,rain-on"," besu "," Trent Mohay "," rain-on "," trent.mohay
rberg2,rberg2"," grid-contrib grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtooth-sdk-go sawtooth-sdk-java sawtooth-sdk-javascript sawtooth-sdk-python sawtooth-sdk-rust sawtooth-website transact-contrib transact-sdk-go transact-sdk-javascript transact "," Richard Berg "," rberg2 "," rberg2
rbuysse,rbuysse"," grid-contrib grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtooth-sdk-go sawtooth-sdk-java sawtooth-sdk-javascript sawtooth-sdk-python sawtooth-sdk-rust sawtooth-supply-chain sawtooth-website transact-contrib transact-sdk-go transact-sdk-javascript transact "," Ryan Beck-Buysse "," rbuysse "," rbuysse
rojotek,rojotek"," besu "," Rob Dawson "," rojotek "," RobDawson
ryanlassigbanks,ryanlassigbanks"," transact-contrib transact-sdk-go transact-sdk-javascript transact "," Ryan Banks "," ryanlassigbanks "," robinbanks
ryuo88,ryuo88"," iroha "," Ryu Okada "," @ryuo88 "," okada@soramitsu.co.jp "," Product vision
saad-karim,saad-karim"," fabric-ca "," Saad Karim "," saad-karim "," skarim "," <skarim@us.ibm.com>
scottz64,scottz64"," fabric-test "," Scott Zwierzynski "," scottz64 "," scottz "," scottz@us.ibm.com
seanyoung,seanyoung"," burrow "," Sean Young "," seanyoung "," <sean@mess.org>
sgregglives,sgregglives"," besu-docs "," Steven Gregg "," sgregglives "," sagregg
shannynalayna,shannynalayna"," grid sawtooth-sdk-swift transact-contrib transact-sdk-go transact-sdk-javascript transact
shemnon,shemnon"," besu "," Danno Ferrin "," shemnon "," shemnon
silasdavis,silasdavis"," burrow "," Silas Davis "," silasdavis "," <silas@monax.io>
smithbk,smithbk"," fabric-amcl fabric-sdk-node fabric homebrew-fabric "," Keith Smith "," smithbk "," smithbk "," bksmith@us.ibm.com
sofiter,sofiter"," smart-contracts-wg "," Sofia Terzi "," sofiter "," st "," sophia.terzi@gmail.com
sstone1,sstone1"," fabric-samples "," Simon Stone "," sstone1 "," sstone1 "," sstone1@uk.ibm.com
stinger112,stinger112"," iroha "," Arseniy Fokin "," @stinger112 "," stinger112@gmail.com "," NodeJS library
suryalnvs,suryalnvs"," fabric-test "," Surya Lanka "," suryalnvs "," slanka "," slanka@us.ibm.com
swetharepakula,swetharepakula"," fabric-chaincode-evm "," Swetha Repakula "," swetharepakula "," swetha "," srepaku@us.ibm.com
sykesm,sykesm"," fabric-amcl fabric-ca fabric-lib-go fabric homebrew-fabric "," Matthew Sykes "," [sykesm,sykesm"," sykesm "," <sykesmat@us.ibm.com>
takemiyamakoto,takemiyamakoto"," iroha "," Makoto Takemiya "," @takemiyamakoto "," takemiya@soramitsu.co.jp "," Product vision
timbeiko,timbeiko"," besu "," Tim Beiko "," timbeiko "," timbeiko
tmarkovski,tmarkovski"," sawtooth-sdk-dotnet "," Tomislav Markovski "," tmarkovski "," tomislav
tongli,tongli"," cello "," Tong Li "," tongli "," tongli "," litong01@us.ibm.com
troyronda,troyronda"," fabric-cli fabric-sdk-go "," Troy Ronda "," [troyronda](https://github.com/troyronda) "," troyronda "," <troy@troyronda.com>
tyvision,tyvision"," iroha "," Anatoly Tyukushin "," @tyvision "," tyukushin@soramitsu.co.jp "," Ansible, Jenkins
umadiraju,umadiraju"," blockchain-explorer "," Umapathi Madiraju "," umadiraju "," umadiraj "," umapathi.madiraju@gmail.com
usmansaleem,usmansaleem"," besu "," Usman Saleem "," usmansaleem "," usmansaleem
vaporos,vaporos"," education-sawtooth-simple-supply grid-contrib grid-rfcs grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-marketplace sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-rfcs sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtooth-sdk-go sawtooth-sdk-java sawtooth-sdk-javascript sawtooth-sdk-python sawtooth-sdk-rust sawtooth-sdk-swift sawtooth-seth sawtooth-supply-chain sawtooth-website transact-contrib transact-rfcs transact-sdk-go transact-sdk-javascript transact "," Shawn Amundson "," vaporos "," amundson
vchinoy-da,vchinoy-da"," blockchain-explorer "," Vinita Chinoy "," vchinoy-da "," vchinoy "," vinitachinoy@yahoo.com
victordrobny,victordrobny"," iroha "," Victor Drobny "," @victordrobny "," drobny@soramitsu.co.jp "," Development
x3medima17,x3medima17"," iroha "," Dumitru Savva "," @x3medima17 "," savva@soramitsu.co.jp "," Development
xspeedcruiser,xspeedcruiser"," blockchain-explorer "," Satheesh Kathamuthu "," xspeedcruiser "," satheeshk "," satheesh.ceg@gmail.com
yannoban,yannoban"," iroha "," Yanno Ban "," @yannoban "," ban.yanno@nbc.org.kh "," Development
yeasy,yeasy"," cello-analytics cello fabric-sdk-py "," Baohua Yang "," yeasy "," baohua "," yangbaohua@gmail.com
zhaochy1990,zhaochy1990"," fabric-chaincode-node fabric-sdk-node "," Chaoyi Zhao "," [zhaochy1990,zhaochy1990"," zhaochy "," <zhaochy_2015@hotmail.com>
