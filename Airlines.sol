{\rtf1\ansi\ansicpg1252\cocoartf2818
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue255;\red246\green249\blue254;\red45\green52\blue75;
\red0\green0\blue0;\red19\green118\blue70;\red45\green174\blue161;\red15\green112\blue1;\red11\green97\blue255;
\red223\green33\blue121;\red193\green160\blue9;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c100000;\cssrgb\c97255\c98039\c99608;\cssrgb\c23137\c26667\c36863;
\cssrgb\c0\c0\c0;\cssrgb\c3529\c52549\c34510;\cssrgb\c19608\c72941\c69412;\cssrgb\c0\c50196\c0;\cssrgb\c0\c48235\c100000;
\cssrgb\c90980\c24314\c54902;\cssrgb\c80392\c68235\c784;}
\margl1440\margr1440\vieww17120\viewh13200\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs28\fsmilli14400 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 pragma\cf4 \strokec4  \cf2 \strokec2 solidity\cf4 \strokec4  \strokec5 ^\cf6 \strokec6 0.8.26.0\cf4 \strokec5 ;\cb1 \strokec4 \
\cf2 \cb3 \strokec2 contract\cf4 \strokec4  Airlines \strokec5 \{\cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3     \cf2 \strokec2 address\cf4 \strokec4  chairPerson\strokec5 ;\cb1 \strokec4 \
\cb3     \cf2 \strokec2 struct\cf4 \strokec4  details \strokec5 \{\cb1 \strokec4 \
\cb3         \cf2 \strokec2 uint\cf4 \strokec4  escrow\strokec5 ;\cb1 \strokec4 \
\cb3         \cf2 \strokec2 uint\cf4 \strokec4  status\strokec5 ;\cb1 \strokec4 \
\cb3         \cf2 \strokec2 uint\cf4 \strokec4  hashOfDetails\strokec5 ;\cb1 \strokec4 \
\cb3     \strokec5 \}\cb1 \strokec4 \
\cb3     \cb1 \
\cb3     \cf2 \strokec2 mapping\cf4 \strokec4  \strokec5 (\cf2 \strokec2 address\cf4 \strokec4 =>details\strokec5 )\strokec4  \cf7 \strokec7 public\cf4 \strokec4  balanceDetails\strokec5 ;\cb1 \strokec4 \
\cb3     \cf2 \strokec2 mapping\cf4 \strokec4  \strokec5 (\cf2 \strokec2 address\cf4 \strokec4 =>\cf2 \strokec2 uint\cf4 \strokec5 )\strokec4  membership\strokec5 ;\cb1 \strokec4 \
\
\cb3     \cf8 \strokec8 // modifiers or rules\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 modifier\cf4 \strokec4  onlyChairPerson \strokec5 \{\cb1 \strokec4 \
\cb3         \cf9 \strokec9 require\cf4 \strokec5 (\cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender \strokec5 ==\strokec4  chairPerson\strokec5 );\cb1 \strokec4 \
\cb3         _\strokec5 ;\cb1 \strokec4 \
\cb3     \strokec5 \}\cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 modifier\cf4 \strokec4  onlyMember \strokec5 \{\cb1 \strokec4 \
\cb3         \cf9 \strokec9 require\cf4 \strokec4  \strokec5 (\strokec4 membership\strokec5 [\cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender\strokec5 ]\strokec4  \strokec5 ==\strokec4  \cf6 \strokec6 1\cf4 \strokec5 );\cb1 \strokec4 \
\cb3         _\strokec5 ;\cb1 \strokec4 \
\cb3     \strokec5 \}\cb1 \strokec4 \
\
\cb3     \cf8 \strokec8 // constructor function\cf4 \cb1 \strokec4 \
\cb3     \cf10 \strokec10 constructor\cf4 \strokec5 ()\strokec4  \cf7 \strokec7 public\cf4 \strokec4  \cf7 \strokec7 payable\cf4 \strokec4  \strokec5 \{\cb1 \strokec4 \
\
\cb3         chairPerson \strokec5 =\strokec4  \cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender\strokec5 ;\cb1 \strokec4 \
\cb3         membership\strokec5 [\cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender\strokec5 ]\strokec4  \strokec5 =\strokec4  \cf6 \strokec6 1\cf4 \strokec5 ;\cb1 \strokec4 \
\cb3         balanceDetails\strokec5 [\cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender\strokec5 ].\strokec4 escrow \strokec5 =\strokec4  \cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 value\strokec5 ;\cb1 \strokec4 \
\cb3     \strokec5 \}\cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 function\cf4 \strokec4  register\strokec5 ()\strokec4  \cf7 \strokec7 public\cf4 \strokec4  \cf7 \strokec7 payable\cf4 \strokec4  \strokec5 \{\cb1 \strokec4 \
\cb3         \cf2 \strokec2 address\cf4 \strokec4  AirlineA \strokec5 =\strokec4  \cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender\strokec5 ;\cb1 \strokec4 \
\cb3         membership\strokec5 [\strokec4 AirlineA\strokec5 ]\strokec4  \strokec5 =\strokec4  \cf6 \strokec6 1\cf4 \strokec5 ;\cb1 \strokec4 \
\cb3         balanceDetails\strokec5 [\cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender\strokec5 ].\strokec4 escrow \strokec5 =\strokec4  \cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 value\strokec5 ;\cb1 \strokec4 \
\cb3     \strokec5 \}\cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 function\cf4 \strokec4  unregister\strokec5 (\cf2 \strokec2 address\cf4 \strokec4  \cf7 \strokec7 payable\cf4 \strokec4  AirlineZ\strokec5 )\strokec4  onlyChairPerson \cf7 \strokec7 public\cf4 \strokec4  \strokec5 \{\cb1 \strokec4 \
\cb3         \cf11 \strokec11 if\cf4 \strokec4  \strokec5 (\strokec4 chairPerson \strokec5 !=\strokec4  \cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender\strokec5 )\strokec4  \strokec5 \{\cb1 \strokec4 \
\cb3             \cf9 \strokec9 revert\cf4 \strokec5 ();\cb1 \strokec4 \
\cb3         \strokec5 \}\cb1 \strokec4 \
\cb3         membership\strokec5 [\strokec4 AirlineZ\strokec5 ]\strokec4  \strokec5 =\strokec4  \cf6 \strokec6 0\cf4 \strokec5 ;\cb1 \strokec4 \
\
\cb3         \cf8 \strokec8 // return escrow to leaving airline: verify other conditions\cf4 \cb1 \strokec4 \
\cb3         AirlineZ\strokec5 .\strokec4 transfer\strokec5 (\strokec4 balanceDetails\strokec5 [\strokec4 AirlineZ\strokec5 ].\strokec4 escrow\strokec5 );\cb1 \strokec4 \
\cb3         balanceDetails\strokec5 [\strokec4 AirlineZ\strokec5 ].\strokec4 escrow \strokec5 =\strokec4  \cf6 \strokec6 0\cf4 \strokec5 ;\cb1 \strokec4 \
\cb3     \strokec5 \}\cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 function\cf4 \strokec4  request\strokec5 (\cf2 \strokec2 address\cf4 \strokec4  toAirline\strokec5 ,\strokec4  \cf2 \strokec2 uint\cf4 \strokec4  hashOfDetails\strokec5 )\strokec4  onlyMember \cf7 \strokec7 public\cf4 \strokec4  \strokec5 \{\cb1 \strokec4 \
\cb3         \cf11 \strokec11 if\cf4 \strokec4  \strokec5 (\strokec4 membership\strokec5 [\strokec4 toAirline\strokec5 ]\strokec4  \strokec5 !=\strokec4  \cf6 \strokec6 1\cf4 \strokec5 )\strokec4  \strokec5 \{\cb1 \strokec4 \
\cb3             \cf9 \strokec9 revert\cf4 \strokec5 ();\cb1 \strokec4 \
\cb3         \strokec5 \}\cb1 \strokec4 \
\cb3         balanceDetails\strokec5 [\cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender\strokec5 ].\strokec4 status \strokec5 =\strokec4  \cf6 \strokec6 0\cf4 \strokec5 ;\cb1 \strokec4 \
\cb3         balanceDetails\strokec5 [\cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender\strokec5 ].\strokec4 hashOfDetails \strokec5 =\strokec4  hashOfDetails\strokec5 ;\cb1 \strokec4 \
\cb3     \strokec5 \}\cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 function\cf4 \strokec4  response\strokec5 (\cf2 \strokec2 address\cf4 \strokec4  fromAirline\strokec5 ,\strokec4  \cf2 \strokec2 uint\cf4 \strokec4  hashOfDetails\strokec5 ,\strokec4  \cf2 \strokec2 uint\cf4 \strokec4  done\strokec5 )\strokec4  onlyMember \cf7 \strokec7 public\cf4 \strokec4  \strokec5 \{\cb1 \strokec4 \
\cb3         \cf11 \strokec11 if\cf4 \strokec4  \strokec5 (\strokec4 membership\strokec5 [\strokec4 fromAirline\strokec5 ]\strokec4  \strokec5 !=\strokec4  \cf6 \strokec6 1\cf4 \strokec5 )\strokec4  \strokec5 \{\cb1 \strokec4 \
\cb3             \cf9 \strokec9 revert\cf4 \strokec5 ();\cb1 \strokec4 \
\cb3         \strokec5 \}\cb1 \strokec4 \
\cb3         balanceDetails\strokec5 [\cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender\strokec5 ].\strokec4 status \strokec5 =\strokec4  done\strokec5 ;\cb1 \strokec4 \
\cb3         balanceDetails\strokec5 [\strokec4 fromAirline\strokec5 ].\strokec4 hashOfDetails \strokec5 =\strokec4  hashOfDetails\strokec5 ;\cb1 \strokec4 \
\cb3     \strokec5 \}\cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 function\cf4 \strokec4  settlePayment\strokec5 (\cf2 \strokec2 address\cf4 \strokec4  \cf7 \strokec7 payable\cf4 \strokec4  toAirline\strokec5 )\strokec4  onlyMember \cf7 \strokec7 payable\cf4 \strokec4  \cf7 \strokec7 public\cf4 \strokec4  \strokec5 \{\cb1 \strokec4 \
\cb3         \cf2 \strokec2 address\cf4 \strokec4  fromAirline \strokec5 =\strokec4  \cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 sender\strokec5 ;\cb1 \strokec4 \
\cb3         \cf2 \strokec2 uint\cf4 \strokec4  amt \strokec5 =\strokec4  \cf9 \strokec9 msg\cf4 \strokec5 .\strokec4 value\strokec5 ;\cb1 \strokec4 \
\cb3         balanceDetails\strokec5 [\strokec4 toAirline\strokec5 ].\strokec4 escrow \strokec5 =\strokec4  balanceDetails\strokec5 [\strokec4 toAirline\strokec5 ].\strokec4 escrow \strokec5 +\strokec4  amt\strokec5 ;\cb1 \strokec4 \
\
\cb3         \cf8 \strokec8 // amt subtracted from msg.sender and given to toAirline\cf4 \cb1 \strokec4 \
\cb3         toAirline\strokec5 .\strokec4 transfer\strokec5 (\strokec4 amt\strokec5 );\cb1 \strokec4 \
\cb3     \strokec5 \}\cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec5 \}\cb1 \strokec4 \
}