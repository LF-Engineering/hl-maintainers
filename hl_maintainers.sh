#!/bin/bash
# GitHub;Email;Name;Usernames;Project1,Project2,..,ProjectN
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
;;;;hyperledger/
;;;;hyperledger/
;;;;hyperledger/
;;;;hyperledger/
;;;;hyperledger/
;;;;hyperledger/
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
TomBarnes,TomBarnes"," avalon sawtooth-rfcs "," Thomas J Barnes "," [TomBarnes](https://github.com/TomBarnes) "," @TomBarnes
abdelhamidbakhta,abdelhamidbakhta"," besu "," Abdel Bakhta "," abdelhamidbakhta "," abdelhamidbakhta
adamk1230,adamk1230"," blockchain-explorer "," Adam Kwan "," adamk1230 "," adamk1230 "," adamk1230@gmail.com
adeebahmed,adeebahmed"," grid-rfcs "," Adeeb Ahmed "," adeebahmed "," adeebahmed
agunde406,agunde406"," education-sawtooth-simple-supply grid-contrib grid-rfcs grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-marketplace sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-rfcs sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dotnet sa
ajsutton,ajsutton"," besu "," Adrian Sutton "," ajsutton "," ajsutton
aklenik,aklenik"," caliper "," Attila Klenik "," aklenik "," klenik
alikic,alikic"," fabric-sdk-go "," Aleksandar Likic "," alikic "," aleksandar.likic@securekey.com
aludvik,aludvik"," sawtooth-ansible sawtooth-contrib sawtooth-marketplace "," Adam Ludvik "," aludvik "," adamludvik
andrew-coleman,andrew-coleman"," fabric-gateway-java fabric-sdk-java fabric-sdk-java fabric-sdk-node "," Andrew Coleman"," andrew-coleman "," andrew_coleman@uk.ibm.com
arsulegai,arsulegai"," sawtooth-seth "," Arun S M "," arsulegai "," arsulegai
atoulme,atoulme"," besu "," Antoine Toulme "," atoulme "," atoulme
auntmelmel,auntmelmel"," grid-rfcs "," Melanie Nuce "," auntmelmel "," MelanieNuce
awjh-ibm,awjh-ibm"," fabric-chaincode-node fabric-chaincode-node fabric-contract-api-go "," Andrew Hurt "," [awjh-ibm,awjh-ibm"," awjh-ibm "," <andrew.hurt1@ibm.com>
bakhtin,bakhtin"," iroha "," Artyom Bakhtin "," @bakhtin "," a@bakhtin.net "," Ansible, Jenkins, artifacts
bestbeforetoday,bestbeforetoday"," fabric-gateway-java fabric-sdk-java fabric-sdk-java fabric-sdk-node "," Mark Lewis "," bestbeforetoday"," Mark.S.Lewis@outlook.com
bgravenorst,bgravenorst"," besu-docs besu "," Byron Gravenorst "," bgravenorst "," bgravenorst
blt5037,blt5037"," fabric-test "," Brett Logan "," blt5037 "," brett "," Brett.T.Logan@ibm.com
boydjohnson,boydjohnson"," sawtooth-marketplace sawtooth-supply-chain "," Boyd Johnson "," boydjohnson "," boydjohnson
bstasyszyn,bstasyszyn"," fabric-sdk-go "," Bob Stasyszyn "," bstasyszyn "," bob.stasyszyn@securekey.com
c0rwin,c0rwin"," fabric-amcl fabric-chaincode-java fabric homebrew-fabric "," Artem Barger "," [c0rwin,c0rwin"," c0rwin "," <bartem@il.ibm.com>
chenette,chenette"," education-sawtooth-simple-supply grid-contrib grid-website grid sawtooth-core sawtooth-devmode sawtooth-pbft sawtooth-poet sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtooth-sdk-go sawtooth-sdk-java sawtooth-sdk-javascript sawtooth-sdk-python sawtooth-sdk-rust sawtooth-supply-
christo4ferris,christo4ferris"," fabric-amcl fabric-chaincode-evm fabric-lib-go fabric-samples fabric-sdk-node fabric homebrew-fabric "," Chris Ferris "," [christo4ferris,christo4ferris"," cbf "," <chris.ferris@gmail.com>
cianx,cianx"," sawtooth-core sawtooth-devmode sawtooth-poet sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtooth-sdk-go sawtooth-sdk-java sawtooth-sdk-javascript sawtooth-sdk-python sawtooth-sdk-rust "," Cian Montgomery "," cianx "," cianx
compleatang,compleatang"," burrow "," Casey Kuhlman "," compleatang "," <casey@monax.io>
danintel,danintel"," avalon education-sawtooth-simple-supply sawtooth-website "," Daniel Anderson "," [danintel](https://github.com/danintel) "," @danintel
davececchi,davececchi"," grid-contrib grid-rfcs grid-website grid transact-rfcs "," Dave Cecchi "," davececchi "," cecchi
dcmiddle,dcmiddle"," avalon education-sawtooth-simple-supply grid-contrib grid-rfcs grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-marketplace sawtooth-poet sawtooth-raft sawtooth-rfcs sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtooth-sd
delventhalz,delventhalz"," sawtooth-supply-chain "," Zac Delventhal "," delventhalz "," zac
denali49,denali49"," fabric-amcl fabric-ca fabric homebrew-fabric "," Chris Gabriel "," [denali49,denali49"," cmgabriel "," <alaskadd@gmail.com>
denyeart,denyeart"," fabric-amcl fabric-ca fabric-lib-go fabric-samples fabric homebrew-fabric "," Dave Enyeart "," [denyeart,denyeart"," dave.enyeart "," <enyeart@us.ibm.com>
desktophero,desktophero"," grid-rfcs "," Jason Walker "," desktophero "," desktophero
dexhunter,dexhunter"," fabric-sdk-py "," Dixing Xu "," dexhunter "," dexhunter "," dixingxu@gmail.com
dnewh,dnewh"," transact-sdk-javascript "," Davey Newhall "," dnewh "," newhall
dongmingh,dongmingh"," fabric-test "," Dongming Hwang "," dongmingh "," dongming "," dongming@ibm.com
dongwangdw,dongwangdw"," fabric-sdk-py "," Dong Wang "," dongwangdw "," wangdong "," xdragon007@gmail.com
dplumb94,dplumb94"," education-sawtooth-simple-supply grid-contrib grid-rfcs grid-website grid sawtooth-core sawtooth-devmode sawtooth-marketplace sawtooth-poet sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtooth-sdk-go sawtooth-sdk-java sawtooth-sdk-javascript sawtooth-sdk-python sawtooth-sdk-rust
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
jsmitchell,jsmitchell"," education-sawtooth-simple-supply grid-contrib grid-rfcs grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-marketplace sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-rfcs sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dotnet
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
mastersingh24,mastersingh24"," fabric-amcl fabric-ca fabric-chaincode-evm fabric-chaincode-java fabric-lib-go fabric-samples fabric-sdk-go fabric-sdk-node fabric-test fabric homebrew-fabric transact-rfcs "," Gari Singh "," [mastersingh24,mastersingh24"," mastersingh24 "," <gari.r.singh@gmail.
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
odowdaibm,odowdaibm"," fabric-amcl fabric-ca fabric homebrew-fabric "," Anthony O'Dowd "," [odowdaibm,odowdaibm"," odowdaibm "," <a_o-dowd@uk.ibm.com>
pamandrejko,pamandrejko"," fabric-amcl fabric-ca fabric homebrew-fabric "," Pam Andrejko "," [pamandrejko,pamandrejko"," pandrejko "," <pama@ibm.com>
peterschwarz,peterschwarz"," education-sawtooth-simple-supply grid-contrib grid-rfcs grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-marketplace sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-rfcs sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dot
phymbert,phymbert"," burrow "," Pierrick Hymbert "," phymbert "," <pierrick.hymbert@gmail.com>
pinges,pinges"," besu "," Stefan Pingel "," pinges "," pinges
rain-on,rain-on"," besu "," Trent Mohay "," rain-on "," trent.mohay
rberg2,rberg2"," grid-contrib grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtooth-sdk-go sawtooth-sdk-java sawtooth-sdk-javascript sawtooth-sdk-python sawtooth
rbuysse,rbuysse"," grid-contrib grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtooth-sdk-go sawtooth-sdk-java sawtooth-sdk-javascript sawtooth-sdk-python sawtoo
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
vaporos,vaporos"," education-sawtooth-simple-supply grid-contrib grid-rfcs grid-website grid sawtooth-ansible sawtooth-contrib sawtooth-core sawtooth-devmode sawtooth-marketplace sawtooth-pbft sawtooth-poet sawtooth-raft sawtooth-rfcs sawtooth-sabre sawtooth-sdk-cxx sawtooth-sdk-dotnet sawtoo
vchinoy-da,vchinoy-da"," blockchain-explorer "," Vinita Chinoy "," vchinoy-da "," vchinoy "," vinitachinoy@yahoo.com
victordrobny,victordrobny"," iroha "," Victor Drobny "," @victordrobny "," drobny@soramitsu.co.jp "," Development
x3medima17,x3medima17"," iroha "," Dumitru Savva "," @x3medima17 "," savva@soramitsu.co.jp "," Development
xspeedcruiser,xspeedcruiser"," blockchain-explorer "," Satheesh Kathamuthu "," xspeedcruiser "," satheeshk "," satheesh.ceg@gmail.com
yannoban,yannoban"," iroha "," Yanno Ban "," @yannoban "," ban.yanno@nbc.org.kh "," Development
yeasy,yeasy"," cello-analytics cello fabric-sdk-py "," Baohua Yang "," yeasy "," baohua "," yangbaohua@gmail.com
zhaochy1990,zhaochy1990"," fabric-chaincode-node fabric-sdk-node "," Chaoyi Zhao "," [zhaochy1990,zhaochy1990"," zhaochy "," <zhaochy_2015@hotmail.com>
