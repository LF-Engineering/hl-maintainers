#!/bin/bash
# GitHub;Email;Name;Username1,Username2,...,UsernameN;Project1,Project2,..,ProjectN
# GitHub: required
# Email, Name: can be empty
# Usernames: can be empty, single value or list , separated
# Projects: required at least one, can be a list , separated
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
edwardmack;;dward Mack;mackcom;hyperledger/besu
edwardsm26;dev.edwardsm@gmail.com;Mekia Edwards;;hyperledger/explorer
eloaverona;;;;hyperledger/grid,hyperledger/sawtooth,hyperledger/transact
feihujiang;;FeihuJiang;FlyingTiger;hyperledger/caliper
fqutishat;firas.qutishat@securekey.com;Firas.Qutishat;;hyperledger/
genasmorgan;;Gena Morgan;Gena;hyperledger/grid
gennadylaventman;gennady@il.ibm.com;Gennady Laventman;gennadyl;hyperledger/fabric
grantnoble;;Grant Noble;;hyperledger/besu
gregdhill;greg.hill@monax.io;Greg Hill;;hyperledger/burrow
grimadas;bulat@soramitsu.co.jp;Bulat Nasrulin;;hyperledger/iroha
grkvlt;;Andrew Donald Kennedy;;hyperledger/sawtooth
guoger;guojiannan1101@gmail.com;Jay Guo;;hyperledger/fabric
haojun;;HaojunZhou;;hyperledger/caliper
harrisob;beharrison@nc.rr.com;Bret Harrison;bretharrison;hyperledger/fabric
heatherlp;heatherpollard0@gmail.com;Heather Pollard;heatherp;hyperledger/fabric
hightall;hightallyht@gmail.com;Haitao Yue;;hyperledger/cello
igor-egorov;igor@soramitsu.co.jp;Igor Egorov;;hyperledger/iroha
iikirilov;;Ivaylo Kirilov;;hyperledger/besu
ineffectualproperty;;Kelly Olson;kelly_;hyperledger/sawtooth
jeevasang;sankarapandian@dtcc.com;Jeeva Sankarapandian;jeevas;hyperledger/explorer
jframe;;Jason Frame;;hyperledger/besu
joealewine;joe.alewine@ibm.com;Joe Alewine;;hyperledger/fabric
joshuafernandes;;Joshua Fernandes;;hyperledger/besu
jsmitchell;;James Mitchell;;hyperledger/sawtooth,hyperledger/grid,hyperledger/transact
jt-nti;jamest@uk.ibm.com;James Taylor;jtonline;hyperledger/fabric
jyellick;jyellick@us.ibm.com;Jason Yellick;;hyperledger/fabric
kamilsa;kamil@soramitsu.co.jp;Kamil Salakhiev;;hyperledger/iroha
l4l;evgenii@soramitsu.co.jp;Evgenii Mininbaev;;hyperledger/iroha
laSinteZ;viacheslav@soramitsu.co.jp;Vyacheslav Bikbaev;;hyperledger/iroha
lebdron;andrei@soramitsu.co.j;Andrei Lebedev;;hyperledger/iroha
lehors;lehors@us.ibm.com;Arnaud Le Hors;;hyperledger/fabric
ltseeley;;Logan Seeley;;hyperledger/sawtooth,hyperledger/transact
lucassaldanha;;Lucas Saldanha;;hyperledger/besu
luckychess;konstantin@soramitsu.co.jp;Konstantin Munichev;;hyperledger/iroha
macfarla;;Sally MacFarlane;;hyperledger/besu
mark-terry;;Mark Terry;m.terry;hyperledger/besu
mastersingh24;gari.r.singh@gmail.com;Gari Singh;;hyperledger/fabric,hyperledger/transact
matkt;;Karim Taam;;hyperledger/besu
mbaxter;;Meredith Baxter;;hyperledger/besu
mbwhite;whitemat@uk.ibm.com;Matthew B White;;hyperledger/fabric
muralisrini;srinivasan.muralidharan99@gmail.com;Srinivasan Muralidharan;muralisr;hyperledger/fabric
muratovv;fyodor@soramitsu.co.jp;Fyodor Muratov;;hyperledger/iroha
neewy;n.yushkevich@hotmail.com;Nikolai Iushkevich;;hyperledger/iroha
nekia;atsushin@fast.au.fujitsu.com;Atsushi Neki;;hyperledger/explorer
nfrunza;nfrunza@gmail.com;Nik Frunza;;hyperledger/explorer
nickaleks;alekseev@soramitsu.co.jp;Nikita Alekseev;;hyperledger/iroha
nikhil550;nikhilg550@gmail.com;Nikhil Gupta;nikhilgupta;hyperledger/fabric
nklincoln;;Nick Lincoln;nkl199;hyperledger/caliper
odowdaibm;a_o-dowd@uk.ibm.com;Anthony O\'Dowd;;hyperledger/fabric
pamandrejko;pama@ibm.com;Pam Andrejko;;hyperledger/fabric
peterschwarz;;Peter Schwarz;pschwarz;hyperledger/sawtooth,hyperledger/grid,hyperledger/transact
phymbert;pierrick.hymbert@gmail.com;Pierrick Hymbert;;hyperledger/burrow
pinges;;Stefan Pingel;;hyperledger/besu
rain-on;;Trent Mohay;trent.mohay;hyperledger/besu
rberg2;;Richard Berg;;hyperledger/grid,hyperledger/sawtooth,hyperledger/transact
rbuysse;;Ryan Beck-Buysse;;hyperledger/grid,hyperledger/sawtooth,hyperledger/transact
rojotek;;Rob Dawson;RobDawson;hyperledger/besu
ryanlassigbanks;;Ryan Banks;robinbanks;hyperledger/transact
ryuo88;okada@soramitsu.co.jp;Ryu Okada;;hyperledger/iroha
saad-karim;skarim@us.ibm.com;Saad Karim;skarim;hyperledger/fabric
scottz64;scottz@us.ibm.com;Scott Zwierzynski;scottz;hyperledger/fabric
seanyoung;sean@mess.org;Sean Young;;hyperledger/burrow
sgregglives;;Steven Gregg;sagregg;hyperledger/besu
shannynalayna;;;;hyperledger/grid,hyperledger/sawtooth,hyperledger/transact
shemnon;;Danno Ferrin;;hyperledger/besu
silasdavis;silas@monax.io;Silas Davis;;hyperledger/burrow
smithbk;bksmith@us.ibm.com;Keith Smith;;hyperledger/fabric
sofiter;sophia.terzi@gmail.com;Sofia Terzi;st;hyperledger/besu
sstone1;sstone1@uk.ibm.com;Simon Stone;;hyperledger/fabric
stinger112;stinger112@gmail.com;Arseniy Fokin;;hyperledger/iroha
suryalnvs;slanka@us.ibm.com;Surya Lanka;slanka;hyperledger/fabric
swetharepakula;srepaku@us.ibm.com;Swetha Repakula;swetha;hyperledger/fabric
sykesm;sykesmat@us.ibm.com;Matthew Sykes;;hyperledger/fabric
takemiyamakoto;takemiya@soramitsu.co.jp;Makoto Takemiya;;hyperledger/iroha
timbeiko;;Tim Beiko;;hyperledger/besu
tmarkovski;;Tomislav Markovski;tomislav;hyperledger/sawtooth
tongli;litong01@us.ibm.com;Tong Li;;hyperledger/cello
troyronda;troy@troyronda.com;Troy Ronda;;hyperledger/fabric
tyvision;tyukushin@soramitsu.co.jp;Anatoly Tyukushin;;hyperledger/iroha
umadiraju;umapathi.madiraju@gmail.com;Umapathi Madiraju;umadiraj;hyperledger/explorer
usmansaleem;;Usman Saleem;;hyperledger/besu
vaporos;;Shawn Amundson;amundson;hyperledger/sawtooth,hyperledger/grid,hyperledger/transact
vchinoy-da;vinitachinoy@yahoo.com;Vinita Chinoy;vchinoy;hyperledger/explorer
victordrobny;drobny@soramitsu.co.jp;Victor Drobny;;hyperledger/iroha
x3medima17;savva@soramitsu.co.jp;Dumitru Savva;;hyperledger/iroha
xspeedcruiser;atheesh.ceg@gmail.com;Satheesh Kathamuthu;satheeshk;hyperledger/explorer
yannoban;ban.yanno@nbc.org.kh;Yanno Ban;;hyperledger/iroha
yeasy;yangbaohua@gmail.com;Baohua Yang;baohua;hyperledger/cello
zhaochy1990;zhaochy_2015@hotmail.com;Chaoyi Zhao;zhaochy;hyperledger/fabric
EOM
)
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
