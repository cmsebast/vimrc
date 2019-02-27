" Vim syntax file
" Language: Roboteq controller basic language
" Maintainer: Cbass
" Latest Revision: 25 Feb 2019

if exists("b:current_syntax")
  finish
endif

"Operators1 ( ) , / + - * &lt  &gt  = [ ]

syn case ignore
syn keyword mbsBlockCmd And AndWhile As Boolean Continue Dim Do Else ElseIf End Evaluate Exit Explicit False For GoSub GoTo If Integer Loop Mod Next Not Option Or Print Return Step Terminate Then To ToBool True Until While XOr
syn keyword mbsDesc SetConfig SetCommand GetConfig GetValue SetTimerCount SetTimerState GetTimerCount GetTimerState Wait Abs Atan Cos Sin Sqrt SetCANCommand SetCANConfig FetchCANValue FetchCANConfig IsCANValueReady IsCANConfigReady ReadCANValue ReadCANConfig ScanCANValue IsScannedCANReady ReadScannedCANValue IsCANNodeAlive SetCANCommand
syn keyword mbsSpec top top:
syn case match

syn keyword mbsType _A _AADJ _ABCNTR _ABSPEED _AC _ACCEL _ACS _ACTR _ADB _AI _AIC _AINA _ALIM _ALIN _AMAX _AMAXA _AMIN _AMINA _AMOD _AMS _ANAIN _ANAINC _ANG _ANGLE _AO _AOUT _APOL _ASI _ASW _ATGA _ATGD _ATRIG _AX _B _BA _BADJ _BADV _BATAMPS _BCR _BEE _BFBK _BHL _BHLA _BHOME _BIND _BKD _BLCNTR _BLFB _BLL _BLLA _BLRCNTR _BLRSPEED _BLSPEED _BLSTD _BMOD _BMSASW _BMSPSW _BND _BOOL _BOOL _BPOL _BS _BSR _BZPW _C _CALIVE _CAN _CANSEND _CAS _CB _CBR _CELLSW _CEN _CF _CHB _CIA _CIP _CIS _CL _CLERD _CLIN _CLSN _CMDANA _CMDPLS _CMDSER _CNOD _CPRI _CR _CS _CSRT _CSW _CTPS _CTRIM _D _D0 _D1 _DC _DECEL _DFC _DI _DIGIN _DIGOUT _DIM _DIN _DINA _DINL _DO _DOA _DOL _DOUT _DR _DREACHED _DRES _DS _DSET _DX _E _ECHOF _EE _EES _EESAV _EHL _EHLA _EHOME _ELL _ELLA _EMOD _EO _EOUT _EPPR _EQS _ESTOP _EX _F _FC _FEEDBK _FF _FLTFLAG _FM _FS _G _GO _GRNG _GY _GYRO _GYZR _H _HCOUNTER _HCT _HDATA _HDEL _HDT _HOME _HS _HSENSE _ICAP _K _KD _KI _KIF _KP _KPF _LEFT _LINES _LK _LOCKED _LPERR _M _MA _MAC _MACC _MALL _MDEC _MDIR _MEMS _MG _MGD _MGDET _MGM _MGMRKR _MGO _MGS _MGSTATUS _MGT _MGTRACK _MGY _MGYRO _ML _MMAG _MMOD _MOTAMPS _MOTCMD _MOTFLAG _MOTPOS _MOTPWR _MOTVEL _MPEAK _MPOSREL _MREF _MRS _MS _MSENS _MSTOP _MSZER _MVEL _MXMD _MXPF _MXPR _MXRPM _MXTRN _MZ _NXTACC _NXTDEC _NXTPOS _NXTPOSR _NXTVEL _OVH _OVL _P _PCTR _PDB _PI _PIC _PIDM _PINA _PK _PLIN _PLSIN _PLSINC _PMAX _PMAXA _PMIN _PMINA _PMOD _PPOL _PR _PRX _PSW _PWMF _PWMI _PWMM _PWMX _PX _QO _QOUT _RAWSENSADC _RC _RCOUT _RELCNTR _RELSPEED _RF _RGYRO _RIGHT _RMA _RMG _RMM _RSBR _RWD _S _SBLCNTR _SCC _SCRO _SENCNTR _SKCTR _SKDB _SKLIN _SKMAX _SKMIN _SKUSE _SPEKTRUM _SPOL _SR _ST _STATS _STFLAG _SX _T _TC2 _TC4 _TC5 _TEMP _THLD _TID _TIME _TINV _TM _TMS _TPOL _TR _TRACK _TRF2 _TRF4 _TRF5 _TS _TV _TW2 _TW4 _TW5 _TWAD _TWDT _TX _TXOF _TZER _UVL _V _VAR _VAR _VOLTS _ZADJ _ZAIC _ZDA _ZDM _ZDT _ZK1 _ZK2 _ZM0 _ZMT _ZOA _ZOM _ZP0 _ZPAC _ZPAO _ZQB _ZQW _ZR0 _ZRM _ZSMC

syn region mbsTypeBlock start="(" end=")" fold transparent contains=mbsType,celNumber

" Regular int like number with - + or nothing in front
syn match celNumber '\d\+' 
syn match celNumber '[-+]\d\+' 

" Floating point number with decimal no E or e
syn match celNumber '\d\+\.\d*' 
syn match celNumber '[-+]\d\+\.\d*' 

" Floating point like number with E and no decimal point (+,-)
syn match celNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+' 
syn match celNumber '\d[[:digit:]]*[eE][\-+]\=\d\+' 

" Floating point like number with E and decimal point (+,-)
syn match celNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' 
syn match celNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' 

" Match 0x* and 0x* patterns and everything that follows
syn match celNumber display "0x\x\('\=\x\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
syn match celNumber display "0b[01]\('\=[01]\+\)*\(u\=l\{0,2}\|ll\=u\)\>"

syn keyword celTodo contained TODO FIXME XXX NOTE
syn match celComment "'.*$" contains=celTodo

let b:current_syntax='MicroBasic'

hi def link celComment      Comment
hi def link celNumber       Constant
hi def link mbsType         Identifier
hi def link mbsBlockCmd     Statement
hi def link mbsDesc         PreProc
"Type
hi def link mbsSpec         Special
"Underlined
"Ignore
"Error
hi def link celTodo         Todo

